module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next;

    always @(*) begin
        // State transition logic
        case(state)
            OFF: next = j ? ON:OFF;
            ON: next = k ? OFF:ON;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)
            state<=OFF;
        else
            state<=next;
    end

    // Output logic
    // assign out = (state == ...);
    assign out = (state == ON);
endmodule
