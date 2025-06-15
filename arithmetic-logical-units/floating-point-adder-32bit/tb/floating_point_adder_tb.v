// Testbench for checking the functionality of the floating point adder
module floating_point_adder_tb;

  // Testbench signals
  reg clk, rst_n, start;
  reg [31:0] a, b;
  wire valid, overflow, underflow;
  wire [31:0] result;

  // Instantiate the DUT (Device Under Test)
  floating_point_adder DUT (
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

  // Task to initialize all inputs
  task initialize;
    begin
      {clk, rst_n, start} = 0;
      a = 0;
      b = 0;
    end
  endtask

  // Test: 3.54 + 2.25
  task t1;
    begin
      a = 32'b01000000011000101000111101011100;  // 3.54
      b = 32'b01000000000100000000000000000000;  // 2.25
      start = 1;
      @(negedge clk) start = 0;
      wait (valid == 1);
    end
  endtask

  // Test: 3.54 + (-2.25)
  task t2;
    begin
      a = 32'b01000000011000101000111101011100;  // 3.54
      b = 32'b11000000000100000000000000000000;  // -2.25
      start = 1;
      @(negedge clk) start = 0;
      wait (valid == 1);
    end
  endtask

  // Test: -3.54 + 2.25
  task t3;
    begin
      a = 32'b11000000011000101000111101011100;  // -3.54
      b = 32'b01000000000100000000000000000000;  // 2.25
      start = 1;
      @(negedge clk) start = 0;
      wait (valid == 1);
    end
  endtask

  // Test: -3.54 + (-2.25)
  task t4;
    begin
      a = 32'b11000000011000101000111101011100;  // -3.54
      b = 32'b11000000000100000000000000000000;  // -2.25
      start = 1;
      @(negedge clk) start = 0;
      wait (valid == 1);
    end
  endtask

  // Test: -32.78 + (-1500.56)
  task t5;
    begin
      a = 32'b11000010000000110001111010111000;  // -32.78
      b = 32'b11000100101110111001000111101100;  // -1500.56
      start = 1;
      @(negedge clk) start = 0;
      wait (valid == 1);
    end
  endtask

  // Test: 0 + 0
  task t6;
    begin
      a = 0;
      b = 0;
      start = 1;
      @(negedge clk) start = 0;
      wait (valid == 1);
    end
  endtask

  // Test: 0 + (-3.54)
  task t7;
    begin
      a = 0;
      b = 32'b11000000011000101000111101011100;  // -3.54
      start = 1;
      @(negedge clk) start = 0;
      wait (valid == 1);
    end
  endtask

  // Test: 3.54 + 0
  task t8;
    begin
      a = 32'b01000000011000101000111101011100;  // 3.54
      b = 0;
      start = 1;
      @(negedge clk) start = 0;
      wait (valid == 1);
    end
  endtask

  // Test: +infinity + +infinity
  task t9;
    begin
      a = 32'b01111111100000000000000000000000;  // +infinity
      b = 32'b01111111100000000000000000000000;  // +infinity
      start = 1;
      @(negedge clk) start = 0;
      wait (valid == 1);
    end
  endtask

  // Test: +infinity + (-infinity) => Expected: NaN
  task t10;
    begin
      a = 32'b01111111100000000000000000000000;  // +infinity
      b = 32'b11111111100000000000000000000000;  // -infinity
      start = 1;
      @(negedge clk) start = 0;
      repeat (2) @(negedge clk);  // Wait a couple of cycles
    end
  endtask

  // Test: NaN + (-infinity) => Expected: NaN
  task t11;
    begin
      a = 32'b01111111100000000000000000000001;  // NaN
      b = 32'b11111111100000000000000000000000;  // -infinity
      start = 1;
      @(negedge clk) start = 0;
      repeat (2) @(negedge clk);  // Wait a couple of cycles
    end
  endtask

  // Test: Overflow scenario (very large numbers)
  task t12;
    begin
      a = 32'b01111111011111111111111111111111;  // Close to max float
      b = 32'b01111111011111111111111111111111;  // Close to max float
      start = 1;
      @(negedge clk) start = 0;
      repeat (10) @(negedge clk);  // Wait a couple of cycles
    end
  endtask

  // Test: Underflow scenario (very small numbers)
  task t13;
    begin
      a = 32'b00000000000000000000000000000001;  // Smallest positive subnormal
      b = 32'b00000000000000000000000000000001;  // Smallest positive subnormal
      start = 1;
      @(negedge clk) start = 0;
      repeat (10) @(negedge clk);  // Wait a couple of cycles
    end
  endtask

  // Print result only when it changes and valid is high
  always @(result) begin
    $display("Time=%0t | A=%h, B=%h => Result=%h | valid=%b, overflow=%b, underflow=%b", $time, a,
             b, result, valid, overflow, underflow);
  end

  // Clock generation: toggle every 5 time units
  always #5 clk = !clk;

  // Test sequence
  initial begin
    initialize;

    // Test: 3.54 + 2.25
    @(negedge clk) rst_n = 1;
    t1;  // Should print 0x40b947ae (5.79)

    // Test: 3.54 + (-2.25)
    @(negedge clk);
    t2;  // Should print 0x3fa51eb8 (1.29)

    // Test: -3.54 + 2.25
    @(negedge clk);
    t3;  // Should print 0xbfa51eb8 (-1.29)

    // Test: -3.54 + (-2.25)
    @(negedge clk);
    t4;  // Should print 0xc0b947ae (-5.79)

    // Test: -32.78 + (-1500.56)
    @(negedge clk);
    t5;  // Should print 0xc4bfaae1 (-1533.34)

    // Test: 0 + 0
    repeat (2) @(negedge clk);
    t6;  // Should print 0x00000000 (0)

    // Test: 0 + (-3.54)
    repeat (2) @(negedge clk);
    t7;  // Should print 0xc0628f5c (-3.54)

    // Test: 3.54 + 0
    repeat (2) @(negedge clk);
    t8;  // Should print 0x40628f5c (3.54)

    // Test: +infinity + +infinity
    repeat (2) @(negedge clk);
    t9;  // Should print 0x7f800000 (+infinity)

    // Test: +infinity + (-infinity) => Expected: NaN
    repeat (2) @(negedge clk);
    t10;  // Should print 0xff800001 (NaN)

    // Test: NaN + (-infinity) => Expected: NaN
    repeat (2) @(negedge clk);
    t11;  // Should print 0xff800001 (NaN)

    // Test: Overflow scenario (very large numbers)
    repeat (2) @(negedge clk);
    t12;  // Should trigger overflow, result likely +infinity, overflow = 1

    // Test: Underflow scenario (very small numbers)
    repeat (2) @(negedge clk);
    t13;  // Should trigger underflow, result ~0, underflow = 1

    #100 $finish;  // End simulation after 100 time units
  end

endmodule
