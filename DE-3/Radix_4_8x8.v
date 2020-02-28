`include "GeneratePP.v"
`include "CarrySaveAdder.v"
`include "CarryRippleAdder_18.v"
`include "LeftShiftN.v"

module Radix_4_8x8(X,Y,P);

input [7:0] X,Y;
output [15:0] P;

wire signed [9:0] PP0,PP1,PP2,PP3;
wire signed [15:0] SPP0,SPP1,SPP2,SPP3;
GeneratePP pp(X,Y,PP0,PP1,PP2,PP3);
LeftShiftN l0(PP0,0,SPP0);
LeftShiftN l1(PP1,2,SPP1);
LeftShiftN l2(PP2,4,SPP2);
LeftShiftN l3(PP3,6,SPP3);


wire [15:0] S1, Co1, S2, Co2, S3, Co3, S4, Co4;
CarrySaveAdder save1(SPP0,SPP1,SPP2,S1,Co1);
CarrySaveAdder save2(SPP3,S1,Co1,S2,Co2);

wire C;
CarryRippleAdder_18 rip(S2,Co2,1'b0,P,C);

endmodule


//module test;
//
//wire [15:0] P9,P10,P11,P12, P13;
//Radix_4_8x8 mul(8'b111,8'b11,P9);
//Radix_4_8x8 mul2(8'b1111,8'b1111,P10);
//Radix_4_8x8 mul3(8'b1111111,8'b1111111,P11);
////Radix_4_8x8 mul4(8'b111111111111,8'b111111111111,P8);
//
//initial
//begin
//	//$monitor("%d, %d, %d, %d",P9,P10,P11,P13);
//	$monitor("%d %d %d",P9,P10,P11);
//	$finish;
//end
//
//endmodule
