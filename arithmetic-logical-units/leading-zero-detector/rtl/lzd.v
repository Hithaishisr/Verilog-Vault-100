// RTL code for leading zeros detector for a 64-bit data
module lzd (
    clk,
    rst_n,
    start,
    data_in,
    count,
    all_zero,
    busy,
    done
);

  parameter width = 7'd64, count_width = 7;

  input clk, rst_n, start;
  input [(width-1'b1):0] data_in;
  output reg [(count_width-1):0] count;
  output reg all_zero, busy, done;

  // FSM states
  localparam IDLE = 2'd0, CHECK_BIT = 2'd1, DONE = 2'd2;

  reg [1:0] state, nxt_state;
  reg [63:0] data_in_reg;  // internal register to shift and check bits
  reg [ 6:0] lzd_count;  // counts leading zeros

  wire check_bit_sig, done_sig;

  // State register logic
  always @(posedge clk) begin
    if (~rst_n) state <= IDLE;
    else state <= nxt_state;
  end

  // FSM next state logic
  always @(*) begin
    case (state)
      IDLE: begin
        // If start is triggered and data is not all zero, move to CHECK_BIT
        if (start && !busy && data_in != 0) nxt_state = CHECK_BIT;
        // If start is triggered and data is all zero, move directly to DONE
        else if (start && !busy && data_in == 0) nxt_state = DONE;
        else nxt_state = state;
      end
      CHECK_BIT: begin
        // If MSB becomes 1, we found the first '1', go to DONE
        if (data_in_reg[63]) nxt_state = DONE;
        else nxt_state = state;
      end
      DONE: nxt_state = IDLE;  // Return to IDLE after operation completes
      default: nxt_state = IDLE;
    endcase
  end

  // Control signals for CHECK_BIT and DONE states
  assign check_bit_sig = (state == CHECK_BIT);
  assign done_sig = (state == DONE);

  // Main sequential logic
  always @(posedge clk) begin
    if (~rst_n) begin
      // Reset all outputs and internal states
      count <= 0;
      done <= 0;
      busy <= 0;
      all_zero <= 0;
      lzd_count <= 0;
      data_in_reg <= 0;
    end else if (start && !busy) begin
      // Latch the input data and initialize everything on start
      busy <= 1'b1;
      done <= 0;
      all_zero <= 0;
      lzd_count <= 0;
      data_in_reg <= data_in;
    end else if (check_bit_sig) begin
      // Shift left if MSB is 0, increment count
      if (data_in_reg[width-1'b1] == 0) begin
        lzd_count   <= lzd_count + 1'b1;
        data_in_reg <= data_in_reg << 1;
      end
    end else if (done_sig) begin
      // Final result logic when DONE state is reached
      all_zero <= (data_in_reg == 0) ? 1'b1 : 1'b0;
      count <= (data_in_reg == 0) ? width : lzd_count;
      done <= 1'b1;
      busy <= 0;
    end
  end

endmodule
