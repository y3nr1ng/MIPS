module IFID_Reg (
	input				clk,
	input				rst,
	
	input				flush,
	input				stall,

	input	[32-1:0]	PC_Inc_i,
	output	[32-1:0]	PC_Inc_o,
	input	[32-1:0]	InstrMem_i,
	output	[32-1:0]	InstrMem_o
);

	reg r_flush;
	always @ (negedge flush) begin
		r_flush <= 1'b1;
		@ (negedge clk) begin
			r_flush <= 1'b0;
		end
	end

	Latch IFID_PC_Inc (
		.clk	(clk),
		.rst	(~r_flush),
		.we		(~stall),
		.data_i	(PC_Inc_i),
		.data_o	(PC_Inc_o)
	);

	Latch IFID_Instr (
		.clk	(clk),
		.rst	(~r_flush),
		.we		(~stall),
		.data_i	(InstrMem_i),
		.data_o	(InstrMem_o)
	);

endmodule
