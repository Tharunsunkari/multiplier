module ling_prefix_16bit (
    input  [15:0] A, B, input Cin,
    output [15:0] Sum, output Cout
);
    wire [15:0] g = A & B;
    wire [15:0] p = A ^ B;
    
    wire [15:0] H; // Ling pseudo-carries
    
    wire [15:0] g1 = g | ({g[14:0], Cin});
    wire [15:0] p1 = p & {p[14:0], 1'b1};
    
    wire [15:0] g2 = g1 | (p1 & {g1[13:0], 2'b0});
    wire [15:0] p2 = p1 & {p1[13:0], 2'b0};
    
    wire [15:0] g3 = g2 | (p2 & {g2[11:0], 4'b0});
    wire [15:0] p3 = p2 & {p2[11:0], 4'b0};

    wire [15:0] g4 = g3 | (p3 & {g3[7:0], 8'b0});
    
    assign H = g4;
    
    assign Sum[0] = p[0] ^ Cin;
    assign Sum[15:1] = p[15:1] ^ (H[14:0] & p[14:0]);
    assign Cout = g[15] | (p[15] & H[14]);
endmodule