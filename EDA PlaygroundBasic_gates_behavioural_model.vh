// Testbench Code:

module tb();
reg tb_a, tb_b;
wire tb_y_and, tb_y_or, tb_y_xor, tb_y_nand, tb_y_nor, tb_y_xnor, tb_y_not;
// instantiation or port-map
and_or_xor_bh ints1(
.a(tb_a),
.b(tb_b),
.y_and(tb_y_and),
.y_or(tb_y_or),
.y_xor(tb_y_xor),
.y_nand(tb_y_nand),
.y_nor(tb_y_nor),
.y_xnor(tb_y_xnor),
.y_not(tb_y_not)
);
// To view the waveform
initial
begin
$dumpfile("and_or_xor_wf.vcd");
$dumpvars(1);
end
// To check with all possible inputs
initial
begin
$monitor("tb_a = %b, tb_b = %b, tb_y_and = %b, tb_y_or = %b, tb_y_xor = %b,tb_y_nand = %b, tb_y_nor = %b, tb_y_xnor = %b, tb_y_not = %b\n", tb_a, tb_b, tb_y_and, tb_y_or, tb_y_xor, tb_y_nand, tb_y_nor, tb_y_xnor, tb_y_not);
tb_a = 0; tb_b = 0;
#10 // in nano seconds
tb_a = 0; tb_b = 1;
#10
tb_a = 1; tb_b = 0;
#10
tb_a = 1; tb_b = 1;
#10
$finish;
end
endmodule


// Design code:

// Code your design here
// Implementation of gates using Behavioural model
// AND, OR, XOR
// Declaration or Definition of the module
module and_or_xor_bh(
  input a, b, 
  output reg y_and, y_or, y_xor, y_nand, y_nor, y_xnor, y_not
);
// Design the module using Behavioural model
  always @ (*)
    begin
      if(a == 0 && b == 0)
        begin
          y_and <= 0; //Use less-than symbol and equal to get assign
          y_or <= 0;
          y_xor <= 0;
          y_nand <= 1;
          y_nor <= 1;
          y_xnor <= 1;
          y_not <= 1;
        end
      else if(a == 0 && b == 1)
        begin
          y_and <= 0; //Use less-than symbol and equal to get assign
          y_or <= 1;
          y_xor <= 1;
          y_nand <= 1;
          y_nor <= 0;
          y_xnor <= 0;
          y_not <= 1;
        end
      else if(a == 1 && b == 0)
        begin
          y_and <= 0; //Use less-than symbol and equal to get assign
          y_or <= 1;
          y_xor <= 1;
          y_nand <= 1;
          y_nor <= 0;
          y_xnor <= 0;
          y_not <= 0;
        end
      else
        begin
          y_and <= 1; //Use less-than symbol and equal to get assign
          y_or <= 1;
          y_xor <= 0;
          y_nand <= 0;
          y_nor <= 0;
          y_xnor <= 1;
          y_not <= 0;
        end
    end
endmodule
