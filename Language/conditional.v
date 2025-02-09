module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
    wire [7:0] w1,w2;
    assign w1 = a>b?b:a;
    assign w2 = c>w1?w1:c;
    assign min = d>w2?w2:d;
endmodule
