module simple_combinational_mult(product,multiplier,multiplicand); //P
   input [15:0]  multiplier, multiplicand;

   output reg [31:0]    product;

   integer       i;

   always @( multiplier or multiplicand )
     begin
        
        product = 32'b0;
            
        for(i=0; i<16; i=i+1)
          if( multiplier[i] == 1'b1 ) product = product + ( multiplicand << i );
  
     end

     
endmodule


module test;

wire [31:0] product;
simple_combinational_mult sim1(product,16'b10,16'b10);

always@(product) 
begin
	$display(product);
	$finish;
end
endmodule
