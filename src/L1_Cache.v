module L1_Cache
#(
	parameter data_width 	= 32
)
(
	input					clk,
	input		[width-1:0]	addr_i,
	input					cs,
	input					we,
	input		[width-1:0]	data_i,
	output	reg	[width-1:0]	data_o,
	output	reg				stall
);

	initial begin
		data_o = { width{1'bz} };
	end

	input	[256-1:0]	ext_mem_data_i,
	input				ext_mem_ack, 	
	output	[256-1:0]	ext_mem_data_o, 
	output	[32-1:0]	ext_mem_addr,
	output				ext_mem_cs, 
	output				ext_mem_we 
	
	L1_Cache_Controller Controller
	(
	);

	SRAM #(.addr_width(5), .data_width(256), .mem_size(32)) tag_mem
	(
		.clk	(),
		.addr_i	(),
		.cs		(),
		.we		(),
		.data_i	(),
		.data_o	()
	);
	
	SRAM #(.addr_width(5), .data_width(24), .mem_size(32)) data_mem
	(
		.clk	(),
		.addr_i	(),
		.cs		(),
		.we		(),
		.data_i	(),
		.data_o	()
	);
	
endmodule
