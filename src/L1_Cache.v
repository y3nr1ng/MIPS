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
	reg		[255:0]	ext_data_o;
	assign CPU.ext_mem_data_o = ext_data_o;

	// cache initialized.
	initial begin
		data_o = 32'bz;
	end
	
	// indicates whether cache hit or not?
	assign cache_hit = ((mem_tag == cache_tag) && cache_valid) ? 1'b1 : 1'b0;
	
	// use multiplexer to decide which block to read
	// TODO: fuck this part, need to change it to generate statement
	Multiplexer8Way read_data (
		.data_1	(cache_data_o[255:224]),
		.data_2	(cache_data_o[223:192]),
		.data_3	(cache_data_o[191:160]),
		.data_4	(cache_data_o[159:128]),
		.data_5	(cache_data_o[127:96]),
		.data_6	(cache_data_o[95:64]),
		.data_7	(cache_data_o[63:32]),
		.data_8	(cache_data_o[31:0]),
		.sel	(block_offset),
		.data_o	(data_o)
	);

	// write data to specified cache block
	Multiplexer4Way write_data_b1 (
		.data_1	(data_i),
		.data_2	(ext_data_i[255:224]),
		.data_3	(cache_data_o[255:224]),
		.data_4	(32'bz),
		.sel	(),
		.data_o	(cache_data_i[255:224])
	);
	Multiplexer4Way write_data_b2 (
		.data_1	(data_i),
		.data_2	(ext_data_i[223:192]),
		.data_3	(cache_data_o[223:192]),
		.data_4	(32'bz),
		.sel	(),
		.data_o	(cache_data_i[223:192])
	);
	Multiplexer4Way write_data_b3 (
		.data_1	(data_i),
		.data_2	(ext_data_i[191:160]),
		.data_3	(cache_data_o[191:160]),
		.data_4	(32'bz),
		.sel	(),
		.data_o	(cache_data_i[191:160])
	);
	Multiplexer4Way write_data_b4 (
		.data_1	(data_i),
		.data_2	(ext_data_i[159:128]),
		.data_3	(cache_data_o[159:128]),
		.data_4	(32'bz),
		.sel	(),
		.data_o	(cache_data_i[159:128])
	);
	Multiplexer4Way write_data_b5 (
		.data_1	(data_i),
		.data_2	(ext_data_i[127:96]),
		.data_3	(cache_data_o[127:96]),
		.data_4	(32'bz),
		.sel	(),
		.data_o	(cache_data_i[127:96])
	);
	Multiplexer4Way write_data_b6 (
		.data_1	(data_i),
		.data_2	(ext_data_i[95:64]),
		.data_3	(cache_data_o[95:64]),
		.data_4	(32'bz),
		.sel	(),
		.data_o	(cache_data_i[95:64])
	);
	Multiplexer4Way write_data_b7 (
		.data_1	(data_i),
		.data_2	(ext_data_i[63:32]),
		.data_3	(cache_data_o[63:32]),
		.data_4	(32'bz),
		.sel	(),
		.data_o	(cache_data_i[63:32])
	);
	Multiplexer4Way write_data_b8 (
		.data_1	(data_i),
		.data_2	(ext_data_i[31:0]),
		.data_3	(cache_data_o[31:0]),
		.data_4	(32'bz),
		.sel	(),
		.data_o	(cache_data_i[31:0])
	);

	// write tag
	always @ (controller.sram_we) begin
		assign cache_tag_bus_i = {1'b1, 1'b1, mem_tag};
		assign ext_data_o = cache_data_i;
	end
		
	// module instantiations.
	L1_Cache_Controller controller
	(
		.clk			(clk),
		.rst			(rst),
		.cache_cs		(cs),
		.cache_we		(we),
		.cache_hit		(cache_hit),
		.cache_dirty	(cache_dirty),
		.sram_cs		(),
		.sram_we		(),
		.stall			(stall),
		.mem_cs			(CPU.ext_mem_cs),
		.mem_we 		(CPU.ext_mem_we),
		.mem_wb 		()
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
