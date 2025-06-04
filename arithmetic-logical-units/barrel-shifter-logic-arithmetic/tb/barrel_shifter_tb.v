//Testbench for checking the functionality of the barrel shifter
module barrel_shifter_tb;

  parameter data_width = 32, shift_amt_width = 5;

  reg [(data_width-1):0] data_in;
  reg [(shift_amt_width-1):0] shift_amt;
  reg dir, arith;
  wire [(data_width-1):0] data_out;

  barrel_shifter DUT (
      data_in,
      shift_amt,
      dir,
      arith,
      data_out
  );

  task initialize;
    begin
      data_in = 0;
      {shift_amt, dir, arith} = 0;
    end
  endtask

  task logic_left;
    begin
      data_in   = {$random};
      shift_amt = {$random} % (2 ** 5);
    end
  endtask

  task logic_right;
    begin
      data_in = {$random};
      shift_amt = {$random} % (2 ** 5);
      dir = 1;
    end
  endtask

  task arith_left;
    begin
      data_in = {$random};
      shift_amt = {$random} % (2 ** 5);
      dir = 0;
      arith = 1;
    end
  endtask

  task arith_right;
    begin
      data_in = {1'b1, {$random}};  //MSB as 1 for signed data representation
      shift_amt = {$random} % (2 ** 5);
      dir = 1;
    end
  endtask

  initial begin
    initialize;
    #5 logic_left;
    #5 logic_right;
    #5 arith_left;
    #5 arith_right;
    #20 $finish;
  end

endmodule
