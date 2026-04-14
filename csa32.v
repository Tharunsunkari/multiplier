`timescale 1ns / 1ps

module CSA_32 (
    input [31:0] A, B, C,
    output [31:0] SUM,
    output [31:0] CARRY
);

genvar i;
generate
    for(i=0;i<32;i=i+1) begin
        FA fa(A[i], B[i], C[i], SUM[i], CARRY[i]);
    end
endgenerate

endmodule