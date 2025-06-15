// RTL code to add two floating point numbers in 32-bit IEEE 754 format
module floating_point_adder (
    clk,
    a,
    b,
    rst_n,
    start,
    result,
    valid,
    overflow,
    underflow
);

  input clk, rst_n, start;
  input [31:0] a, b;  // 32-bit IEEE 754 inputs
  output reg valid, overflow, underflow;  // Output flags
  output reg [31:0] result;  // 32-bit IEEE 754 result

  // Internal control and state variables
  reg [4:0] count_0;  // Count for normalization (leading 1 detector)
  reg sign_a, sign_b, sign_out;  // Sign bits of operands and result
  reg STATE_CHECK_EXCEPTIONS_end, busy;  // Flags to indicate process state
  reg [7:0] exp_a, exp_b, exp_out;  // Exponents of operands and aligned exponent
  reg [8:0] exp_out_reg;  // 9-bit register to hold final exponent
  reg [23:0] mant_a, mant_a_reg, mant_b, mant_b_reg;  // 24-bit mantissas (with implicit 1)
  reg [23:0] mant_out, mant_out_reg_1;  // Mantissa after operation
  reg [24:0] mant_out_reg_2;  // 25-bit for add carry (1 extra bit)

  // FSM state encoding
  localparam STATE_IDLE = 4'd0, STATE_UNPACK_INPUTS = 4'd1, STATE_CHECK_EXCEPTIONS = 4'd2, STATE_EXCEPTION_DONE = 4'd3, STATE_ADD_OR_SUB = 4'd4,
             STATE_HANDLE_CARRY = 4'd5, STATE_NORMALIZE_SHIFT = 4'd6, STATE_NORMALIZE_MANT = 4'd7, STATE_PACK_OUTPUT = 4'd8;

  reg [3:0] state, nxt_state;

  // State control signals for easier state recognition
  wire state_unpack_inputs_sig, state_check_exceptions_sig, state_add_or_sub_sig,
       state_handle_carry_sig, state_normalize_shift_sig, state_normalize_mant_sig, state_pack_output_sig;

  // FSM - sequential state transition
  always @(posedge clk) begin
    if (~rst_n) begin
      state <= STATE_IDLE;
    end else begin
      state <= nxt_state;
    end
  end

  // FSM - next state logic
  always @(*) begin
    case (state)
      STATE_IDLE: begin
        if (start && !busy) nxt_state = STATE_UNPACK_INPUTS;
        else nxt_state = state;
      end
      STATE_UNPACK_INPUTS: nxt_state = STATE_CHECK_EXCEPTIONS;
      STATE_CHECK_EXCEPTIONS: nxt_state = STATE_EXCEPTION_DONE;
      STATE_EXCEPTION_DONE: begin
        if (STATE_CHECK_EXCEPTIONS_end) nxt_state = STATE_IDLE;
        else nxt_state = STATE_ADD_OR_SUB;
      end
      STATE_ADD_OR_SUB: begin
        if (sign_a ^ sign_b) nxt_state = STATE_NORMALIZE_SHIFT;
        else nxt_state = STATE_HANDLE_CARRY;
      end
      STATE_HANDLE_CARRY: nxt_state = STATE_NORMALIZE_SHIFT;
      STATE_NORMALIZE_SHIFT: nxt_state = STATE_NORMALIZE_MANT;
      STATE_NORMALIZE_MANT: nxt_state = STATE_PACK_OUTPUT;
      STATE_PACK_OUTPUT: nxt_state = STATE_IDLE;
      default: nxt_state = STATE_IDLE;
    endcase
  end

  // Control signal assignments for each FSM state
  assign state_unpack_inputs_sig    = (state == STATE_UNPACK_INPUTS);
  assign state_check_exceptions_sig = (state == STATE_CHECK_EXCEPTIONS);
  assign state_add_or_sub_sig       = (state == STATE_ADD_OR_SUB);
  assign state_handle_carry_sig     = (state == STATE_HANDLE_CARRY);
  assign state_normalize_shift_sig  = (state == STATE_NORMALIZE_SHIFT);
  assign state_normalize_mant_sig   = (state == STATE_NORMALIZE_MANT);
  assign state_pack_output_sig      = (state == STATE_PACK_OUTPUT);

  // Main datapath and control logic
  always @(posedge clk) begin
    if (~rst_n) begin
      // Reset all internal registers and flags
      count_0 <= 0;
      sign_a <= 0;
      sign_b <= 0;
      sign_out <= 0;
      STATE_CHECK_EXCEPTIONS_end <= 0;
      busy <= 0;
      exp_a <= 0;
      exp_b <= 0;
      exp_out <= 0;
      exp_out_reg <= 0;
      mant_a <= 0;
      mant_a_reg <= 0;
      mant_b <= 0;
      mant_b_reg <= 0;
      mant_out <= 0;
      mant_out_reg_1 <= 0;
      mant_out_reg_2 <= 0;
      valid <= 0;
      overflow <= 0;
      underflow <= 0;
      result <= 0;
    end else if (start && !busy) begin
      // Latch input data on start
      count_0 <= 0;
      sign_out <= 0;
      busy <= 1'b1;
      exp_out <= 0;
      exp_out_reg <= 0;
      mant_a <= 0;
      mant_a_reg <= 0;
      mant_b <= 0;
      mant_b_reg <= 0;
      mant_out <= 0;
      mant_out_reg_1 <= 0;
      mant_out_reg_2 <= 0;
      valid <= 0;
      overflow <= 0;
      underflow <= 0;
      STATE_CHECK_EXCEPTIONS_end <= 1'b0;
      sign_a <= a[31];
      sign_b <= b[31];
      exp_a <= a[30:23];
      exp_b <= b[30:23];
    end else if (state_unpack_inputs_sig) begin
      // STATE_UNPACK_INPUTS mantissas and add implicit 1 if exponent is non-zero
      mant_a <= (exp_a != 0 && a[22:0] != 0) ? {1'b1, a[22:0]} : {1'b0, a[22:0]};
      mant_b <= (exp_b != 0 && b[22:0] != 0) ? {1'b1, b[22:0]} : {1'b0, b[22:0]};
    end else if (state_check_exceptions_sig) begin
      if (exp_a == 0 && mant_a == 0) begin
        // A is zero → result = B
        result <= b;
        valid <= 1'b1;
        underflow <= 0;
        overflow <= 0;
        STATE_CHECK_EXCEPTIONS_end <= 1'b1;
        busy <= 0;
      end else if (exp_b == 0 && mant_b == 0) begin
        // B is zero → result = A
        result <= a;
        valid <= 1'b1;
        underflow <= 0;
        overflow <= 0;
        STATE_CHECK_EXCEPTIONS_end <= 1'b1;
        busy <= 0;
      end else if (exp_a == 8'd255 && mant_a == 0 && exp_b == 8'd255 && mant_b == 0) begin
        // Both are infinities
        if (sign_a ^ sign_b) begin
          // Inf - Inf = NaN
          result <= {1'b1, 8'd255, 23'd1};  // NaN
          valid  <= 0;
        end else begin
          result <= {sign_a, 8'd255, 23'd0};  // Inf
          valid  <= 1'b1;
        end
        underflow <= 0;
        overflow <= 0;
        STATE_CHECK_EXCEPTIONS_end <= 1;
        busy <= 0;
      end else if ((exp_a == 8'd255 && mant_a != 0) || (exp_b == 8'd255 && mant_b != 0)) begin
        // One or both operands are NaN
        result <= {(sign_a | sign_b), 8'd255, 23'd1};  // NaN
        valid <= 1'b1;
        underflow <= 0;
        overflow <= 0;
        STATE_CHECK_EXCEPTIONS_end <= 1;
        busy <= 0;
      end else if (exp_a == 8'd255 && mant_a == 0) begin
        // A is Inf
        result <= {sign_a, 8'd255, 23'd0};
        valid <= 1'b1;
        underflow <= 0;
        overflow <= 0;
        STATE_CHECK_EXCEPTIONS_end <= 1;
        busy <= 0;
      end else if (exp_b == 8'd255 && mant_b == 0) begin
        // B is Inf
        result <= {sign_b, 8'd255, 23'd0};
        valid <= 1'b1;
        underflow <= 0;
        overflow <= 0;
        STATE_CHECK_EXCEPTIONS_end <= 1;
        busy <= 0;
      end else begin
        // Align exponents by shifting mantissas
        if (exp_a > exp_b) begin
          exp_out <= exp_a;
          mant_a_reg <= mant_a;
          mant_b_reg <= mant_b >> (exp_a - exp_b);
        end else if (exp_a < exp_b) begin
          exp_out <= exp_b;
          mant_a_reg <= mant_a >> (exp_b - exp_a);
          mant_b_reg <= mant_b;
        end else begin
          exp_out <= exp_a;
          mant_a_reg <= mant_a;
          mant_b_reg <= mant_b;
        end
      end
    end else if (state_add_or_sub_sig) begin
      // Perform subtraction if signs differ
      if (sign_a ^ sign_b) begin
        if (mant_a_reg > mant_b_reg) begin
          mant_out <= mant_a_reg - mant_b_reg;
          sign_out <= sign_a;
        end else begin
          mant_out <= mant_b_reg - mant_a_reg;
          sign_out <= sign_b;
        end
      end else begin
        // Add mantissas if signs are same
        mant_out_reg_2 <= mant_a_reg + mant_b_reg;
        sign_out <= sign_a;
      end
    end else if (state_handle_carry_sig) begin
      // Normalize if addition caused overflow (carry out)
      if (mant_out_reg_2[24] == 1'b1) begin
        mant_out <= mant_out_reg_2[24:1];
        exp_out_reg <= exp_out + 1'b1;
      end else begin
        mant_out <= mant_out_reg_2[23:0];
      end
    end else if (state_normalize_shift_sig) begin
      case (1'b1)
        mant_out[23]: count_0 <= 5'd0;
        mant_out[22]: count_0 <= 5'd1;
        mant_out[21]: count_0 <= 5'd2;
        mant_out[20]: count_0 <= 5'd3;
        mant_out[19]: count_0 <= 5'd4;
        mant_out[18]: count_0 <= 5'd5;
        mant_out[17]: count_0 <= 5'd6;
        mant_out[16]: count_0 <= 5'd7;
        mant_out[15]: count_0 <= 5'd8;
        mant_out[14]: count_0 <= 5'd9;
        mant_out[13]: count_0 <= 5'd10;
        mant_out[12]: count_0 <= 5'd11;
        mant_out[11]: count_0 <= 5'd12;
        mant_out[10]: count_0 <= 5'd13;
        mant_out[9]: count_0 <= 5'd14;
        mant_out[8]: count_0 <= 5'd15;
        mant_out[7]: count_0 <= 5'd16;
        mant_out[6]: count_0 <= 5'd17;
        mant_out[5]: count_0 <= 5'd18;
        mant_out[4]: count_0 <= 5'd19;
        mant_out[3]: count_0 <= 5'd20;
        mant_out[2]: count_0 <= 5'd21;
        mant_out[1]: count_0 <= 5'd22;
        mant_out[0]: count_0 <= 5'd23;
        default: count_0 <= 5'd0;
      endcase
      exp_out_reg <= (mant_out_reg_2[24] == 1'b1) ? exp_out_reg : exp_out;
    end else if (state_normalize_mant_sig) begin
      // Normalize mantissa and adjust exponent
      mant_out_reg_1 <= mant_out << count_0;
      if (exp_out_reg > {4'd0, count_0}) begin
        exp_out_reg <= exp_out_reg - count_0;
      end else begin
        exp_out_reg <= 0;
      end
    end else if (state_pack_output_sig) begin
      // Final result packing and overflow/underflow checks
      if (exp_out_reg >= 9'd255) begin
        overflow <= 1'b1;
        result <= {sign_out, 8'd255, 23'd0};  // Infinity
        valid <= 0;
      end else if (exp_out_reg == 9'd0 || exp_out_reg <= 9'd1) begin
        underflow <= 1'b1;
        result <= {sign_out, 31'd0};  // Zero
        valid <= 0;
      end else begin
        result <= {sign_out, exp_out_reg[7:0], mant_out_reg_1[22:0]};
        valid <= 1'b1;
        underflow <= 0;
        overflow <= 0;
      end
      busy <= 0;
    end
  end

endmodule
