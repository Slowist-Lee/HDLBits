module top_module (
    input clk,
    input resetn, // 低电平有效的复位信号
    input [1:0] byteena, // 字节使能信号
    input [15:0] d, // 输入数据
    output reg [15:0] q // 输出数据，需要声明为 reg 类型
);

    // 处理低字节（byteena[0] 控制）
    always @(posedge clk) begin
        if (!resetn) // 复位信号有效时清零
            q[7:0] <= 8'b0;
        else if (byteena[0]) // byteena[0] 为 1 时更新低字节
            q[7:0] <= d[7:0];
    end

    // 处理高字节（byteena[1] 控制）
    always @(posedge clk) begin
        if (!resetn) // 复位信号有效时清零
            q[15:8] <= 8'b0;
        else if (byteena[1]) // byteena[1] 为 1 时更新高字节
            q[15:8] <= d[15:8];
    end

endmodule