module Comparer #(parameter width=32) (
	input	[width-1:0]	data_1, data_2,
	output 	 			is_equal
);
	
	// Use == instead of ===, since x and z should yield an ambiguous result.
	// This behaviour comply with IEEE 1800-2009.
	assign is_equal = data_1 == data_2;

endmodule
