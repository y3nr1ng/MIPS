module DRAM
#(
	parameter addr_width 	= 32,
	parameter data_width	= 32,
	parameter mem_size 		= 1024
)
(
	input							clk,
	input		[addr_width-1:0]	addr_i,
	input 		[data_width-1:0] 	data_i,
	input							cs,		
	input							we,			
	output reg 	[data_width-1:0]	data_o
);

	reg	[data_width-1:0]	memory	[0:mem_size-1];
	
	integer i;
	initial begin
		for(i = 0; i < mem_size; i = i+1)
			memory[i] = {data_width{1'b0}};
	end

	always @ (posedge clk) begin
		#(1)
		if(cs) 
			data_o <= memory[addr_i >> 2]; 
		else
			data_o <= {data_width{1'bz}};
	end

	always @ (posedge clk) begin
		if(we)
			memory[addr_i >> 2] = data_i;
	end

endmodule
