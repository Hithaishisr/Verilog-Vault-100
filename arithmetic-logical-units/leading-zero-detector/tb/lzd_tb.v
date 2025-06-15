// Testbench for checking the functionality of the leading zero detector
module lzd_tb;

  reg clk, rst_n, start;
  reg  [63:0] data_in;
  wire [ 6:0] count;
  wire all_zero, busy, done;

  integer i;

  // Instantiate the Device Under Test (DUT)
  lzd DUT (
      clk,
      rst_n,
      start,
      data_in,
      count,
      all_zero,
      busy,
      done
  );

  // Task to initialize all inputs
  task initialize;
    begin
      {clk, rst_n} = 0;  // start with clk = 0 and reset inactive
      data_in      = 64'd0;  // default data input to 0
    end
  endtask

  // Task to apply stimulus - tests random 32-bit numbers (zero-extended to 64-bit)
  task stimulus;
    begin
      for (i = 0; i < 5; i = i + 1) begin
        @(negedge clk) start = 1;  // trigger start
        data_in = {32'd0, {$random}};  // inject random 32-bit value
        @(negedge clk) start = 0;  // de-assert start
        wait (done);  // wait for operation to complete
      end
    end
  endtask

  // Display the outputs whenever count changes
  always @(count) begin
    $display("time : %0t | data_in = %0d | count = %0d, all_zero = %b, done = %b", $time, data_in,
             count, all_zero, done);
  end

  // Clock generation: 10 time unit period
  always #5 clk = ~clk;

  // Initial sequence to reset and apply test vectors
  initial begin
    initialize;

    @(negedge clk) rst_n = 1;  // release reset
    start = 1;  // start with data_in = 0
    wait (done);  // wait for done signal
    @(negedge clk) start = 0;  // de-assert start

    wait (done);  // wait for FSM to go to IDLE

    @(negedge clk) start = 1;  // now test with data_in = 1
    data_in = 1;
    @(negedge clk) start = 0;  // de-assert start
    wait (done);  // wait for completion

    stimulus;  // apply randomized test vectors
    #100 $finish;  // finish simulation
  end

endmodule
