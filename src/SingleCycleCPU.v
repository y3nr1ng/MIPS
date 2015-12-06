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

wire		[4:0]	EX_ctrl;
	wire		[2:0]	ALUop_wire	= EX_ctrl[4:2];
	wire				ALUsrc_wire	= EX_ctrl[1];
	wire				RegDst_wire	= EX_ctrl[0];

wire		[1:0]	MEM_ctrl;
	wire				MEM_cs_wire	= MEM_ctrl[1];
	wire				MEM_we_wire	= MEM_ctrl[0];

wire		[1:0]	WB_ctrl;
	wire				WB_mux_wire	= WB_ctrl[1];
	wire				Reg_we_wire = WB_ctrl[0];
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
	.we				(1'b1), // TODO
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
	.data_o			()
);


/**
 * IF/ID
 */
Latch IFID_PC_Inc (
	.clk			(clk),
	.rst			(1'b0), // TODO
	.en				(1'b1),
	.data_i			(PC_Inc.data_o),
	.data_o			()
);

Latch IFID_Instr (
	.clk			(clk),
	.rst			(1'b0), // TODO
	.en				(1'b1),
	.data_i			(InstrMem.data_o),
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
	.we				(Reg_we_wire),
	.Rd_addr		(MEMWB_RegFwd.data_o), // TODO
	.Rd_data	 	(WB_Mux.data_o)
);

Comparer Rs_eq_Rt (
	.data_1			(RegFiles.Rs_data),
	.data_2			(RegFiles.Rt_data),
	.is_greater		(),
	.is_equal		(),
	.is_less		()
);

SignExtend SignExt (
	.data_i			(instr_imm),
	.data_o			()
);

Adder PC_BranchAddr (
	.data_1			(IFID_PC_Inc.data_o),
	.data_2			({ SignExt.data_o[31:2], 2'b0 }),
	.data_o			()
);

GeneralControl Ctrl (
	.op_i			(instr_op),
	.is_equal_i		(Rs_eq_Rt.is_equal),
	.PC_ctrl_o		(),
	.EX_ctrl_o		(),
	.MEM_ctrl_o		(),
	.WB_ctrl_o		()
);

HazardDetectionUnit HDU (
);

/**
 * ID/EX
 */
Latch #(.width(5)) IDEX_EX_ctrl (
	.clk			(clk),
	.rst			(1'b0), // TODO
	.en				(1'b1),
	.data_i			(Ctrl.EX_ctrl_o),
	.data_o			(EX_ctrl)
);

Latch #(.width(2)) IDEX_MEM_ctrl (
	.clk			(clk),
	.rst			(1'b0), // TODO
	.en				(1'b1),
	.data_i			(Ctrl.MEM_ctrl_o),
	.data_o			()
);

Latch #(.width(2)) IDEX_WB_ctrl (
	.clk			(clk),
	.rst			(1'b0), // TODO
	.en				(1'b1),
	.data_i			(Ctrl.WB_ctrl_o),
	.data_o			()
);

Latch IDEX_Rs_data (
	.clk			(clk),
	.rst			(1'b0), // TODO
	.en				(1'b1),
	.data_i			(RegFiles.Rs_data),
	.data_o			()
);

Latch IDEX_Rt_data (
	.clk			(clk),
	.rst			(1'b0), // TODO
	.en				(1'b1),
	.data_i			(RegFiles.Rt_data),
	.data_o			()	
);

Latch IDEX_imm_data (
	.clk			(clk),
	.rst			(1'b0), // TODO
	.en				(1'b1),
	.data_i			(SignExt.data_o),
	.data_o			()
);

Latch #(.width(5)) IDEX_Rs (
	.clk			(clk),
	.rst			(1'b0),
	.en				(1'b1),
	.data_i			(instr_rs),
	.data_o			()
);

Latch #(.width(5)) IDEX_Rt (
	.clk			(clk),
	.rst			(1'b0),
	.en				(1'b1),
	.data_i			(instr_rt),
	.data_o			()
);

/**
 * EX
 */
Multiplexer4Way Data_1_Mux (
	.data_1			(IDEX_Rs_data.data_o),
	.data_2			(WB_Mux.data_o),
	.data_3			(EXMEM_ALU_output.data_o),
	.data_4			(32'bz),
	.sel			(FwdUnit.ALU_data_1_sel),
	.data_o			()
);

Multiplexer4Way Data_2_Mux (
	.data_1			(IDEX_Rt_data.data_o),
	.data_2			(WB_Mux.data_o),
	.data_3			(EXMEM_ALU_output.data_o),
	.data_4			(32'bz),
	.sel			(FwdUnit.ALU_data_2_sel),
	.data_o			()
);

Multiplexer2Way Data_2_imm_Mux (
	.data_1			(Data_2_Mux.data_o),
	.data_2			(IDEX_imm_data.data_o),
	.sel			(ALUsrc_wire),
	.data_o			()
);

ALU ALU (
	.ALUop_i		(ALUop_wire),
	.data_1			(Data_1_Mux.data_o),
	.data_2			(Data_2_imm_Mux.data_o),
	.data_o			(),
	.is_zero		()
);

Multiplexer2Way #(.width(5)) Fwd_Mux (
	.data_1			(IDEX_Rs.data_o),
	.data_2			(IDEX_Rt.data_o),
	.sel			(RegDst_wire),
	.data_o			()
);

ForwardingUnit FwdUnit (
	.EXMEM_we		(MEM_we_wire),
	.MEMWB_we		(Reg_we_wire),
	.IDEX_Rs		(IDEX_Rs.data_o),
	.IDEX_Rt		(IDEX_Rt.data_o),
	.EXMEM_Rd		(EXMEM_RegFwd.data_o),
	.MEMWB_Rd		(MEMWB_RegFwd.data_o),
	.ALU_data_1_sel	(),
	.ALU_data_2_sel	()
);


/**
 * EX/MEM
 */
Latch #(.width(2)) EXMEM_MEM_ctrl (
	.clk			(clk),
	.rst			(1'b0),
	.en				(1'b1),
	.data_i			(IDEX_MEM_ctrl.data_o),
	.data_o			(MEM_ctrl)
);

Latch #(.width(2)) EXMEM_WB_ctrl (
	.clk			(clk),
	.rst			(1'b0),
	.en				(1'b1),
	.data_i			(IDEX_WB_ctrl.data_o),
	.data_o			()
);

Latch EXMEM_ALU_output (
	.clk			(clk),
	.rst			(1'b0),
	.en				(1'b1),
	.data_i			(ALU.data_o),
	.data_o			()
);

Latch EXMEM_ALU_data_2 (
	.clk			(clk),
	.rst			(1'b0),
	.en				(1'b1),
	.data_i			(Data_2_imm_Mux.data_o),
	.data_o			()
);

Latch #(.width(5)) EXMEM_RegFwd (
	.clk			(clk),
	.rst			(1'b0),
	.en				(1'b1),
	.data_i			(Fwd_Mux.data_o),
	.data_o			()
);


/**
 * MEM
 */
Memory #(.size(32)) DataMem (
	.clk			(clk),
	.addr_i			(EXMEM_ALU_output.data_o),
	.cs				(MEM_cs_wire),
	.we				(MEM_we_wire),
	.data_i			(EXMEM_ALU_data_2.data_o),
	.data_o			()
);


/**
 * MEM/WB
 */
Latch #(.width(2)) MEMWB_WB_ctrl (
	.clk			(clk),
	.rst			(1'b0), // TODO
	.en				(1'b1),
	.data_i			(IDEX_WB_ctrl.data_o),
	.data_o			(WB_ctrl)
);

Latch MEMWB_ALU_output (
	.clk			(clk),
	.rst			(1'b0),
	.en				(1'b1),
	.data_i			(EXMEM_ALU_output.data_o),
	.data_o			()
);

Latch MEMWB_Mem_output (
	.clk			(clk),
	.rst			(1'b0),
	.en				(1'b1),
	.data_i			(DataMem.data_o),
	.data_o			()
);

Latch #(.width(5)) MEMWB_RegFwd (
	.clk			(clk),
	.rst			(1'b0),
	.en				(1'b1),
	.data_i			(EXMEM_RegFwd.data_o),
	.data_o			()
);


/**
 * WB
 */
Multiplexer2Way WB_Mux (
	.data_1			(MEMWB_Mem_output.data_o),
	.data_2			(MEMWB_ALU_output.data_o),
	.sel			(WB_mux_wire),
	.data_o			()
);


endmodule
