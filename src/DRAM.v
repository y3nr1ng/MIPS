module DRAM
#(
	parameter addr_width 	= 32,
	parameter data_width	= 32,
	parameter mem_size 		= 1024
)
(
	input							clk,
	input		[addr_width-1:0]	addr_i,
	input							cs,		
	input							we,		
	input 		[data_width-1:0] 	data_i,
	output 		[data_width-1:0]	data_o
);

	reg	[data_width-1:0]	memory	[0:mem_size-1];
	
	integer i;
	initial begin
		for(i = 0; i < mem_size; i = i+1)
			memory[i] = {data_width{1'b0}};
	end

	assign data_o = (cs) ? memory[addr_i >> 2] : {data_width{1'bz}};

	always @ (posedge clk) 
		memory[addr_i >> 2] <= data_i;

endmodule
