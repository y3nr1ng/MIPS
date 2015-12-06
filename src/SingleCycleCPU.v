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

wire		[31:0]	instr;

// Instruction memory acts as a ROM.
Memory #(.size(1024)) InstrMem (
	.clk			(clk),
	.addr_i 		(PC.addr_o),
	.cs				(1'b1),
	.we				(1'b0),
	.data_i			(),
	.data_o			(instr)
);


/**
 * ID
 */
wire		[5:0]	instr_op	= instr[31:26];
wire		[5:0]	instr_func	= instr[5:0];

wire		[4:0]	instr_rs	= instr[25:21];
wire		[4:0]	instr_rt	= instr[20:16];
wire		[4:0]	instr_rd	= instr[15:11];

wire		[15:0]	instr_imm	= instr[15:0];
wire		[25:0]	addr_imm 	= instr[25:0];

Registers RegFiles (
	.clk			(clk),
	.Rs_addr		(instr_rs),
	.Rt_addr		(instr_rt),
	.Rs_data		(),
	.Rt_data		(),
	.we				(1'b0),	// TODO
	.Rd_addr		(),
	.Rd_data		()
);

endmodule
