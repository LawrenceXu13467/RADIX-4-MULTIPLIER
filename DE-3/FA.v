module FA(x,y,ci,s,co);

input x,y,ci;
output s,co;


assign s = x^y^ci;
assign co = (x&y) | ((x^y)&ci);

endmodule

//module test;
//
//wire s,co;
//FA fa(1'b1,1'b0,1'b0,s,co);
//
//always@(*)
//begin
//	$display(s);
//	$display(co);
//	$finish;
//end
//
//endmodule
