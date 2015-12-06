module ForwardingUnit (
	input			EXMEM_we,
	input			MEMWB_we,
	input	[4:0]	IDEX_Rs,
	input	[4:0]	IDEX_Rt,
	input	[4:0]	EXMEM_Rd,
	input	[4:0]	MEMWB_Rd,
	output	[1:0]	ALU_data1_sel,
	output	[1:0]	ALU_data2_sel
);

	/**
	 * 00 -> no hazard
	 * 10 -> EX-hazard
	 * 01 -> MEM-hazard
	 */

	if (EXMEM_we && (EXMEM_Rd != 0) && (EXMEM_Rd == IDEX_Rs))
		assign ALU_data_1 = 2'b10;
	else if (MEMWB_we && (MEMWB_Rd != 0) && !((EXMEM_we && (EXMEM_Rd != 0)) && (EXMEM_Rd == IDEX_Rs)) && (MEMWB_Rd == IDEX_Rs))
		assign ALU_data_1 = 2'b01;
	else
		assign ALU_data_1 = 2'b00;

	if (EXMEM_we && (EXMEM_Rd != 0) && (EXMEM_Rd == IDEX_Rt))
		assign ALU_data_2 = 2'b10;
	else if (MEMWB_we && (MEMWB_Rd != 0) && !((EXMEM_we && (EXMEM_Rd != 0)) && (EXMEM_Rd == IDEX_Rt)) && (MEMWB_Rd == IDEX_Rt))
		assign ALU_data_2 = 2'b01;
	else
		assign ALU_data_2 = 2'b00;

endmodule
