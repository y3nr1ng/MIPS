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
	
	//wire	[31:0]	mem_addr_bus = addr_i;
		wire	[21:0]	mem_tag 	= addr_i[31:10];
		wire	[4:0]	mem_index	= addr_i[9:5];
		wire	[4:0]	mem_offset 	= addr_i[4:0];
		
	wire	[23:0]	cache_tag_bus;
		wire			cache_valid = cache_tag_bus[23];
		wire			cache_dirty = cache_tag_bus[22];
		wire	[21:0]	cache_tag 	= cache_tag_bus[21:0];
		wire	[4:0]	cache_index = mem_index;
	wire	[255:0]	cache_data;

	wire			sram_cs;
	wire			sram_we;
	
	wire			cache_hit;

	// cache initialized.
	initial begin
		data_o = 32'bz;
	end
	
	// indicates whether cache hit or not?
	assign cache_hit = ((mem_tag == cache_tag) && cache_valid) ? 1'b1 : 1'b0;

	// read data from cache
	
	// write data to cache
	

	// module instantiations.
	L1_Cache_Controller Controller
	(
	);

	SRAM #(.addr_width(5), .data_width(256), .mem_size(32)) tag_mem
	(
		.clk	(clk),
		.addr_i	(cache_index),
		.cs		(sram_cs),
		.we		(sram_we),
		.data_i	(),
		.data_o	()
	);
	
	SRAM #(.addr_width(5), .data_width(24), .mem_size(32)) data_mem
	(
		.clk	(clk),
		.addr_i	(cache_index),
		.cs		(sram_cs),
		.we		(sram_we),
		.data_i	(),
		.data_o	()
	);
	
endmodule
