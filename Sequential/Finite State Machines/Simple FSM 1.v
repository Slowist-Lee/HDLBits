//这题抄答案的，状态机从0开始，抄抄更健康
module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        case(state)
            A: next = in ? A:B;
            B: next = in ? B:A;
        endcase
    end
    //这段是根据状态图转移的关系写的

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        //这段主要描述复位了
        if(areset)
            state<=B;
        else
            state<=next;
    end

    // Output logic
    // assign out = (state == ...);
    assign out = (state == B);
endmodule
