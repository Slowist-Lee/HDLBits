module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    integer i;
    reg [7:0] old;
    initial old = 8'b0;
    always @ (posedge clk)begin
        for(i=0;i<8;i=i+1)begin
            if(in[i]>0 && old[i] == 0)
                pedge[i]<=1;
            else
                pedge[i]<=0;
        end
        old<=in;
    end
endmodule
