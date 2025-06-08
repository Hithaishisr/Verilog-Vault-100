// RTL for divider using non-restoring division
module non_restoring_divider (
    clk,
    rst,
    start,
    dividend,
    divisor,
    signed_op,
    quotient,
    remainder,
    done,
    error,
    busy
);

  // FSM state encoding
  localparam reset = 3'd0, 
             sign_detection = 3'd1, 
             shift = 3'd2, 
             operate = 3'd3, 
             decide = 3'd4, 
             finish = 3'd5;

  // Configurable data width and counter width
  parameter width = 8, N_width = 4;

  // Inputs
  input clk, rst, start, signed_op;
  input [(width-1):0] dividend;
  input [(width-1):0] divisor;

  // Outputs
  output reg done, error, busy;
  output reg [(width-1):0] quotient, remainder;

  // Internal Registers
  reg [(width-1):0] Acc, dividend_reg, divisor_reg;  // Accumulator, Dividend Copy, Divisor Copy
  reg [(width-1):0] shift_acc, shift_dividend_reg;  //Registers for storing shifted Acc and dividend
  reg [(N_width-1):0] N;  // Bit counter for iterations

  reg [2:0] state, next_state;  // FSM state registers

  // FSM state control wires
  wire shift_en, sign_detection_en, operate_en, decide_en;

  // FSM sequential logic - state update on clock
  always @(posedge clk) begin
    if (rst) begin
      state <= reset;
    end else begin
      state <= next_state;
    end
  end

  // FSM combinational logic - next state transitions
  always @(*) begin
    case (state)
      reset: begin
        if (start && !busy && signed_op) next_state = sign_detection;
        else if (start && !busy) next_state = shift;
        else next_state = reset;
      end
      sign_detection: begin
        if (busy && N == 0) next_state = finish;
        else next_state = shift;
      end
      shift: begin
        if (busy && N == 0) next_state = finish;
        else next_state = operate;
      end
      operate: begin
        if (busy && N == 0) next_state = finish;
        else next_state = decide;
      end
      decide: begin
        if (busy && N == 0) next_state = finish;
        else next_state = shift;
      end
      finish:  next_state = finish;
      default: next_state = reset;
    endcase
  end

  // Control signal enables based on state
  assign sign_detection_en = (state == sign_detection);
  assign shift_en = (state == shift);
  assign operate_en = (state == operate);
  assign decide_en = (state == decide);

  // Main logic block - sequential, reacts to clk and rst
  always @(posedge clk) begin
    if (rst) begin
      // Reset all internal states and outputs
      Acc <= 0;
      dividend_reg <= 0;
      divisor_reg <= 0;
      N <= 0;
      done <= 0;
      error <= 0;
      busy <= 0;
      quotient <= 0;
      remainder <= 0;
    end  // Start condition when not already busy/done
    else if (start && !busy && !done) begin
      if (divisor == 0) begin
        // Division by zero error
        error <= 1'b1;
        done <= 1'b1;
        quotient <= 0;
        remainder <= 0;
      end else if (signed_op) begin
        // Handle 2's complement conversion for signed values
        if (dividend[width-1]) dividend_reg <= ~dividend + 1'b1;
        else dividend_reg <= dividend;

        if (divisor[width-1]) divisor_reg <= ~divisor + 1'b1;
        else divisor_reg <= divisor;

        // Only enable actual division when divisor ≤ dividend
        if (sign_detection_en) begin
          if (divisor_reg <= dividend_reg) begin
            Acc <= 0;
            busy <= 1'b1;
            done <= 1'b0;
            error <= 1'b0;
            N <= width;
          end else begin
            error <= 1'b1;
          end
        end
      end else begin
        // Unsigned division path
        if (divisor <= dividend) begin
          Acc <= 0;
          done <= 1'b0;
          busy <= 1'b1;
          error <= 1'b0;
          N <= width;
          dividend_reg <= dividend;
          divisor_reg <= divisor;
        end else begin
          error <= 1'b1;
        end
      end
    end  // Main non-restoring division loop (N-bit iterations)
    else if (busy && N != 0) begin
      if (Acc[width-1] != 1'b0) begin
        // If Acc is negative
        if (shift_en) begin
          {shift_acc, shift_dividend_reg} <= {Acc, dividend_reg} << 1'b1;
        end
        if (operate_en) begin
          Acc <= shift_acc + divisor_reg;
        end
        if (decide_en) begin
          N <= N - 1'b1;
          // Update quotient bit based on new Acc
          if (Acc[width-1] != 1'b0) dividend_reg <= {shift_dividend_reg[(width-1):1], 1'b0};
          else dividend_reg <= {shift_dividend_reg[(width-1):1], 1'b1};
        end
      end else begin
        // If Acc is non-negative
        if (shift_en) begin
          {shift_acc, shift_dividend_reg} <= {Acc, dividend_reg} << 1'b1;
        end
        if (operate_en) begin
          Acc <= shift_acc - divisor_reg;
        end
        if (decide_en) begin
          N <= N - 1'b1;
          if (Acc[width-1] != 1'b0) dividend_reg <= {shift_dividend_reg[(width-1):1], 1'b0};
          else dividend_reg <= {shift_dividend_reg[(width-1):1], 1'b1};
        end
      end
    end  // Post-processing after all N iterations
    else if (busy && N == 0) begin
      if (signed_op) begin
        // Signed remainder fix
        if (Acc[width-1] != 1'b0) begin
          if (dividend[width-1]) remainder <= ~(Acc + divisor_reg) + 1'b1;
          else remainder <= Acc + divisor_reg;
        end else begin
          if (dividend[width-1]) remainder <= ~Acc + 1'b1;
          else remainder <= Acc;
        end

        // Signed quotient fix (based on sign of operands)
        if ((dividend[width-1] ^ divisor[width-1]) != 0) quotient <= ~dividend_reg + 1'b1;
        else quotient <= dividend_reg;
      end else begin
        // Unsigned path
        if (Acc[width-1] != 1'b0) remainder <= Acc + divisor_reg;
        else remainder <= Acc;

        quotient <= dividend_reg;
      end

      // Final flags
      done <= 1'b1;
      busy <= 1'b0;
    end
  end

endmodule
