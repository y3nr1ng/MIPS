module Multiplexer #(parameter width=32) (
	input	[width-1:0]	data_0, data_1,
	input 			sel,
	output 	[width-1:0]	out
);

	assign out = sel ? data_1 : data_0;

endmodule