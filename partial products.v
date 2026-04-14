`timescale 1ns / 1ps

module partial_products (
    input [15:0] A, B,
    output [31:0] pp0,pp1,pp2,pp3,
    output [31:0] pp4,pp5,pp6,pp7,
    output [31:0] pp8,pp9,pp10,pp11,
    output [31:0] pp12,pp13,pp14,pp15
);

assign pp0  = B[0]  ? (A << 0)  : 0;
assign pp1  = B[1]  ? (A << 1)  : 0;
assign pp2  = B[2]  ? (A << 2)  : 0;
assign pp3  = B[3]  ? (A << 3)  : 0;
assign pp4  = B[4]  ? (A << 4)  : 0;
assign pp5  = B[5]  ? (A << 5)  : 0;
assign pp6  = B[6]  ? (A << 6)  : 0;
assign pp7  = B[7]  ? (A << 7)  : 0;

assign pp8  = B[8]  ? (A << 8)  : 0;
assign pp9  = B[9]  ? (A << 9)  : 0;
assign pp10 = B[10] ? (A << 10) : 0;
assign pp11 = B[11] ? (A << 11) : 0;
assign pp12 = B[12] ? (A << 12) : 0;
assign pp13 = B[13] ? (A << 13) : 0;
assign pp14 = B[14] ? (A << 14) : 0;
assign pp15 = B[15] ? (A << 15) : 0;

endmodule
