module CPU
(
	input		clk_i,
	input		rst_i,
	input		start_i
);

	wire	[31:0]	instr_addr, instr;
	
	//
	// IF
	//

	ProgramCounter PC
	(
    	.clk_i      (),
   		.rst_i      (),
   		.start_i    (),
   		.pc_i       (),
   		.pc_o       ()
	);

	Multiplexer2Way PC_Mux
	(
		.data_1		(),
		.data_2		(),
		.sel_i		(),
		.data_o		()
	);	

	Adder PC_Inc
	(
		.data_1		(),
		.data_2		(),
		.data_o		()
	);

	Memory InstrMem
	(
		.clk_i		(),
		.addr_i		(),
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
	);

	Latch IFID_Instr
	(
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
	);

	Adder PC_BranchAdd
	(	
		.data_1		(),
		.data_2		(),
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
	);
	
	Or Ctrl_Flush
	(
	);

	Multiplexer2Way Ctrl_Mux
	(
		.data_1		(),
		.data_2		(),
		.sel_i		(),
		.data_o		()
	);


	//
	// ID/EX
	//

	Latch IDEX_WB
	(
	);

	Latch IDEX_MemWE
	(
	);

	Latch IDEX_ALUOp
	(
	);

	Latch IDEX_PC_Inc
	(
	);

	Latch IDEX_Data1
	(
	);
	
	Latch IDEX_Data2
	(
	);

	Latch IDEX_SignExt
	(
	);

	Latch IDEX_RsFwd
	(
	);

	Latch IDEX_RtFwd
	(
	);

	Latch IDEX_RdFwd
	(
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
		.sel_i		(),
		.data_o		()
	);

	Multiplexer4Way Data2_Mux
	(
		.data_1		(),
		.data_2		(),
		.data_3		(),
		.data_4		(),
		.sel_i		(),
		.data_o		()
	);

	Multiplexer2Way Fwd_Mux
	(
		.data_1		(),
		.data_2		(),
		.sel_i		(),
		.data_o		()
	);
		
	Multiplexer2Way WB_Mux
	(
		.data_1		(),
		.data_2		(),
		.sel_i		(),
		.data_o		()
	);

	Multiplexer2Way M_Mux
	(
		.data_1		(),
		.data_2		(),
		.sel_i		(),
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
	);
	
	Latch EXMEM_M
	(
	);

	Latch EXMEM_DataOut
	(
	);

	Latch EXMEM_Data2
	(
	);

	Latch EXMEM_RegFwd
	(
	);

	
	//
	// MEM
	//
	
	Memory DataMem
	(
		.clk_i		(),
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
	);

	Latch MEMWB_MemOut
	(
	);

	Latch MEMWB_DataOut
	(
	);

	Latch MEMWB_RegFwd
	(
	);

	
	//
	// WB
	//

	Multiplexer2Way WB_Mux
	(
		.data_1		(),
		.data_2		(),
		.sel_i		(),
		.data_o		()
	);

endmodule
