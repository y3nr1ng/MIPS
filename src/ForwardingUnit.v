module ForwardingUnit (
	input				EXMEM_WB_Reg_we,
	input				MEMWB_WB_Reg_we,
	input		[4:0]	IDEX_Rs,
	input		[4:0]	IDEX_Rt,
	input		[4:0]	EXMEM_Rd,
	input		[4:0]	MEMWB_Rd,
	output reg	[1:0]	ALU_data_1_sel,
	output reg	[1:0]	ALU_data_2_sel
);

	/**
	 * 00 -> no hazard
	 * 10 -> EX-hazard
	 * 01 -> MEM-hazard
	 */
	
	always @ (*)
	begin
		if (EXMEM_WB_Reg_we && (EXMEM_Rd != 0) && (EXMEM_Rd == IDEX_Rs))
			ALU_data_1_sel <= 2'b10;
		else if (MEMWB_WB_Reg_we && (MEMWB_Rd != 0) && !((EXMEM_WB_Reg_we && (EXMEM_Rd != 0)) && (EXMEM_Rd == IDEX_Rs)) && (MEMWB_Rd == IDEX_Rs))
			ALU_data_1_sel <= 2'b01;
		else
			ALU_data_1_sel <= 2'b00;

		if (EXMEM_WB_Reg_we && (EXMEM_Rd != 0) && (EXMEM_Rd == IDEX_Rt))
			ALU_data_2_sel <= 2'b10;
		else if (MEMWB_WB_Reg_we && (MEMWB_Rd != 0) && !((EXMEM_WB_Reg_we && (EXMEM_Rd != 0)) && (EXMEM_Rd == IDEX_Rt)) && (MEMWB_Rd == IDEX_Rt))
			ALU_data_2_sel <= 2'b01;
		else
			ALU_data_2_sel <= 2'b00;
	end

endmodule
