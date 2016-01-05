module IDEX_Reg (
	input				clk,

	input				flush,
	input				stall,

	input	[5-1:0]		EX_ctrl_i,
	output	[5-1:0]		EX_ctrl_o,
	input	[2-1:0]		MEM_ctrl_i,
	output	[2-1:0]		MEM_ctrl_o,
	input	[2-1:0]		WB_ctrl_i,
	output	[2-1:0]		WB_ctrl_o,
	input	[32-1:0]	Rs_data_i,
	output	[32-1:0]	Rs_data_o,
	input	[32-1:0]	Rt_data_i,
	output	[32-1:0]	Rt_data_o,
	input	[32-1:0]	imm_data_i,
	output	[32-1:0]	imm_data_o,
	input	[5-1:0]		Rs_i,
	output	[5-1:0]		Rs_o,
	input	[5-1:0]		Rt_i,
	output	[5-1:0]		Rt_o,
	input	[5-1:0]		Rd_i,
	output	[5-1:0]		Rd_o
);

	Latch #(.width(5)) IDEX_EX_ctrl (
		.clk			(clk),
		.rst			(flush),
		.we				(stall),
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
		.clk			(clk),
		.rst			(~flush),
		.we				(~stall),
		.data_i			(Ctrl.WB_ctrl_o),
		.data_o			()
	);

	Latch IDEX_Rs_data (
		.clk			(clk),
		.rst			(~flush),
		.we				(~stall),
		.data_i			(RegFiles.Rs_data),
		.data_o			()
	);

	Latch IDEX_Rt_data (
		.clk			(clk),
		.rst			(~flush),
		.we				(~stall),
		.data_i			(RegFiles.Rt_data),
		.data_o			()
	);

	Latch IDEX_imm_data (
		.clk			(clk),
		.rst			(~flush),
		.we				(~stall),
		.data_i			(SignExt.data_o),
		.data_o			()
	);

	Latch #(.width(5)) IDEX_Rs (
		.clk			(clk),
		.rst			(~flush),
		.we				(~stall),
		.data_i			(instr_rs),
		.data_o			()
	);

	Latch #(.width(5)) IDEX_Rt (
		.clk			(clk),
		.rst			(~flush),
		.we				(~stall),
		.data_i			(instr_rt),
		.data_o			()
	);

	Latch #(.width(5)) IDEX_Rd (
		.clk			(clk),
		.rst			(~flush),
		.we				(~stall),
		.data_i			(Rd_i),
		.data_o			(Rd_o)
	);

endmodule
