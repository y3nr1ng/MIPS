module ALU
(
	input		[2:0]	ALUop_i,
	input				data_1, data_2,
	output reg			data_o
);

	always @ (*)
	begin
		case (ALUop_i)
			LUT.ADD_alu	:	data_o = data_1 + data_2;
			LUT.SUB_alu	:	data_o = data_1 - data_2;
			LUT.MUL_alu	:	data_o = data_1 * data_2;
			LUT.AND_alu	:	data_o = data_1 & data_2;
			LUT.OR_alu	:	data_o = data_1 | data_2;
		endcase
	end

endmodule
