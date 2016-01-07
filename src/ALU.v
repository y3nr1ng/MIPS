`include "LookupTable.v"

module ALU 
#(
	parameter data_width = 32
)
(
	input		[2:0]				ALUop_i,
	input		[data_width-1:0]	data_1, data_2,
	output reg 	[data_width-1:0]	data_o,
	output 							is_zero
);

	assign is_zero = (data_o == {data_width{1'b0}});

	always @ (*)
	begin
		case (ALUop_i)
			`ADD_alu	:	data_o = data_1 + data_2;
			`SUB_alu	:	data_o = data_1 - data_2;
			`MUL_alu	:	data_o = data_1 * data_2;
			`AND_alu	:	data_o = data_1 & data_2;
			`OR_alu		:	data_o = data_1 | data_2;
		endcase
	end

endmodule
