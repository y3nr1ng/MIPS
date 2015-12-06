`include "LookupTable.v"

module SingleCycleCPU
(
	input		clk,
	input		rst,
	input		start
);

/**
 * IF
 */
ProgramCounter PC (
	.clk			(clk),
	.rst			(rst),
	.start			(start),
	.we				(1'b1),
	.addr_i			(PC_Inc.data_o),
	.addr_o			()
);

Adder PC_Inc (
	.data_1			(PC.addr_o),
	.data_2			(32'b100),
	.data_o			()
);

// Instruction memory acts as a ROM.
Memory #(.size(1024)) InstrMem (
	.clk			(clk),
	.addr_i 		(PC.addr_o),
	.cs				(1'b1),
	.we				(1'b0),
	.data_i			(),
	.data_o			()
);

endmodule
