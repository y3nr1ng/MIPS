module GeneralControl (
	input		[5:0]	op_i,
	output		[4:0]	EX_ctrl_o,	// ALUOp(3), ALUSrc(1), RegDst(1)
	output		[1:0]	MEM_ctrl_o,	// MEM_cs(1), MEM_we(1)
	output				WB_ctrl_o	// Reg_we(1)
);

	always @ (*)
	begin
		case (op_i)
			LUT.ADD_op	:
			begin
			end
			LUT.SUB_op	:
			begin
			end
			LUT.MUL_op	:	
			begin
			end
			LUT.AND_op	:	
			begin
			end
			LUT.OR_op	:
			begin
			end
			LUT.ADDI_op	:
			begin
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
