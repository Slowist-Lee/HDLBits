module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire c1;
    wire [15:0] o2,o3;
    add16 a1(.a(a[15:0]),.b(b[15:0]),.cin(0),.cout(c1),.sum(sum[15:0]));
    add16 a2(.a(a[31:16]),.b(b[31:16]),.cin(0),.sum(o2));
    add16 a3(.a(a[31:16]),.b(b[31:16]),.cin(1),.sum(o3));
    always @(*) begin
        case(c1)
        0: sum[31:16] = o2;
        1: sum[31:16] = o3;
        endcase
    end
endmodule
