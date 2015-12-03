module GeneralControl
(
	input		[5:0]	op_i,
	output				IF_flush_o,
	output				ID_flush_o,
	output				EX_flush_o,

	output		[4:0]	EX_ctrl_o,	// ALUOp(3), ALUSrc(1), RegDst(1)
	output		[1:0]	MEM_ctrl_o,	// MEM_cs(1), MEM_we(1)
	output				WB_ctrl_o,	// Reg_we(1)
);

endmodule
