`include "FA.v"

module CarryRippleAdder_24(X,Y,Ci,S,Co);

input signed [23:0] X,Y;
input Ci;
wire  C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22;
output signed [23:0] S;
output Co;

FA fa0(X[0],Y[0],Ci,S[0],C0);

FA fa1(X[1],Y[1],C0,S[1],C1);
FA fa2(X[2],Y[2],C1,S[2],C2);
FA fa3(X[3],Y[3],C2,S[3],C3);
FA fa4(X[4],Y[4],C3,S[4],C4);
FA fa5(X[5],Y[5],C4,S[5],C5);
FA fa6(X[6],Y[6],C5,S[6],C6);
FA fa7(X[7],Y[7],C6,S[7],C7);
FA fa8(X[8],Y[8],C7,S[8],C8);
FA fa9(X[9],Y[9],C8,S[9],C9);
FA fa10(X[10],Y[10],C9,S[10],C10);
FA fa11(X[11],Y[11],C10,S[11],C11);
FA fa12(X[12],Y[12],C11,S[12],C12);
FA fa13(X[13],Y[13],C12,S[13],C13);
FA fa14(X[14],Y[14],C13,S[14],C14);
FA fa15(X[15],Y[15],C14,S[15],C15);
FA fa16(X[16],Y[16],C15,S[16],C16);
FA fa17(X[17],Y[17],C16,S[17],C17);
FA fa18(X[18],Y[18],C17,S[18],C18);
FA fa19(X[19],Y[19],C18,S[19],C19);
FA fa20(X[20],Y[20],C19,S[20],C20);
FA fa21(X[21],Y[21],C20,S[21],C21);
FA fa22(X[22],Y[22],C21,S[22],C22);
FA fa23(X[23],Y[23],C22,S[23],Co);


endmodule
 
//module testCRA;
//
//wire [23:0] S;
//wire Co;
//
//CarryRippleAdder_24 cra_24(24'b11,24'b111,1'b0,S,Co);
//
////always@(Co)
//initial
//begin
//	$monitor("%b, %b",S,Co);
//	//$monitor("%x",S);
//	//$display("%d",S);
//	//$monitor(Co);
//	$finish;
//end
//
//endmodule

//module full_adder(A, B, Cin, S, Cout);
//   output S;
//   output Cout;
//   input  A;
//   input  B;
//   input  Cin;
//   
//   wire   w1;
//   wire   w2;
//   wire   w3;
//   wire   w4;
//   
//   xor(w1, A, B);
//   xor(S, Cin, w1);
//   and(w2, A, B);   
//   and(w3, A, Cin);
//   and(w4, B, Cin);   
//   or(Cout, w2, w3, w4);
//endmodule // full_adder
//
//module ripple_carry_adder(A, B, Cin, S, Cout);
//   output [3:0] S;  // The 4-bit sum.
//   output 	Cout;  // The 1-bit carry.
//   input [3:0] 	A;  // The 4-bit augend.
//   input [3:0] 	B;  // The 4-bit addend.
//   input Cin;
//
//   wire 	C0; // The carry out bit of fa0, the carry in bit of fa1.
//   wire 	C1; // The carry out bit of fa1, the carry in bit of fa2.
//   wire 	C2; // The carry out bit of fa2, the carry in bit of fa3.
//	
//   full_adder fa0(A[0], B[0], Cin, S[0], C0);    // Least significant bit.
//   full_adder fa1(A[1], B[1], C0, S[1], C1);
//   full_adder fa2(A[2], B[2], C1, S[2], C2);
//   full_adder fa3(A[3], B[3], C2, S[3], Cout);    // Most significant bit.
//endmodule // ripple_carry_adder
//
//module test;
//
//wire [3:0] S;
//wire Co;
//
//ripple_carry_adder cra_24(4'b11,4'b11,1'b0, S, Co);
//
//always@(Co)
//begin
//	$display(S);
//	$display(Co);
//	$finish;
//end
//
//endmodule




