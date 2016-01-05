module MEMWB_Reg (
    input       clk,
    input       rst,

    input       flush,
    input       stall,

    input   [2-1:0]     WB_ctrl_i,
    output  [2-1:0]     WB_ctrl_o,
    input   [32-1:0]    ALU_output_i,
    output  [32-1:0]    ALU_output_o,
    input   [32-1:0]    Mem_output_i,
    output  [32-1:0]    Mem_output_o,
    input   [5-1:0]     RegFwd_i,
    output  [5-1:0]     RegFwd_o
);

    Latch #(.width(2)) MEMWB_WB_ctrl (
    	.clk			(clk),
        .rst            (~flush),
        .we             (~stall),
    	.data_i			(WB_ctrl_i),
    	.data_o			(WB_ctrl_o)
    );

    Latch MEMWB_ALU_output (
        .clk			(clk),
        .rst            (~flush),
        .we             (~stall),
    	.data_i			(ALU_output_i),
    	.data_o			(ALU_output_o)
    );

    Latch MEMWB_Mem_output (
        .clk			(clk),
        .rst            (~flush),
        .we             (~stall),
    	.data_i			(Mem_output_i),
    	.data_o			(Mem_output_o)
    );

    Latch #(.width(5)) MEMWB_RegFwd (
        .clk			(clk),
        .rst            (~flush),
        .we             (~stall),
    	.data_i			(RegFwd_i),
    	.data_o			(RegFwd_o)
    );

endmodule
