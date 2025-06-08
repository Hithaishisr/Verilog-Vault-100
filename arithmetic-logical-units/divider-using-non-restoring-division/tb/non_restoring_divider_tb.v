// Testbench for checking the functionality of the non-restoring divider RTL
module non_restoring_divider_tb;

  parameter width = 8;  // Data width (can be modified if needed)

  // Testbench signals
  reg clk, rst, start, signed_op;
  reg [(width-1):0] dividend;
  reg [(width-1):0] divisor;
  wire done, error, busy;
  wire [(width-1):0] quotient, remainder;

  // Instantiate the DUT (Device Under Test)
  non_restoring_divider DUT (
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

  // Task to initialize all inputs to 0
  task initialize;
    begin
      {clk, rst, start, signed_op, dividend, divisor} = 0;
    end
  endtask

  // Clock generation (10 time unit period)
  always #5 clk = ~clk;

  // Task to apply a reset pulse
  task reset;
    begin
      @(negedge clk) rst = 1;
      @(negedge clk) rst = 0;
    end
  endtask

  // ----------- Stimulus Tasks for Different Test Cases -----------

  // Test 1: Unsigned division, 176 ÷ 8
  task stimulus_1;
    begin
      start = 1;
      signed_op = 0;
      dividend = 176;
      divisor = 8;
    end
  endtask

  // Test 2: Unsigned division, 233 ÷ 24
  task stimulus_2;
    begin
      start = 1;
      signed_op = 0;
      dividend = 233;
      divisor = 24;
    end
  endtask

  // Test 3: Unsigned division where dividend < divisor, expect quotient = 0
  task stimulus_3;
    begin
      start = 1;
      signed_op = 0;
      dividend = 23;
      divisor = 233;
    end
  endtask

  // Test 4: Division by zero, should trigger error
  task stimulus_4;
    begin
      start = 1;
      signed_op = 0;
      dividend = 254;
      divisor = 0;
    end
  endtask

  // Test 5: Signed division, negative dividend
  task stimulus_5;
    begin
      start = 1;
      signed_op = 1;
      dividend = -100;
      divisor = 10;
    end
  endtask

  // Test 6: Signed division, negative divisor
  task stimulus_6;
    begin
      start = 1;
      signed_op = 1;
      dividend = 100;
      divisor = -9;
    end
  endtask

  // Test 7: Signed division, both dividend and divisor negative
  task stimulus_7;
    begin
      start = 1;
      signed_op = 1;
      dividend = -50;
      divisor = -5;
    end
  endtask

  // Test 8: Signed division, dividend < divisor (magnitude-wise)
  task stimulus_8;
    begin
      start = 1;
      signed_op = 1;
      dividend = -25;
      divisor = -100;
    end
  endtask

  // ---------- Initial block to run all test scenarios sequentially ----------
  initial begin
    initialize;       // Set initial values
    reset;            // Apply reset before starting

    stimulus_1;       // Run test 1
    wait(done);       // Wait until done is asserted

    reset;
    stimulus_2;       // Run test 2
    wait(done);

    reset;
    stimulus_3;       // Run test 3 (dividend < divisor)
    reset;            // No wait here because done won't be high (error instead)

    stimulus_4;       // Run test 4 (division by zero)
    reset;

    stimulus_5;       // Run test 5
    wait(done);

    reset;
    stimulus_6;       // Run test 6
    wait(done);

    reset;
    stimulus_7;       // Run test 7
    wait(done);

    reset;
    stimulus_8;       // Run test 8
    wait(done);
  end

endmodule
