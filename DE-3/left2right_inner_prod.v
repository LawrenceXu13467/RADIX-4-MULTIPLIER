`include "LR_Wallace_8x8.v"


module left2right_inner_prod(a,b,p);

input [23:0] a,b; // input 2 vectors of 3 elements of 8 bits wide 
output [16:0] p; // inner product (16+(2-1) bits required)

wire [15:0] pp1, pp2, pp3; // all partial products could get 16 bits wide

LR_Wallace_8x8 ip1(a[23:16],b[23:16],pp1);
LR_Wallace_8x8 ip2(a[15:8],b[15:8],pp2); 
LR_Wallace_8x8 ip3(a[7:0],b[7:0],pp3); 

wire C1, C2;
wire [17:0] S1;

CarryRippleAdder_18 add1(pp1,pp2,1'b0,S1,C1);
CarryRippleAdder_18 add2(S1,pp3,C1,p,C2);

endmodule