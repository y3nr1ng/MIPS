module EXMEM_Reg (
    input       clk,

    input       flush,
    input       stall,

    input   [2-1:0]     MEM_ctrl_i,
    output  [2-1:0]     MEM_ctrl_o,
    input   [2-1:0]     WB_ctrl_i,
    output  [2-1:0]     WB_ctrl_o,
    input   [32-1:0]    ALU_output_i,
    output  [32-1:0]    ALU_output_o,
    input   [32-1:0]    ALU_data_2_i,
    output  [32-1:0]    ALU_data_2_o,
    input   [5-1:0]     RegFwd_i,
    output  [5-1:0]     RegFwd_o
);

    Latch #(.width(2)) EXMEM_MEM_ctrl (
    	.clk			(clk),
    	.rst			(~flush),
    	.we				(~stall),
    	.data_i			(MEM_ctrl_i),
    	.data_o			(MEM_ctrl_o)
    );

    Latch #(.width(2)) EXMEM_WB_ctrl (
        .clk			(clk),
    	.rst			(~flush),
    	.we				(~stall),
    	.data_i			(WB_ctrl_i),
    	.data_o			(WB_ctrl_o)
    );

    Latch EXMEM_ALU_output (
        .clk			(clk),
    	.rst			(~flush),
    	.we				(~stall),
    	.data_i			(ALU_output_i),
    	.data_o			(ALU_output_o)
    );

    Latch EXMEM_ALU_data_2 (
        .clk			(clk),
    	.rst			(~flush),
    	.we				(~stall),
    	.data_i			(ALU_data_2_i),
    	.data_o			(ALU_data_2_o)
    );

    Latch #(.width(5)) EXMEM_RegFwd (
        .clk			(clk),
    	.rst			(~flush),
    	.we				(~stall),
    	.data_i			(RegFwd_i),
    	.data_o			(RegFwd_o)
    );

endmodule
