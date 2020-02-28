module CarrySaveAdder(X,Y,Ci,S,Co);

input [15:0] X, Y, Ci;
output [15:0] S, Co;


assign S = X ^ Y ^ Ci;
assign Co = ((X & Y) | (X & Ci) | (Y & Ci))<<1;

endmodule

// module test;

// wire [23:0] S,Co;
// CarrySaveAdder save(24'b011,24'b010,24'b0,S,Co);

// always@(*)
// begin
// 	$display(S);
// 	$display(Co);
// 	$finish;
// end

// endmodule
