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
   		.addr_i     (PC_Mux.data_o),
   		.addr_o     ()
	);

	Multiplexer2Way PC_Mux
	(
		.data_1		(PC_Inc.data_o),
		.data_2		(PC_BranchAdd.data_o),
		.sel		(),
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
		.data_i		(),
		.data_o		()
	);


	//
	// IF/ID
	//
	
	wire	[31:0]	instr;

	Latch IFID_PC_Inc
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(PC_Inc.data_o),
		.data_o		()
	);

	Latch IFID_Instr
	(
		.clk		(clk),
		.rst		(),
		.en			(),
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

	Registers RegFiles
	(
		.clk		(clk),
		.Rs_addr	(instr_rs),
		//.Rs_data	(),
		.Rt_addr	(instr_rt),
		//.Rt_data	(),
		.we			(),
		.Rd_addr	(),
		.Rd_data	(WB_Mux.data_o)
	);

	SignExtend SignExt
	(
		.data_i		(instr_imm),
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
		.is_equal	()
	);

	HazardDetectionUnit HDU
	(
	);

	GeneralControl Ctrl
	(
		.op_i		(instr_op),
		.IF_flush_o	(),
		.ID_flush_o	(),
		.EX_flush_o	(),
		.EX_ctrl_o	(),
		.MEM_ctrl_o	(),
		.WB_ctrl_o	()		
	);

	Multiplexer2Way Ctrl_Mux
	(
		.data_1		(),
		.data_2		(),
		.sel		(),
		.data_o		()
	);


	//
	// ID/EX
	//

	Latch IDEX_WB_Ctrl
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch IDEX_MEM_Ctrl
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch IDEX_EX_Ctrl
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(),
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
		.data_i		(),
		.data_o		()
	);
	
	Latch IDEX_Data2
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch IDEX_SignExt
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch IDEX_RsFwd
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(instr_rs),
		.data_o		()
	);

	Latch IDEX_RtFwd
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(instr_rt),
		.data_o		()
	);

	Latch IDEX_RdFwd
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
		.ALUop_i	(),
		.data_1		(Data1_Mux.data_o),
		.data_2		(Data2imm_Mux.data_o),
		.data_o		(),
		.is_zero	()
	);
	
	Multiplexer4Way Data1_Mux
	(
		.data_1		(IDEX_Data1.data_o),
		.data_2		(),
		.data_3		(EXMEM_DataOut.data_o),
		.data_4		(32'bz),
		.sel		(),
		.data_o		()
	);

	Multiplexer4Way Data2_Mux
	(
		.data_1		(IDEX_Data2.data_o),
		.data_2		(),
		.data_3		(EXMEM_DataOut.data_o),
		.data_4		(32'bz),
		.sel		(),
		.data_o		()
	);
	
	// Fuck this, I'm combining two diagrams now.
	Multiplexer2Way Data2imm_Mux
	(
		.data_1		(Data2_Mux.data_o),
		.data_2		(IDEX_SignExt.data_o),
		.sel		(),
		.data_o		()
	);

	Multiplexer2Way Fwd_Mux
	(
		.data_1		(IDEX_RtFwd.data_o),
		.data_2		(IDEX_RdFwd.data_o),
		.sel		(),
		.data_o		()
	);

	ForwardingUnit FwdUnit
	(
	);


	//
	// EX/MEM
	//

	Latch EXMEM_WB_Ctrl
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(IDEX_WB_Ctrl.data_o),
		.data_o		()
	);
	
	Latch EXMEM_MEM_Ctrl
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(IDEX_MEM_Ctrl.data_o),
		.data_o		()
	);

	Latch EXMEM_DataOut
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(ALU.data_o),
		.data_o		()
	);

	Latch EXMEM_Data2
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(Data2_Mux.data_o),
		.data_o		()
	);

	Latch EXMEM_RegFwd
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
		.cs			(),
		.we			(),
		.data_i		(EXMEM_Data2.data_o),
		.data_o		()
	);
	

	//
	// MEM/WB
	//

	Latch MEMWB_WB_Ctrl
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch MEMWB_MemOut
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch MEMWB_DataOut
	(
		.clk		(clk),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch MEMWB_RegFwd
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
		.data_1		(),
		.data_2		(),
		.sel		(),
		.data_o		()
	);

endmodule
