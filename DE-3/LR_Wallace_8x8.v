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
LeftShiftN l0(PP3,0,SPP3);
LeftShiftN l1(PP2,2,SPP2);
LeftShiftN l2(PP1,4,SPP1);
LeftShiftN l3(PP0,6,SPP0);


wire [15:0] S1, Co1, S2, Co2, S3, Co3, S4, Co4;
CarrySaveAdder save1(SPP3,SPP2,SPP1,S1,Co1);
CarrySaveAdder save2(SPP0,S1,Co1,S2,Co2);

wire C;
CarryRippleAdder_18 rip(S2,Co2,1'b0,P,C);

endmodule