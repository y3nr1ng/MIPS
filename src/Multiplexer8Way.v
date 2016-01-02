module Multiplexer8Way #(parameter width=32) (
	input		[width-1:0]	data_1, data_2, data_3, data_4,
							data_5, data_6, data_7, data_8,
	input 		[2:0]		sel,
	output reg 	[width-1:0]	data_o
);
	
	always @ (*)
	begin
		case (sel)
			3'b000	:	data_o = data_1;
			3'b001	:	data_o = data_2;
			3'b010	:	data_o = data_3;
			3'b011	:	data_o = data_4;
			3'b100	:	data_o = data_5;
			3'b101	:	data_o = data_6;
			3'b110	:	data_o = data_7;
			3'b111	:	data_o = data_8;
		endcase
	end

endmodule
