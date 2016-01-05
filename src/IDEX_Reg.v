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
		.rst			(~flush),
		.we				(~stall),
		.data_i			(EX_ctrl_i),
		.data_o			(EX_ctrl_o)
	);

	Latch #(.width(2)) IDEX_MEM_ctrl (
		.clk			(clk),
		.rst			(~flush),
		.we				(~stall),
		.data_i			(MEM_ctrl_i),
		.data_o			(MEM_ctrl_o)
	);

	Latch #(.width(2)) IDEX_WB_ctrl (
		.clk			(clk),
		.rst			(~flush),
		.we				(~stall),
		.data_i			(WB_ctrl_i),
		.data_o			(WB_ctrl_o)
	);

	Latch IDEX_Rs_data (
		.clk			(clk),
		.rst			(~flush),
		.we				(~stall),
		.data_i			(Rs_data_i),
		.data_o			(Rs_data_o)
	);

	Latch IDEX_Rt_data (
		.clk			(clk),
		.rst			(~flush),
		.we				(~stall),
		.data_i			(Rt_data_i),
		.data_o			(Rt_data_o)
	);

	Latch IDEX_imm_data (
		.clk			(clk),
		.rst			(~flush),
		.we				(~stall),
		.data_i			(imm_data_i),
		.data_o			(imm_data_o)
	);

	Latch #(.width(5)) IDEX_Rs (
		.clk			(clk),
		.rst			(~flush),
		.we				(~stall),
		.data_i			(Rs_i),
		.data_o			(Rs_o)
	);

	Latch #(.width(5)) IDEX_Rt (
		.clk			(clk),
		.rst			(~flush),
		.we				(~stall),
		.data_i			(Rt_i),
		.data_o			(Rt_o)
	);

	Latch #(.width(5)) IDEX_Rd (
		.clk			(clk),
		.rst			(~flush),
		.we				(~stall),
		.data_i			(Rd_i),
		.data_o			(Rd_o)
	);

endmodule
