module xorg(
    input [31:0] in,
    input sub,
    output [31:0] out
);
    always @(*) begin
        case (sub)
            0: out = in;
            1: out = ~ in;
        endcase
    end
endmodule   
module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] i1;
    wire c1;
    xorg inst(
        .in(b),
        .sub(sub),
        .out(i1)
        );
        
    add16 inst1(
        .a(a[15:0]),
        .b(i1[15:0]),
        .cin(sub),
        .cout(c1),
        .sum(sum[15:0])
        );

    add16 inst2(
        .a(a[31:16]),
        .b(i1[31:16]),
        .cin(c1),
        .sum(sum[31:16])
        );
endmodule