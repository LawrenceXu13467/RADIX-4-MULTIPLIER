`include "PreCompute.v"
module test;

wire [13:0] A0, A1, A2, ABar, A2Bar;
PreCompute pre(12'b111, A0, A1, A2, ABar, A2Bar);

always@(*)
begin
	$display(A0);
	$display(A1);
	$display(A2);
	$display(ABar);
	$display(A2Bar);
	$finish;
end

endmodule

