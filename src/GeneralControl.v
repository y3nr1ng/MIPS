module GeneralControl (
	input			[5:0]	op_i,
	output reg		[4:0]	EX_ctrl_o,	// ALUop(3), ALUsrc(1), RegDst(1)
	output reg		[1:0]	MEM_ctrl_o,	// MEM_cs(1), MEM_we(1)
	output reg				WB_ctrl_o	// Reg_we(1)
);
	
	/**
	 * EX_ctrl_o = { ALUop(3), ALUsrc(1), RegDst(1) }
	 * ALUsrc -> 0:register, 1:immediate
	 * RegDst -> 0:rt, 1:rd
	 */

	/**
	 * MEM_ctrl_o = { MEM_cs(1), MEM_we(1) }
	 */

	/**
	 * Reg_we -> 0:memory, 1:ALU
	 */

	always @ (*)
	begin
		case (op_i)
			LUT.ADD_op	:
			begin
				EX_ctrl_o	= { LUT.ADD_alu, 1'b0, 1'b1 };
				MEM_ctrl_o	= { 1'b0, 1'b0 };
				WB_ctrl_o	= 1'b1;
			end

			LUT.SUB_op	:
			begin
				EX_ctrl_o	= { LUT.SUB_alu, 1'b0, 1'b1 };
				MEM_ctrl_o	= { 1'b0, 1'b0 };
				WB_ctrl_o	= 1'b1;
			end

			LUT.MUL_op	:	
			begin
				EX_ctrl_o	= { LUT.MUL_alu, 1'b0, 1'b1 };
				MEM_ctrl_o	= { 1'b0, 1'b0 };
				WB_ctrl_o	= 1'b1;
			end

			LUT.AND_op	:	
			begin
				EX_ctrl_o	= { LUT.AND_alu, 1'b0, 1'b1 };
				MEM_ctrl_o	= { 1'b0, 1'b0 };
				WB_ctrl_o	= 1'b1;
			end

			LUT.OR_op	:
			begin
				EX_ctrl_o	= { LUT.OR_alu, 1'b0, 1'b1 };
				MEM_ctrl_o	= { 1'b0, 1'b0 };
				WB_ctrl_o	= 1'b1;
			end

			LUT.ADDI_op	:
			begin
				EX_ctrl_o	= { LUT.ADD_alu, 1'b1, 1'b1 };
				MEM_ctrl_o	= { 1'b0, 1'b0 };
				WB_ctrl_o	= 1'b1;
			end

			LUT.LW_op	:
			begin
			end

			LUT.SW_op	:
			begin
			end

			LUT.J_op	:
			begin
			end

			LUT.BEQ_op	:
			begin
			end
		endcase
	end

endmodule
