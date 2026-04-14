`timescale 1ns / 1ps

module compressor_tree (
    input [31:0] pp0,pp1,pp2,pp3,
    input [31:0] pp4,pp5,pp6,pp7,
    input [31:0] pp8,pp9,pp10,pp11,
    input [31:0] pp12,pp13,pp14,pp15,
    output [31:0] SUM,
    output [31:0] CARRY
);

wire [31:0] s1,c1,s2,c2,s3,c3;

// Stage 1
CSA_32 c1a(pp0,pp1,pp2,s1,c1);
CSA_32 c1b(pp3,pp4,pp5,s2,c2);
CSA_32 c1c(pp6,pp7,pp8,s3,c3);

// Stage 2
wire [31:0] s4,c4,s5,c5;
CSA_32 c2a(s1, c1<<1, s2, s4, c4);
CSA_32 c2b(c2<<1, s3, c3<<1, s5, c5);

// Stage 3
wire [31:0] s6,c6;
CSA_32 c3a(s4, c4<<1, s5, s6, c6);

// Final combine
assign SUM = s6 + (c6<<1) + pp9 + pp10 + pp11 + pp12 + pp13 + pp14 + pp15;
assign CARRY = 32'b0;

endmodule
