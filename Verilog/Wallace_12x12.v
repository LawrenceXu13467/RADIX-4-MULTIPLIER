`include "GeneratePP.v"
`include "CarrySaveAdder.v"
`include "CarryRippleAdder_24.v"
`include "LeftShiftN.v"

module Wallace_12x12(X,Y,P);

input [11:0] X,Y;
output [23:0] P;

wire signed [13:0] PP0,PP1,PP2,PP3,PP4,PP5;
wire signed [23:0] SPP0,SPP1,SPP2,SPP3,SPP4,SPP5;
GeneratePP pp(X,Y,PP0,PP1,PP2,PP3,PP4,PP5);
LeftShiftN l0(PP0,0,SPP0);
LeftShiftN l1(PP1,2,SPP1);
LeftShiftN l2(PP2,4,SPP2);
LeftShiftN l3(PP3,6,SPP3);
LeftShiftN l4(PP4,8,SPP4);
LeftShiftN l5(PP5,10,SPP5);


wire [23:0] S1, Co1, S2, Co2, S3, Co3, S4, Co4;
CarrySaveAdder save1(SPP0,SPP1,SPP2,S1,Co1);
CarrySaveAdder save2(SPP3,SPP4,SPP5,S2,Co2);
CarrySaveAdder save3(S1,Co1,S2,S3,Co3);
CarrySaveAdder save4(Co2,S3,Co3,S4,Co4);

wire C;
CarryRippleAdder_24 rip(S4,Co4,1'b0,P,C);

endmodule


module test;

wire [23:0] P9,P10,P11,P12;
Wallace_12x12 wp1(12'b111111111,12'b111111111,P9);
Wallace_12x12 wp2(12'b1111111111,12'b1111111111,P10);
Wallace_12x12 wp3(12'b11111111111,12'b11111111111,P11);
Wallace_12x12 wp4(12'b111111111111,12'b111111111111,P12);
//Wallace_12x12 wp(12'b11111111,12'b11111111,P);

initial
begin
	$monitor("%d, %d, %d, %d",P9,P10,P11,P12);
	$finish;
end

endmodule
