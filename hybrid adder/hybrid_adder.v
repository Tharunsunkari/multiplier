`timescale 1ns / 1ps

module hybrid_adder_32bit (
    input  [31:0] A,    
    input  [31:0] B,    
    output [31:0] SUM   
);

   
    wire cin_int = 1'b0;      
    wire enable_int = 1'b1;   
    wire cout_unused;
    wire c16;
    wire [15:0] sum_low, sum_high;

       ling_prefix_16bit L0 (
        .A(A[15:0]),
        .B(B[15:0]),
        .Cin(cin_int),
        .Sum(sum_low),
        .Cout(c16)
    );

    
    sparse_ks_16bit K0 (
        .A(A[31:16]),
        .B(B[31:16]),
        .Cin(c16),
        .Sum(sum_high),
        .Cout(cout_unused)
    );

    
    assign SUM = enable_int ? {sum_high, sum_low} : 32'b0;

endmodule