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

	Multiplexer PC_Mux
	(
	);

	Adder PC_Inc
	(
	);

	Memory InstrMem
	(
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
	);
	
	// TODO: We should try to merge shifter and adder together into: NextAddr
	Shifter PC_BranchShl
	(
	);

	Adder PC_BranchAdd
	(
	);

	Comparer Rs_eq_Rt
	(
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

	Multiplexer Ctrl_Mux
	(
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
	
	Multiplexer Data1_Mux
	(
	);

	Multiplexer Data2_Mux
	(
	);

	Multiplexer Fwd_Mux
	(
	);
		
	Multiplexer WB_Mux
	(
	);

	Multiplexer M_Mux
	(
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

	Multiplexer WB_Mux
	(
	);

endmodule
