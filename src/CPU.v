`include "LookupTable.v"

module CPU
(
	input		clk,
	input		rst,
	input		start
);

	//
	// IF
	//

	ProgramCounter PC
	(
    	.clk		(clk),
   		.rst		(rst),
   		.start      (start),
   		.we			(HDU.PCwr_o),
   		.addr_i     (PC_Mux.data_o),
   		.addr_o     ()
	);
	
	// TODO: directly combine the bus and left out the LSB, instead of using shift operation.
	Multiplexer4Way PC_Mux
	(
		.data_1		(PC_Inc.data_o),
		.data_2		(32'bz),
		.data_3		({ PC.addr_o[31:28], PC_JumpShl.data_o[27:0] }),
		.data_4		(PC_BranchAdd.data_o),
		.sel		(Ctrl.PC_ctrl_o),
		.data_o		()
	);	

	Adder PC_Inc
	(
		.data_1		(PC.addr_o),
		.data_2		(32'b0100),	// PC += 4
		.data_o		()
	);

	Memory #(.size(1024)) InstrMem
	(
		.clk		(clk),
		.addr_i		(PC.addr_o),
		.cs			(1'b1),
		.we			(1'b0),
		.data_i		(),	// No input for ROM.
		.data_o		()
	);


	//
	// IF/ID
	//
	
	wire	[31:0]	instr;

	Latch #() IFID_PC_Inc
	(
		.clk		(clk),
		.rst		(Ctrl.PC_ctrl_o[1]),	// Perform reset when jump or branch.
		.en			(1'b1),
		.data_i		(PC_Inc.data_o),
		.data_o		()
	);

	Latch #() IFID_Instr
	(
		.clk		(clk),
		.rst		(Ctrl.PC_ctrl_o[1]),	// Perform reset when jump or branch.
		.en			(1'b1),
		.data_i		(InstrMem.data_o),
		.data_o		(instr)
	);

	
	//
	// ID
	//
	
	wire	[5:0]	instr_op	= instr[31:26];
	wire	[5:0]	instr_func	= instr[5:0];

	wire	[4:0]	instr_rs 	= instr[25:21];
	wire	[4:0]	instr_rt 	= instr[20:16];
	wire	[4:0] 	instr_rd 	= instr[15:11];

	wire	[15:0]	instr_imm	= instr[15:0];
	wire	[25:0]	addr_imm	= instr[25:0];

	Registers RegFiles
	(
		.clk		(clk),
		.Rs_addr	(instr_rs),
		.Rs_data	(),
		.Rt_addr	(instr_rt),
		.Rt_data	(),
		.we			(MEMWB_WB_ctrl.data_o[0]),
		.Rd_addr	(MEMWB_RegFwd.data_o),
		.Rd_data	(WB_Mux.data_o)
	);

	SignExtend SignExt
	(
		.data_i		(instr_imm),
		.data_o		()
	);

	Shifter PC_JumpShl
	(
		.x			({ 6'b0, addr_imm }),
		.y			(32'b0010),
		.data_o		()
	);
	
	// TODO: We should try to merge shifter and adder together into: NextAddr
	Shifter PC_BranchShl
	(
		.x			(SignExt.data_o),
		.y			(32'b0010),
		.data_o		()
	);

	Adder PC_BranchAdd
	(	
		.data_1		(PC_BranchShl.data_o),
		.data_2		(IFID_PC_Inc.data_o),
		.data_o		()
	);

	Comparer Rs_eq_Rt
	(
		.data_1		(RegFiles.Rs_data),
		.data_2		(RegFiles.Rt_data),
		.is_equal	(),
		.is_greater	(),
		.is_less	()
	);

	HazardDetectionUnit HDU
	(
		.IDEXMr_i	(),
		.IDEXRt_i	(),
		.IFIDRs_i	(),
		.IFIDRt_i	(),
		.IFIDwr_o	(),
		.PCwr_o		(PC.we),
		.stall		(),
		.flush		()
	);

	GeneralControl Ctrl
	(
		.op_i		(instr_op),
		.is_equal_i	(Rs_eq_Rt.is_equal),
		.PC_ctrl_o	(),
		.EX_ctrl_o	(),
		.MEM_ctrl_o	(),
		.WB_ctrl_o	()		
	);

	Multiplexer2Way #(.width(9)) Ctrl_Mux
	(
		.data_1		({ Ctrl.EX_ctrl_o, Ctrl.MEM_ctrl_o, Ctrl.WB_ctrl_o }),
		.data_2		(9'b0),
		.sel		(HDU.stall),
		.data_o		()
	);

	//
	// ID/EX
	//

	Latch #(.width(5)) IDEX_EX_ctrl
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(Ctrl_Mux.data_o[8:4]),
		.data_o		()
	);

	Latch #(.width(2)) IDEX_MEM_ctrl
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(Ctrl_Mux.data_o[3:2]),
		.data_o		()
	);

	Latch #(.width(2)) IDEX_WB_ctrl
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(Ctrl_Mux.data_o[1:0]),
		.data_o		()
	);

	Latch IDEX_PC_Inc
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(PC_BranchAdd.data_o),
		.data_o		()
	);

	Latch IDEX_Data1
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(RegFiles.Rs_data),
		.data_o		()
	);
	
	Latch IDEX_Data2
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(RegFiles.Rt_data),
		.data_o		()
	);

	Latch IDEX_SignExt
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(SignExt.data_o),
		.data_o		()
	);

	Latch #(.width(5)) IDEX_RsFwd
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(instr_rs),
		.data_o		()
	);

	Latch #(.width(5)) IDEX_RtFwd
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(instr_rt),
		.data_o		()
	);

	Latch #(.width(5)) IDEX_RdFwd
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(instr_rd),
		.data_o		()
	);


	//
	// EX
	//
	
	ALU ALU
	(
		.ALUop_i	(IDEX_EX_ctrl.data_o[4:2]),
		.data_1		(Data1_Mux.data_o),
		.data_2		(Data2imm_Mux.data_o),
		.data_o		(),
		.is_zero	()
	);
	
	Multiplexer4Way Data1_Mux
	(
		.data_1		(IDEX_Data1.data_o),
		.data_2		(WB_Mux.data_o),
		.data_3		(EXMEM_DataOut.data_o),
		.data_4		(32'bz),
		.sel		(FwdUnit.ALUdata1_sel_o),
		.data_o		()
	);

	Multiplexer4Way Data2_Mux
	(
		.data_1		(IDEX_Data2.data_o),
		.data_2		(WB_Mux.data_o),
		.data_3		(EXMEM_DataOut.data_o),
		.data_4		(32'bz),
		.sel		(FwdUnit.ALUdata2_sel_o),
		.data_o		()
	);
	
	// Fuck this, I'm combining two diagrams now.
	Multiplexer2Way Data2imm_Mux
	(
		.data_1		(Data2_Mux.data_o),
		.data_2		(IDEX_SignExt.data_o),
		.sel		(IDEX_EX_ctrl.data_o[1]),
		.data_o		()
	);

	Multiplexer2Way #(5) Fwd_Mux
	(
		.data_1		(IDEX_RtFwd.data_o),
		.data_2		(IDEX_RdFwd.data_o),
		.sel		(IDEX_EX_ctrl.data_o[0]),
		.data_o		()
	);

	ForwardingUnit FwdUnit
	(
		.EXMEM_rw_i			(EXMEM_WB_ctrl.data_o),
		.MEMWB_rw_i			(MEMWB_WB_ctrl.data_o),
		.IDEX_Rs_i			(IDEX_RsFwd.data_o),
		.IDEX_Rt_i			(IDEX_RtFwd.data_o),
		.EXMEM_Rd_i			(EXMEM_RegFwd.data_o),
		.MEMWB_Rd_i			(MEMWB_RegFwd.data_o),
		.ALUdata1_sel_o		(Data1_Mux.sel),
		.ALUdata2_sel_o		(Data2_Mux.sel)
	);

	//
	// EX/MEM
	//
	
	Latch #(2) EXMEM_MEM_ctrl
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(IDEX_MEM_ctrl.data_o),
		.data_o		()
	);

	Latch #(2) EXMEM_WB_ctrl
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(IDEX_WB_ctrl.data_o),
		.data_o		()
	);
	
	Latch #() EXMEM_DataOut
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(ALU.data_o),
		.data_o		()
	);

	Latch #() EXMEM_Data2
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(Data2_Mux.data_o),
		.data_o		()
	);

	Latch #(5) EXMEM_RegFwd
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(Fwd_Mux.data_o),
		.data_o		()
	);

	
	//
	// MEM
	//
	
	Memory #(.size(32)) DataMem
	(
		.clk		(clk),
		.addr_i		(EXMEM_DataOut.data_o),
		.cs			(EXMEM_MEM_ctrl.data_o[1]),
		.we			(EXMEM_MEM_ctrl.data_o[0]),
		.data_i		(EXMEM_Data2.data_o),
		.data_o		()
	);
	

	//
	// MEM/WB
	//

	Latch #(2) MEMWB_WB_ctrl
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(EXMEM_WB_ctrl.data_o),
		.data_o		()
	);

	Latch MEMWB_MemOut
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(DataMem.data_o),
		.data_o		()
	);

	Latch MEMWB_AddrOut
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(EXMEM_DataOut.data_o),
		.data_o		()
	);

	Latch #(.width(5)) MEMWB_RegFwd
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(EXMEM_RegFwd.data_o),
		.data_o		()
	);

	
	//
	// WB
	//

	Multiplexer2Way WB_Mux
	(
		.data_1		(MEMWB_MemOut.data_o),
		.data_2		(MEMWB_AddrOut.data_o),
		.sel		(MEMWB_WB_ctrl.data_o[1]),
		.data_o		()
	);

endmodule
