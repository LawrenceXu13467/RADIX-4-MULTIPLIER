module HA(x,y,s,co);

input x,y;
output s,co;


assign s = x^y;
assign co = (x&y);

endmodule

//module testHa;
//
//wire s,co;
//HA ha(1'b1,1'b1,s,co);
//
//always@(*)
//begin
//	$display(s);
//	$display(co);
//	$finish;
//end
//
//endmodule
