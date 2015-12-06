module ForwardingUnit (
	input			EXMEM_we_i,
	input			MEMWB_we_i,
	input	[4:0]	IDEX_Rs_i,
	input	[4:0]	IDEX_Rt_i,
	input	[4:0]	EXMEM_Rd_i,
	input	[4:0]	MEMWB_Rd_i,
	output	[1:0]	ALU_data1_sel,
	output	[1:0]	ALU_data2_sel
);

	/**
	 * 00 -> no hazard
	 * 10 -> EX-hazard
	 * 01 -> MEM-hazard
	 */

	assign ALU_data1_sel = (EXMEM_we_i == 1 && EXMEM_Rd_i != 0 && EXMEM_Rd_i == IDEX_Rs_i) ? 2'b10 :
					   	   (MEMWB_we_i == 1 && MEMWB_Rd_i != 0 && MEMWB_Rd_i == IDEX_Rs_i) ? 2'b01 :
																						     2'b00;

	assign ALU_data2_sel = (EXMEM_we_i == 1 && EXMEM_Rd_i != 0 && EXMEM_Rd_i == IDEX_Rt_i) ? 2'b10 :
					       (MEMWB_we_i == 1 && MEMWB_Rd_i != 0 && MEMWB_Rd_i == IDEX_Rt_i) ? 2'b01 :
																						     2'b00;

endmodule
