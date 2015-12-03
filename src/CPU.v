module CPU
(
	input		clk,
	input		rst,
	input		start
);
	
	parameter	instr_width = 32;

	wire	[width-1:0]	instr_addr, instr;

	LookupTable LUT;
	
	//
	// IF
	//

	wire	to_pc, from_pc;
	
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
		.data_2		({ {(width-3){1'b0}, 3'b100 }),	// PC += 4
		.data_o		()
	);

	Memory #(.size(1024)) InstrMem
	(
		.clk		(),
		.addr_i		(PC.addr_o),
		.cs			(),
		.we			(),
		.data_i		(),
		.data_o		()
	);


	//
	// IF/ID
	//

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
		.data_o		()
	);

	
	//
	// ID
	//

	Registers RegFiles
	(
	);

	SignExtend SignExt
	(
		.data_i		(),
		.data_o		()
	);
	
	// TODO: We should try to merge shifter and adder together into: NextAddr
	Shifter PC_BranchShl
	(
		.x			(SignExt.data_o),
		.y			({ {(width-2){1'b0}}, 2'b10 }),
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
		.data_1		(),
		.data_2		(),
		.is_equal	()
	);

	HazardDetectionUnit HDU
	(
	);

	GeneralControl Ctrl
	(
		.op_i		(),
		.IF_flush_o	(),
		.ID_flush_o	(),
		.EX_flush_o	(),
		.EX_ctrl_o	(),
		.MEM_ctrl_o	(),
		.WB_ctrl_o	()		
	);
	
	Or Ctrl_Flush
	(
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

	Latch IDEX_WB
	(
		.clk		(),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch IDEX_MemWE
	(
		.clk		(),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch IDEX_ALUOp
	(
		.clk		(),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch IDEX_PC_Inc
	(
		.clk		(),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch IDEX_Data1
	(
		.clk		(),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);
	
	Latch IDEX_Data2
	(
		.clk		(),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch IDEX_SignExt
	(
		.clk		(),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch IDEX_RsFwd
	(
		.clk		(),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch IDEX_RtFwd
	(
		.clk		(),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch IDEX_RdFwd
	(
		.clk		(),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);


	//
	// EX
	//
	
	ALU ALU
	(
	);
	
	Multiplexer4Way Data1_Mux
	(
		.data_1		(),
		.data_2		(),
		.data_3		(),
		.data_4		(),
		.sel		(),
		.data_o		()
	);

	Multiplexer4Way Data2_Mux
	(
		.data_1		(),
		.data_2		(),
		.data_3		(),
		.data_4		(),
		.sel		(),
		.data_o		()
	);
	
	// Fuck this, I'm combining two diagrams now.
	Multiplexer2Way Data2imm_Mux
	(
		.data_1		(),
		.data_2		(),
		.data_3		(),
		.data_4		(),
		.sel		(),
		.data_o		()
	);

	Multiplexer2Way Fwd_Mux
	(
		.data_1		(),
		.data_2		(),
		.sel		(),
		.data_o		()
	);
		
	Multiplexer2Way WB_Mux
	(
		.data_1		(),
		.data_2		(),
		.sel		(),
		.data_o		()
	);

	Multiplexer2Way M_Mux
	(
		.data_1		(),
		.data_2		(),
		.sel		(),
		.data_o		()
	);

	ForwardingUnit FwdUnit
	(
	);


	//
	// EX/MEM
	//

	Latch EXMEM_WB
	(
		.clk		(),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);
	
	Latch EXMEM_M
	(
		.clk		(),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch EXMEM_DataOut
	(
		.clk		(),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch EXMEM_Data2
	(
		.clk		(),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch EXMEM_RegFwd
	(
		.clk		(),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	
	//
	// MEM
	//
	
	Memory #(.size(32)) DataMem
	(
		.clk		(),
		.addr_i		(),
		.cs			(),
		.we			(),
		.data_i		(),
		.data_o		()
	);
	

	//
	// MEM/WB
	//

	Latch MEMWB_WB
	(
		.clk		(),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch MEMWB_MemOut
	(
		.clk		(),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch MEMWB_DataOut
	(
		.clk		(),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch MEMWB_RegFwd
	(
		.clk		(),
		.rst		(),
		.en			(),
		.data_i		(),
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
