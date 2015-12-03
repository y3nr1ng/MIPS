module ALU
(
	input		[2:0]	ALUop_i,
	input		[31:0]	data_1, data_2,
	output reg	[31:0]	data_o,
	output reg			is_zero
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

		is_zero = (data_o == 32'b0);
	end

endmodule
