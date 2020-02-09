module MUX5to1(A0,A1,A2,ABar,A2Bar,SEL,Z);

input signed [13:0] A0,A1,A2,ABar,A2Bar;
input [2:0] SEL;
output signed [13:0] Z;
reg signed [13:0] Z;
wire [2:0] SELtemp;

assign SELtemp = SEL;

always@(*)
begin
	case(SELtemp)
	3'b000:  Z = A0;
	3'b001:  Z = A2;
	3'b010:  Z = A1;
	3'b100:  Z = A0;
	3'b101:  Z = A2Bar;
	3'b110:  Z = ABar;
	default: Z = 14'bx;
	endcase
end

endmodule

//module testmux;
//
//wire [13:0] Z0;
//wire [13:0] Z1;
//wire [13:0] Z2;
//wire [13:0] Z4;
//wire [13:0] Z5;
//wire [13:0] Z6;
//
//MUX5to1 mux0(14'b0,14'b11,14'b110,14'b11111111111101,14'b11111111111010,3'b0,Z0);
//MUX5to1 mux1(14'b0,14'b11,14'b110,14'b11111111111101,14'b11111111111010,3'b1,Z1);
//MUX5to1 mux2(14'b0,14'b11,14'b110,14'b11111111111101,14'b11111111111010,3'b10,Z2);
//MUX5to1 mux4(14'b0,14'b11,14'b110,14'b11111111111101,14'b11111111111010,3'b100,Z4);
//MUX5to1 mux5(14'b0,14'b11,14'b110,14'b11111111111101,14'b11111111111010,3'b101,Z5);
//MUX5to1 mux6(14'b0,14'b11,14'b110,14'b11111111111101,14'b11111111111010,3'b110,Z6);
//
//always@(*)
//begin
//	$display(Z0);
//	$display(Z1);
//	$display(Z2);
//	$display(Z4);
//	$display(Z5);
//	$display(Z6);
//	$finish;
//end
//
//endmodule
