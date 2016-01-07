module Latch #(parameter width=32) (
	input					clk,
	input      				rst,
	input      				we,
	input      	[width-1:0]	data_i,
	output reg 	[width-1:0]	data_o
);
	
	initial begin
		data_o = {width{1'b0}};
	end
	
	always @ (posedge clk or negedge rst) begin
  		if(~rst)
   			data_o <= {width{1'b0}};
  		else begin
			if(we)
    			data_o <= data_i;
			else
				data_o <= data_o;
    	end
	end

endmodule
