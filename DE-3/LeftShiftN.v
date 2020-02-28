module LeftShiftN(ip,N,op);

input signed [9:0] ip;
output signed [15:0] op;
input [31:0] N;

assign op = ip << N; 

endmodule

//module testL;
//
//wire [23:0] op;
//
//LeftShiftN lshift(14'b1,10,op);
//
//initial
//begin
//	$monitor("%d",op);
//	$finish;
//end
//
//endmodule
