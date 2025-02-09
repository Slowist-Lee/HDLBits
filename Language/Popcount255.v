module top_module( 
    input [254:0] in,
    output [7:0] out );
    integer i;
    assign out = {8{1'b0}};  
    always @(*) begin
        for(i=0;i<255;i=i+1)begin
            if (in[i]==1)
                out = out + 1'b1;
            else
                out = out + 1'b0;
        end
    end
endmodule
