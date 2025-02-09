module fadd(
    input in1,
    input in2,
    input cin,
    output out,
    output cout
);
    wire w;
    assign w = in1 ^ in2;
    assign out =  w ^ cin;
    assign cout = (in1 & in2)|(w & cin);
endmodule

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    genvar i;
    wire tmpc;
    fadd inst0(
        .in1(a[0]),
        .in2(b[0]),
        .cin(cin),
        .out(sum[0]),
        .cout(cout[0])
    );
    generate
        for(i=1;i<100;i++) begin: for1
            fadd inst(
                .in1(a[i]),
                .in2(b[i]),
                .cin(cout[i-1]),
                .out(sum[i]),
                .cout(cout[i])
                );
        end
    endgenerate
endmodule
