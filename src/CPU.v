module CPU
(
	input		clk,
	input		rst,
	input		start
);

	wire	[31:0]	instr_addr, instr;
	
	//
	// IF
	//

	ProgramCounter PC
	(
    	.clk		(),
   		.rst		(),
   		.start      (),
   		.pc_i       (),
   		.pc_o       ()
	);

	Multiplexer2Way PC_Mux
	(
		.data_1		(),
		.data_2		(),
		.sel		(),
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
		.clk		(),
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
		.clk		(),
		.rst		(),
		.en			(),
		.data_i		(),
		.data_o		()
	);

	Latch IFID_Instr
	(
		.clk		(),
		.rst		(),
		.en			(),
		.data_i		(),
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
	
	Memory DataMem
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
