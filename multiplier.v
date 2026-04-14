`timescale 1ns / 1ps

module multiplier_16bit_hybrid (
    input clk,
    input [15:0] A, B,
    output reg [31:0] P
);

wire [31:0] pp0,pp1,pp2,pp3;
wire [31:0] pp4,pp5,pp6,pp7;
wire [31:0] pp8,pp9,pp10,pp11;
wire [31:0] pp12,pp13,pp14,pp15;

wire [31:0] sum, carry, result;

// Partial products
partial_products pp_gen(
A,B,
pp0,pp1,pp2,pp3,
pp4,pp5,pp6,pp7,
pp8,pp9,pp10,pp11,
pp12,pp13,pp14,pp15
);

// Compressor tree
compressor_tree ct(
pp0,pp1,pp2,pp3,
pp4,pp5,pp6,pp7,
pp8,pp9,pp10,pp11,
pp12,pp13,pp14,pp15,
sum, carry
);

// Hybrid adder
adder_32bit ha(sum, carry, result);

// Pipeline (IMPORTANT)
reg [31:0] stage1;

always @(posedge clk) begin
    stage1 <= result;
    P <= stage1;
end

endmodule
