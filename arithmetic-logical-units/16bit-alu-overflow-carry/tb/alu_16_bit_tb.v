//Testbench for checking functionality of 16-bit ALU
module alu_16_bit_tb;

  reg [15:0] A, B;
  reg  [ 3:0] ALUOp;
  wire [15:0] Result;
  wire Carry, Overflow, Zero, Negative;

  alu_16_bit DUT (
      A,
      B,
      ALUOp,
      Result,
      Carry,
      Overflow,
      Zero,
      Negative
  );

  task initialize;
    begin
      {A, B} = 0;
      ALUOp  = 0;
    end
  endtask

  task AND;
    begin
      A = 7865;
      B = 5362;
      ALUOp = 0;
    end
  endtask

  task OR;
    begin
      A = 6574;
      B = 8756;
      ALUOp = 1;
    end
  endtask

  task ADD;
    begin
      A = 5342;
      B = 1275;
      ALUOp = 2;
    end
  endtask

  task SUB;
    begin
      A = 1524;
      B = 8743;
      ALUOp = 3;
    end
  endtask

  task XOR;
    begin
      A = 7658;
      B = 8329;
      ALUOp = 4;
    end
  endtask

  task NOT;
    begin
      A = 3675;
      ALUOp = 5;
    end
  endtask

  task SLT;
    begin
      A = 65300;
      B = 65533;
      ALUOp = 6;
    end
  endtask

  task NOR;
    begin
      A = 1574;
      B = 9657;
      ALUOp = 7;
    end
  endtask

  task ShiftLeft;
    begin
      A = 5478;
      ALUOp = 8;
    end
  endtask

  task ShiftRight;
    begin
      A = 3678;
      ALUOp = 9;
    end
  endtask

  task ShiftRightArith;
    begin
      A = 9812;
      ALUOp = 10;
    end
  endtask

  initial begin
    initialize;
    #5 AND;
    #5 OR;
    #5 ADD;
    #5 SUB;
    #5 XOR;
    #5 NOT;
    #5 SLT;
    #5 NOR;
    #5 ShiftLeft;
    #5 ShiftRight;
    #5 ShiftRightArith;
    #10 $finish;
  end

endmodule
