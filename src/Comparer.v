module Comparer #(parameter width=32) (
	input	[width-1:0]	data_1, data_2,
	output 				is_equal, is_greater, is_less
);
	
	// == should be used here instead of ===,
	// since Hi-Z and float should yield ambiguous result.
	assign is_equal = (data_1 == data_2);
	assign is_greater = (data_1 > data_2);
	assign is_less = (data_1 < data_2);

endmodule
