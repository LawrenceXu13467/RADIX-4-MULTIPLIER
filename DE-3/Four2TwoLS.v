// Linear Sum 4:2
module Four2TwoLS(a,b,c,d,s,co,to);

input a,b,c,d;
output s,co,to;

assign s = ((a^b)^c)^d;
assign co = ((a^b)&d) | ((a^b)&c) | (c&d);
assign to = (a&b);
endmodule
