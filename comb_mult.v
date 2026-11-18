`timescale 1ns / 1ps
// 4x4 combinational multiplier from lab 8

module comb_mult(
    input [3:0] a,
    input [3:0] b,
    output [7:0] product
    );

wire [7:0] A;
wire [7:0] pp0, pp1, pp2, pp3;

assign A = a;   // make a 8 bits wide

assign pp0 = b[0] ? A : 0;   // a * 1
assign pp1 = b[1] ? A << 1 : 0;   // a * 2
assign pp2 = b[2] ? A << 2 : 0;   // a * 4
assign pp3 = b[3] ? A << 3 : 0;   // a * 8

assign product = pp0 + pp1 + pp2 + pp3;

endmodule
