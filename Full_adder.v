`timescale 1ns / 1ps

module FA(input a,b,cin, output sum, carry);
assign sum = a ^ b ^ cin;
assign carry = (a & b) | (b & cin) | (a & cin);
endmodule