module Latch #(parameter width=32) (
	input					clk,
	input      				rst,
	input      				we,
	input      	[width-1:0]	data_i,
	output reg 	[width-1:0]	data_o
);

	always @ (posedge clk or negedge rst) begin
  		if(~rst)
   			data_o <= {width{1'b0}};
  		else if(we)
    		data_o <= data_i;
    end

endmodule
