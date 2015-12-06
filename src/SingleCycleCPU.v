`include "LookupTable.v"

module SingleCycleCPU
(
	input		clk,
	input		rst,
	input		start
);

/**
 * Internal bus declarations
 */
wire		[31:0]	instr;

wire		[5:0]	instr_op	= instr[31:26];
wire		[5:0]	instr_func	= instr[5:0];

wire		[4:0]	instr_rs	= instr[25:21];
wire		[4:0]	instr_rt	= instr[20:16];
wire		[4:0]	instr_rd	= instr[15:11];

wire		[15:0]	instr_imm	= instr[15:0];
wire		[25:0]	addr_imm 	= instr[25:0];

/**
 * IF
 */
Multiplexer4Way PC_Mux (
	.data_1			(PC_Inc.data_o), // PC += 4
	.data_2			(32'bz),
	.data_3			({ PC_Inc.data_o[31:28], addr_imm, 2'b0 }), // Jump to (imm << 2)
	.data_4			(PC_BranchAddr.data_o),	// Branch address, PC += (imm << 2)
	.sel			(2'b00),	// TODO
	.data_o			()
);

ProgramCounter PC (
	.clk			(clk),
	.rst			(rst),
	.start			(start),
	.we				(1'b1),
	.addr_i			(PC_Mux.data_o),
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
	.data_o			(instr)
);


/**
 * ID
 */
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

SignExtend SignExt (
	.data_i			(instr_imm),
	.data_o			()
);

Adder PC_BranchAddr (
	.data_1			(PC_Inc.data_o),
	.data_2			({ SignExt.data_o[31:2], 2'b0 }),
	.data_o			()
);


endmodule