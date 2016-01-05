module IDEX_Reg (
	input				clk,
	
	input				flush,
	input				stall,

	input	[32-1:0]	PC_Inc_i,
	output	[32-1:0]	PC_Inc_o,
	input	[32-1:0]	InstrMem_i,
	output	[32-1:0]	InstrMem_o
);

	Latch #(.width(5)) IDEX_EX_ctrl (
	.clk			(clk && ~L1Cache.p1_stall_o),
	.rst			(1'b1),
	.we				(1'b1),
	.data_i			(Ctrl.EX_ctrl_o),
	.data_o			(EX_ctrl)
);

Latch #(.width(2)) IDEX_MEM_ctrl (
	.clk			(clk && ~L1Cache.p1_stall_o),
	.rst			(1'b1),
	.we				(1'b1),
	.data_i			(Ctrl.MEM_ctrl_o),
	.data_o			()
);

Latch #(.width(2)) IDEX_WB_ctrl (
	.clk			(clk && ~L1Cache.p1_stall_o),
	.rst			(1'b1),
	.we				(1'b1),
	.data_i			(Ctrl.WB_ctrl_o),
	.data_o			()
);

Latch IDEX_Rs_data (
	.clk			(clk && ~L1Cache.p1_stall_o),
	.rst			(1'b1),
	.we				(1'b1),
	.data_i			(RegFiles.Rs_data),
	.data_o			()
);

Latch IDEX_Rt_data (
	.clk			(clk && ~L1Cache.p1_stall_o),
	.rst			(1'b1),
	.we				(1'b1),
	.data_i			(RegFiles.Rt_data),
	.data_o			()	
);

Latch IDEX_imm_data (
	.clk			(clk && ~L1Cache.p1_stall_o),
	.rst			(1'b1),
	.we				(1'b1),
	.data_i			(SignExt.data_o),
	.data_o			()
);

Latch #(.width(5)) IDEX_Rs (
	.clk			(clk && ~L1Cache.p1_stall_o),
	.rst			(1'b1),
	.we				(1'b1),
	.data_i			(instr_rs),
	.data_o			()
);

Latch #(.width(5)) IDEX_Rt (
	.clk			(clk && ~L1Cache.p1_stall_o),
	.rst			(1'b1),
	.we				(1'b1),
	.data_i			(instr_rt),
	.data_o			()
);

Latch #(.width(5)) IDEX_Rd (
	.clk			(clk && ~L1Cache.p1_stall_o),
	.rst			(1'b1),
	.we				(1'b1),
	.data_i			(instr_rd),
	.data_o			()
);

endmodule
