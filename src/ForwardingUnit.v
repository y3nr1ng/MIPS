module ForwardingUnit(
	input	EXMEM_rw,
	input	MEMWB_rw,
	input	[0:5]	IDEX_Rs,
	input	[0:5]	IDEX_Rt,
	input	[0:5]	EXMEM_Rd,
	input	[0:5]	MEMWB_Rd,
	output	[0:1]	ALUdata1_sel,
	output	[0:1]	ALUdata2_sel
);

assign ALUdata1_sel = 	(EXMEM_rw == 1 && EXMEM_Rd != 0 && EXMEM_Rd == IDEX_Rs)? 10:
						(MEMWB_rw == 1 && MEMWB_Rd != 0 && MEMWB_Rd == IDEX_Rs)? 01:
						00;

assign ALUdata2_sel =	(EXMEM_rw == 1 && EXMEM_Rd != 0 && EXMEM_Rd == IDEX_Rt)? 10:
						(MEMWB_rw == 1 && MEMWB_Rd != 0 && MEMWB_Rd == IDEX_Rt)? 01:
						00;

endmodule