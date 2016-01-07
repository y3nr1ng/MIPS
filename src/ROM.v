module ROM
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
	output		[data_width-1:0]	data_o
);

	integer i;

	reg	[data_width-1:0]	memory	[0:mem_size-1];
	
	assign data_o = memory[addr_i >> 2];

endmodule
