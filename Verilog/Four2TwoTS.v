// Tree Sum 4:2
module Four2TwoLS(a,b,c,d,s,co,to);

input a,b,c,d;
output s,co,to;

assign s = (a^b)^(c^d);
assign c0 = ((a^b)&c) | ((a^b)&d) | (c&d);
assign t0 = (a&b)
endmodule
