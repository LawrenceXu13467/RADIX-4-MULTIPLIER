module FA_mux(x,y,ci,s,co);

input x,y,ci;
output s,co;
wire p_sel;

assign p_sel = x^y;
assign s = p_sel^ci;
assign c0 = p_sel? x : ci;

endmodule
