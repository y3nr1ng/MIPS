module Multiplexer2Way #(parameter width=32) (
	input		[width-1:0]	data_1, data_2,
	input 					sel,
	output reg	[width-1:0]	data_o
);
	
	always @ (*)
	begin
		case (sel)
			1'b0	:	data_o <= data_1;
			1'b1	:	data_o <= data_2;
		endcase
	end

endmodule
