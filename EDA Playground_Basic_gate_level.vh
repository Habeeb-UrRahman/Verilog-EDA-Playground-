// Testbench Code:

module tb();
reg tb_a, tb_b;
wire tb_y_and, tb_y_or, tb_y_xor, tb_y_nand, tb_y_nor, tb_y_xnor, tb_y_not;
// instantiation or port-map
and_or_xor_gl ints1(
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


// Design Code:

// Commenting a single line
/* For commenting in multiple 
lines. */
// Implementation of gates using Gate-level or Structural model
// AND, OR, XOR
// Declaration or Definition of the module
module and_or_xor_gl (
  input a,b,
  output y_and, y_or, y_xor, y_nand, y_nor, y_xnor, y_not 
);
// Designing the module in the Gate-level model
  and(y_and, a,b);
  or(y_or, a,b);
  xor(y_xor, a,b);
  nand(y_nand, a,b);
  nor(y_nor, a,b);
  xnor(y_xnor, a,b);
  not(y_not, a,b);
endmodule
