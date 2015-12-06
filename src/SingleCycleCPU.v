`include "LookupTable.v"

module SingleCycleCPU
(
	input		clk,
	input		rst,
	input		start
);

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

endmodule
