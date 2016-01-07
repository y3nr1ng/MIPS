module Comparer #(parameter width=32) (
	input	[width-1:0]	data_1, data_2,
	output reg 			is_equal, is_greater, is_less
);
	
	always @ (data_1 or data_2) begin	
		is_equal 	<= (data_1 == data_2);
		is_greater 	<= (data_1 > data_2);
		is_less 	<= (data_1 < data_2);
	end

endmodule
