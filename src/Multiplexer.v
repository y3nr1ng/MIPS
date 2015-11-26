module Multiplexer #(parameter width=32) (
	input	[width-1:0]	data_1, data_2,
	input 				select_i,
	output 	[width-1:0]	data_o
);

	assign data_o = select_i ? data_2 : data_1;

endmodule
