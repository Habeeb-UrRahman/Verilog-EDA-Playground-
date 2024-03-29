// Testbench Code:

module tb();
  reg tb_a, tb_b, tb_c;
  wire tb_sum, tb_carry, tb_diff, tb_bor;
  // Instantiation or port map
  full_add_sub ints1(
    .a(tb_a),
    .b(tb_b),
    .c(tb_c),
    .sum(tb_sum),
    .carry(tb_carry),
    .diff(tb_diff),
    .bor(tb_bor)
  );
  // To view the Wave Form
  initial
    begin
      $dumpfile("full_add_sub_1.vcd");
      $dumpvars(1);
    end     
   // To verify with all possible inputs
   initial
     begin
       $monitor("tb_a=%b, tb_b=%b, tb_c=%b, tb_sum=%b, tb_carry=%b,tb_diff=%b tb_bor=%b\n",tb_a, tb_b, tb_sum, tb_carry, tb_bor);  
       tb_a=0; tb_b=0; tb_c=0;
       #10    
       tb_a=0; tb_b=0; tb_c=1;
       #10      
       tb_a=0; tb_b=1; tb_c=0;
       #10      
       tb_a=0; tb_b=1; tb_c=1;
       #10      
       tb_a=1; tb_b=0; tb_c=0;
       #10     
       tb_a=1; tb_b=0; tb_c=1;
       #10     
       tb_a=1; tb_b=1; tb_c=0;
       #10     
       tb_a=1; tb_b=1; tb_c=1;
       #10      
       $finish;
     end  
endmodule


// Design Code:

module full_add_sub(
  input a, b, c,
  inout a_bar, a_b, b_c, c_a, a_bar_b, a_bar_c,
  output reg sum, carry, diff, bor
);
  
/*
// Structural Model
  // Sum of half adder
  xor(sum, a, b, c);
  
  // Carry of half adder
  and(a_b, a, b);
  and(b_c, b, c);
  and(c_a, c, a);
  or(carry, a_b, b_c, c_a);
  
  // diff of half substractor
  xor(diff, a, b, c);
  
  // borrow of half subtractor
  not(a_bar, a);
  and(a_bar_b, a_bar, b);
  and(a_bar_c, a_bar, c);
  or(a_bar_b, a_bar_c, b_c);
endmodule
*/

/*
// Data flow model
  assign sum=a ^ b ^ c;
  assign carry= (a & b) | (b & c) | (c & a);
  assign diff=a ^ b ^ c;
  assign bor= (!a & b) | (b & c) | (c & !a);
endmodule 
*/

// Behaviour model
always @ (*)
  begin
    if (a == 0 && b == 0 && c == 0)
      begin
        sum <= 0;
        carry<= 0;
        diff<= 0;
        bor <= 0;
      end
    else if (a == 0 && b == 0 && c == 1)
      begin
        sum <= 1;
        carry<= 0;
        diff<= 1;
        bor <= 1;
      end
    else if (a == 0 && b == 1 && c == 0)
      begin
        sum <= 1;
        carry<= 0;
        diff<= 1;
        bor <= 0;
      end
    else if (a == 0 && b == 1 && c == 1)
      begin
        sum <= 0;
        carry<= 1;
        diff<= 0;
        bor <= 0;
      end
    else if (a == 1 && b == 0 && c == 0)
      begin
        sum <= 0;
        carry<= 0;
        diff<= 0;
        bor <= 0;
      end
    else if (a == 1 && b == 0 && c == 1)
      begin
        sum <= 1;
        carry<= 0;
        diff<= 1;
        bor <= 1;
      end
    else if (a == 1 && b == 1 && c == 0)
      begin
        sum <= 1;
        carry<= 0;
        diff<= 1;
        bor <= 0;
      end
    else 
      begin
        sum <= 0;
        carry<= 1;
        diff<= 0;
        bor <= 0;
      end
  end      
 endmodule 
 
