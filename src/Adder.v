module Adder #(parameter width=32) (
	input	[width-1:0]	data_1, data_2,
	output 	[width-1:0]	data_o
);
	
	assign data_o = data_1 + data_2;

endmodule
