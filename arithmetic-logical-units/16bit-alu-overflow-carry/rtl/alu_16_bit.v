//RTL code for 16-bit ALU with overload and carry flags
module alu_16_bit (
    A,
    B,
    ALUOp,
    Result,
    Carry,
    Overflow,
    Zero,
    Negative
);

  input [15:0] A, B;
  input [3:0] ALUOp;
  output reg [15:0] Result;
  output reg Carry, Overflow, Zero, Negative;

  localparam AND = 4'd0,                //Bitwise AND
             OR = 4'd1,                 //Bitwise OR
             ADD = 4'd2,                //A + B
             SUB = 4'd3,                //A - B
             XOR = 4'd4,                //Bitwise XOR
             NOT = 4'd5,                //Bitwise NOT of A
             SLT = 4'd6,                //Set if less than (signed A < B)
             NOR = 4'd7,                //Bitwise NOR
             ShiftLeft = 4'd8,          //Logical shift left of A
             ShiftRight = 4'd9,         //Logical shift right of A
             ShiftRightArith = 4'd10;   //Arithmatic shift right of A

  //Main ALU Logic block
  always @(*) begin
    Carry = 1'b0;       //For ADD and SUB respective Carry and Barrow is set to Carry signal
    Overflow = 1'b0;    //Occurs only in signed ADD / SUB
    case (ALUOp)
      AND: Result = A & B;
      OR: Result = A | B;
      ADD: begin
        {Carry, Result} = A + B;
        Overflow = ((~A[15] & ~B[15] & Result[15]) | (A[15] & B[15] & ~Result[15]));
      end
      SUB: begin
        Result = A - B;
        Carry  = A < B;
        Overflow = ((~A[15] & B[15] & Result[15]) | (A[15] & ~B[15] & ~Result[15]));
      end
      XOR: Result = A ^ B;
      NOT: Result = ~A;
      SLT: Result = ($signed(A) < $signed(B)) ? 16'd1 : 16'd0;
      NOR: Result = ~(A | B);
      ShiftLeft: Result = A << 1;
      ShiftRight: Result = A >> 1;
      ShiftRightArith: Result = A >>> 1;
      default : Result = 16'd0;
    endcase
  end

  //Zero and Negative signal logic
  always @(*) begin
    Zero = (Result == 16'd0);   //Detects if the result is zero
    Negative = Result[15];      //If signed output MSB is 1 then Negative signal is set
  end

endmodule
