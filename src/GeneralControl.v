module GeneralControl (
	input		[5:0]	op_i,
	output				IF_flush_o,
	output				ID_flush_o,
	output				EX_flush_o,

	output		[4:0]	EX_ctrl_o,	// ALUOp(3), ALUSrc(1), RegDst(1)
	output		[1:0]	MEM_ctrl_o,	// MEM_cs(1), MEM_we(1)
	output				WB_ctrl_o	// Reg_we(1)
);

	always @ (*)
	begin
		case (sel)
			2'b00	:	data_o = data_1;
			2'b01	:	data_o = data_2;
			2'b10	:	data_o = data_3;
			2'b11	:	data_o = data_4;
		endcase
	end

endmodule
