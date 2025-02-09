module mulx ( 
    input [1:0] sel, 
    input [7:0] i1,
    input [7:0] i2,
    input [7:0] i3,
    input [7:0] i4,
    output [7:0] q 
);
    always @(*) begin
        case(sel)
            2'b00: q = i1;
            2'b01: q = i2;
            2'b10: q = i3;
            2'b11: q = i4;
        endcase
    end
endmodule

module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] w1,w2,w3;
    my_dff8 inst1(.clk(clk),.d(d),.q(w1));
    my_dff8 inst2(.clk(clk),.d(w1),.q(w2));
    my_dff8 inst3(.clk(clk),.d(w2),.q(w3));
    mulx m1(.sel(sel),.i1(d),.i2(w1),.i3(w2),.i4(w3),.q(q));
endmodule