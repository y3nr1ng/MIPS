module GeneralControl
(
	input		[5:0]	Op_i,
	output reg		RegDst_o,
	output reg		ALUOp_o,
	output reg		ALUSrc_o,
	output reg		RegWrite_o
);

always @(Op_i)
begin
	// no difference for all the instructions required.
	RegDst_o = ~Op_i[3];

	ALUOp_o = Op_i[3];
	ALUSrc_o = Op_i[3];

	RegWrite_o = 1;
end

endmodule

