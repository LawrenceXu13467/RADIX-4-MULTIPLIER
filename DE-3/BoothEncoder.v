module BoothEncoder(X,Y);
	input [2:0] X;
	output [2:0] Y;
	reg [2:0] Ytemp;

	//assign X2_xnor_X1 = ~(X[2] ^ X[1]); 
	//assign X1_xor_X0 = X[1] ^ X[0]; 
	always@(*)
	begin
		Ytemp[2] = X[2];
		Ytemp[1] = X[1] ^ X[0];
		Ytemp[0] = ~((X[1] ^ X[0]) | (~(X[2] ^ X[1])));
	end
	assign Y = Ytemp;
endmodule


//module testbooth;
//wire [2:0] Y0;
//wire [2:0] Y1;
//wire [2:0] Y2;
//wire [2:0] Y3;
//wire [2:0] Y4;
//wire [2:0] Y5;
//wire [2:0] Y6;
//wire [2:0] Y7;
//
//BoothEncoder benc0(3'b000, Y0);
//BoothEncoder benc1(3'b001, Y1);
//BoothEncoder benc2(3'b010, Y2);
//BoothEncoder benc3(3'b011, Y3);
//BoothEncoder benc4(3'b100, Y4);
//BoothEncoder benc5(3'b101, Y5);
//BoothEncoder benc6(3'b110, Y6);
//BoothEncoder benc7(3'b111, Y7);
//
//always@(*)
//begin
//	$display(Y0);
//	$display(Y1);
//	$display(Y2);
//	$display(Y3);
//	$display(Y4);
//	$display(Y5);
//	$display(Y6);
//	$display(Y7);
//	$finish;
//end
//endmodule
