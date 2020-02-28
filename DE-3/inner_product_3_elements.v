`include "Radix_4_8x8.v"


module inner_product_3_elements(a,b,p);

input [23:0] a,b;
output [17:0] p; // inner product of 2 vectors of 3 elements of 8 bits wide each (16+(3-1) bits required)

wire [15:0] pp1, pp2, pp3;

Radix_4_8x8 ip1(a[7:0],b[7:0],pp1); 
Radix_4_8x8 ip2(a[15:8],b[15:8],pp2); 
Radix_4_8x8 ip3(a[23:16],b[23:16],pp3); 

wire C1, C2;
wire [17:0] S1;

CarryRippleAdder_18 add1(pp1,pp2,1'b0,S1,C1);
CarryRippleAdder_18 add2(S1,pp3,C1,p,C2);

endmodule

module testInner;

wire [17:0] P9,P10,P11,P12, P13;

inner_product_3_elements ip1({8'b1111,8'b1111,8'b1111},{8'b1111,8'b1111,8'b1111},P9);




initial
begin
	//$monitor("%d, %d, %d, %d",P9,P10,P11,P13);
	$monitor("%d ",P9);
	$finish;
end

endmodule
