module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
	wire c1;
    wire [15:0] s1,s2;

    add16 a1(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(0),
        .sum(s1),
        .cout(c1)
    );
    add16 a2(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(c1),
        .sum(s2)
        );
	assign sum = {s2,s1};
endmodule