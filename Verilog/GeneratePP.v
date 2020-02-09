`include "BoothEncoder.v"
`include "PreCompute.v"
`include "MUX5to1.v"

module GeneratePP(X,Y,PP0,PP1,PP2,PP3,PP4,PP5);

input [11:0] X,Y;
output signed [13:0] PP0,PP1,PP2,PP3,PP4,PP5;

wire signed [13:0] A0, A1, A2, ABar, A2Bar;
PreCompute pre(X, A0, A1, A2, ABar, A2Bar);


wire [2:0] Y0;
wire [2:0] Y1;
wire [2:0] Y2;
wire [2:0] Y3;
wire [2:0] Y4;
wire [2:0] Y5;

BoothEncoder benc0({Y[1],Y[0],1'b0}, Y0);
BoothEncoder benc1({Y[3],Y[2],Y[1]}, Y1);
BoothEncoder benc2({Y[5],Y[4],Y[3]}, Y2);
BoothEncoder benc3({Y[7],Y[6],Y[5]}, Y3);
BoothEncoder benc4({Y[9],Y[8],Y[7]}, Y4);
BoothEncoder benc5({Y[11],Y[10],Y[9]}, Y5);

wire signed [13:0] Z0;
wire signed [13:0] Z1;
wire signed [13:0] Z2;
wire signed [13:0] Z3;
wire signed [13:0] Z4;
wire signed [13:0] Z5;

//MUX5to1 mux0(A0,A1,A2,ABar,A2Bar,Y0,Z0);
//MUX5to1 mux1(A0,A1,A2,ABar,A2Bar,Y1,Z1);
//MUX5to1 mux2(A0,A1,A2,ABar,A2Bar,Y2,Z2);
//MUX5to1 mux3(A0,A1,A2,ABar,A2Bar,Y3,Z3);
//MUX5to1 mux4(A0,A1,A2,ABar,A2Bar,Y4,Z4);
//MUX5to1 mux5(A0,A1,A2,ABar,A2Bar,Y5,Z5);

MUX5to1 mux0(A0,A1,A2,ABar,A2Bar,Y0,PP0);
MUX5to1 mux1(A0,A1,A2,ABar,A2Bar,Y1,PP1);
MUX5to1 mux2(A0,A1,A2,ABar,A2Bar,Y2,PP2);
MUX5to1 mux3(A0,A1,A2,ABar,A2Bar,Y3,PP3);
MUX5to1 mux4(A0,A1,A2,ABar,A2Bar,Y4,PP4);
MUX5to1 mux5(A0,A1,A2,ABar,A2Bar,Y5,PP5);

//assign PP0 = Z0;
//assign PP1 = Z1<<2;
//assign PP2 = Z2<<4;
//assign PP3 = Z3<<6;
//assign PP4 = Z4<<8;
//assign PP5 = Z5<<10;

endmodule

//module testGen;
//
//wire [13:0] PP0,PP1,PP2,PP3,PP4,PP5;
//GeneratePP pp(12'b1,12'b10,PP0,PP1,PP2,PP3,PP4,PP5);
//
//always@(PP5)
//begin
//	$display(PP0);
//	$display(PP1);
//	$display(PP2);
//	$display(PP3);
//	$display(PP4);
//	$display(PP5);
//	$finish;
//end
//endmodule
//
