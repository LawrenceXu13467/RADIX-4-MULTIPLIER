module PreCompute(A, A0, A1, A2, ABar, A2Bar);
	input [7:0]  A;
	output signed [9:0] A0, A1, A2, ABar, A2Bar;


assign A0 = 10'b0;
assign A1 = A;
assign A2 = 2*A;
assign ABar = -A;
assign A2Bar = -2*A;


endmodule

//module testpre;
//
//wire [13:0] A0, A1, A2, ABar, A2Bar;
//PreCompute pre(12'b111, A0, A1, A2, ABar, A2Bar);
//
//always@(*)
//begin
//	$display(A0);
//	$display(A1);
//	$display(A2);
//	$display(ABar);
//	$display(A2Bar);
//	$finish;
//end
//
//endmodule
