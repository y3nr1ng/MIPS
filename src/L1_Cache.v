module L1_Cache
(
	input				clk,
	input				rst,
	input		[31:0]	addr,
	input				cs,
	input				we,
	input		[31:0]	data_i,
	output	reg	[31:0]	data_o,
	output	reg			stall
);
	
	//wire	[31:0]	mem_addr_bus = addr_i;
		wire	[21:0]	mem_tag 	= addr[31:10];
		wire	[4:0]	mem_index	= addr[9:5];
		wire	[4:0]	mem_offset 	= addr[4:0];
	
	wire	[255:0]	cache_data_i;
	wire	[255:0]	cache_data_o;
		wire	[255:
		wire	
		wire
		wire	
		wire
		wire
		wire
		wire	[31:0]	cache_data_o_b7;

	wire	[23:0]	cache_tag_bus_i;
	wire	[23:0]	cache_tag_bus_o;
		wire			cache_valid = cache_tag_bus_o[23];
		wire			cache_dirty = cache_tag_bus_o[22];
		wire	[21:0]	cache_tag 	= cache_tag_bus_o[21:0];
		wire	[4:0]	cache_index = mem_index;
	
	wire	[2:0]	block_offset 	= mem_offset[4:2];
	
	wire			cache_hit;	
	
	wire	[31:0]	ext_addr	= CPU.ext_mem_addr;
	wire	[255:0]	ext_data_i 	= CPU.ext_mem_data_i;
	wire	[255:0]	ext_data_o 	= CPU.ext_mem_data_o;

	// cache initialized.
	initial begin
		data_o = 32'bz;
	end
	
	// indicates whether cache hit or not?
	assign cache_hit = ((mem_tag == cache_tag) && cache_valid) ? 1'b1 : 1'b0;
	
	// use multiplexer to decide which block to read
	Multiplexer8Way new_data (
		.data_1	(cache_data_o[255:224]),
		.data_2	(cache_data_o[223:192]),
		.data_3	(cache_data_o[191:160]),
		.data_4	(cache_data_o[159:128]),
		.data_5	(cache_data_o[127:96])
		.data_6	(cache_data_o[95:64]),
		.data_7	(cache_data_o[63:32]),
		.data_8	(cache_data_o[31:0]),
		.sel	(block_offset),
		.data_o	()
	);
	
	// read data from cache
	always @ (addr_i or cache_data_bus_o) begin
		
	end

	// write data to cache
	always @ (addr_i or data_i) begin

	end

	// module instantiations.
	L1_Cache_Controller controller
	(
		.clk			(clk),
		.rst			(rst),
		.cache_hit		(cache_hit),
		.cache_dirty	(cache_dirty),
		.sram_cs		(),
		.sram_we		()
	);

	SRAM #(.addr_width(5), .data_width(24), .mem_size(32)) tag_mem
	(
		.clk	(clk),
		.addr_i	(cache_index),
		.cs		(controller.sram_cs),
		.we		(controller.sram_we),
		.data_i	(cache_tag_bus_i),
		.data_o	(cache_tag_bus_o)
	);
	
	SRAM #(.addr_width(5), .data_width(256), .mem_size(32)) data_mem
	(
		.clk	(clk),
		.addr_i	(cache_index),
		.cs		(controller.sram_cs),
		.we		(controller.sram_we),
		.data_i	(cache_data_i),
		.data_o	(cache_data_o)
	);
	
endmodule
