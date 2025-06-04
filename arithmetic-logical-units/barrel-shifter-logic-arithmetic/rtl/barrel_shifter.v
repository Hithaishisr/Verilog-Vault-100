/******************************************************************************
  RTL code to impliment Barrel shifter functionality

  Shift Direction:
    dir = 0 → Left Shift
    dir = 1 → Right Shift

  Shift Type:
    arith = 0 → Logical Shift (fills with zeros)
    arith = 1 → Arithmetic Shift (preserves sign on right shift)

  Notes:
    - Arithmetic Left Shift (<<<) behaves the same as Logical Left Shift (<<)
    - Arithmetic Right Shift (>>>), when applied to signed values,
      fills vacated bits with the sign bit (MSB) to preserve number sign
  ****************************************************************************/
module barrel_shifter (
    data_in,
    shift_amt,
    dir,
    arith,
    data_out
);

  parameter data_width = 32, shift_amt_width = 5;

  input [(data_width - 1) : 0] data_in;
  input [(shift_amt_width - 1) : 0] shift_amt;
  input dir, arith;
  output reg [(data_width - 1) : 0] data_out;

  always @(*) begin
    if (!dir) begin
      case (arith)
        1'b0: data_out = data_in << shift_amt;
        1'b1: data_out = data_in <<< shift_amt;
      endcase
    end else begin
      case (arith)
        1'b0: data_out = data_in >> shift_amt;
        1'b1: data_out = $signed(data_in) >>> shift_amt;
      endcase
    end
  end

endmodule
