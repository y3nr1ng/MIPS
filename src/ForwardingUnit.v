module ForwardingUnit(
	input	EXMEM_rw_i,
	input	MEMWB_rw_i,
	input	[4:0]	IDEX_Rs_i,
	input	[4:0]	IDEX_Rt_i,
	input	[4:0]	EXMEM_Rd_i,
	input	[4:0]	MEMWB_Rd_i,
	output	[1:0]	ALUdata1_sel_o,
	output	[1:0]	ALUdata2_sel_o
);
// for signal:
// 10 indicates an EX-hazard occur
// 01 indicates a MEM-hazard occur
// 00 indicates no hazard occur


assign ALUdata1_sel_o = (EXMEM_rw_i == 1 && EXMEM_Rd_i != 0 && EXMEM_Rd_i == IDEX_Rs_i)? 10:
						(MEMWB_rw_i == 1 && MEMWB_Rd_i != 0 && MEMWB_Rd_i == IDEX_Rs_i)? 01:
						00;

assign ALUdata2_sel_o =	(EXMEM_rw_i == 1 && EXMEM_Rd_i != 0 && EXMEM_Rd_i == IDEX_Rt_i)? 10:
						(MEMWB_rw_i == 1 && MEMWB_Rd_i != 0 && MEMWB_Rd_i == IDEX_Rt_i)? 01:
						00;

endmodule