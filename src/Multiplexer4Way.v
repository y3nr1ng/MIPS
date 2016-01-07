module Multiplexer4Way #(parameter width=32) (
	input		[width-1:0]	data_1, data_2, data_3, data_4,
	input 		[1:0]		sel,
	output reg 	[width-1:0]	data_o
);
	
	always @ (*)
	begin
		case (sel)
			2'b00	:	data_o <= data_1;
			2'b01	:	data_o <= data_2;
			2'b10	:	data_o <= data_3;
			2'b11	:	data_o <= data_4;
		endcase
	end

endmodule
