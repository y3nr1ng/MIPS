module Latch #(parameter width=32) (
	input					clk,
	input      				rst,
	input      				en,
	input      	[width-1:0]	data_i,
	output reg 	[width-1:0]	data_o
);

	always@(posedge clk)
  		if (rst)
   			data_o <= { width{1'b0} };
  		else if (en)
    		data_o <= data_i;

endmodule
