module Shifter #(parameter width=32) (
	input	[width-1:0]	x, y,
	output 	 			data_o
);
	
	assign data_o = x << y;

endmodule
