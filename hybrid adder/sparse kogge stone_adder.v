module sparse_ks_16bit (
    input  [15:0] A, B, input Cin,
    output [15:0] Sum, output Cout
);
    wire [15:0] g0 = A & B;
    wire [15:0] p0 = A ^ B;

    // Stage 1
    wire [15:0] G1 = g0 | (p0 & {g0[14:0], Cin});
    wire [15:0] P1 = p0 & {p0[14:0], 1'b1};

    // Stage 2
    wire [15:0] G2 = G1 | (P1 & {G1[13:0], 2'b0});
    wire [15:0] P2 = P1 & {P1[13:0], 2'b0};

    // Stage 3
    wire [15:0] G3 = G2 | (P2 & {G2[11:0], 4'b0});
    wire [15:0] P3 = P2 & {P2[11:0], 4'b0};

    // Stage 4
    wire [15:0] G4 = G3 | (P3 & {G3[7:0], 8'b0});

    assign Sum = p0 ^ {G4[14:0], Cin};
    assign Cout = G4[15];
endmodule