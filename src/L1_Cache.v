module L1_Cache
(
	input				clk,
	input		[31:0]	addr_i,
	input				cs,
	input				we,
	input		[31:0]	data_i,
	output	reg	[31:0]	data_o,
	output	reg			stall
);
	
	wire	[31:0]	mem_addr_bus;
		wire			mem_tag 	= mem_addr_bus[31:10];
		wire			mem_index	= mem_addr_bus[9:5];
		wire			mem_offset 	= mem_addr_bus[4:0];
		
	wire	[23:0]	cache_tag_bus;
		wire			cache_valid = cache_tag_bus[23];
		wire			cache_dirty = cache_tag_bus[22];
		wire	[21:0]	cache_tag 	= cache_tag_bus[21:0];

	initial begin
		data_o = 32'bz;
	end
	
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
