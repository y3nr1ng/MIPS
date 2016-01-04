module L1_Cache
#(
	parameter	addr_width = 32,
	parameter	cpu_data_width = 32,
	parameter	mem_data_width = 256
)
(
	input								clk,
	input								rst,

	// cpu side
	input		[addr_width-1:0]		cache_addr,
	input								cache_cs,
	input								cache_we,
	output								cache_ack,
	input		[cpu_data_width-1:0]	cache_data_i,
	output		[cpu_data_width-1:0]	cache_data_o,
	
	// external memory side
	output		[addr_width-1:0]		dram_addr,
	output								dram_cs,
	output								dram_we,
	input								dram_ack,
	input		[mem_data_width-1:0]	dram_data_o,
	output		[mem_data_width-1:0]	dram_data_i
);
	
	// address from CPU
		wire	[21:0]	addr_tag;
		wire	[4:0]	addr_index;
		wire	[4:0]	addr_offset;
			wire	[2:0]	block_offset = addr_offset[4:2];
	
	// data from SRAM
		wire 			sram_valid;
		wire			sram_dirty;
		wire	[21:0]	sram_tag;
	
	// tag SRAM related values
	wire		cache_hit;

	// assign the internal bus, todo: parametrized
	assign addr_tag 	= cache_addr[31:10];
	assign addr_index 	= cache_addr[9:5];
	assign addr_offset 	= cache_addr[4:0];

	assign sram_valid	= tag_storage.data_o[23];
	assign sram_dirty	= tag_storage.data_o[22];
	assign sram_tag		= tag_storage.data_o[21:0];

	assign cache_hit	= ((addr_tag == sram_tag) && sram_valid) ? 1'b1 : 1'b0;
	
	assign dram_addr 	= {sram_tag, addr_index, 5'b0};
	assign dram_data_i 	= data_storage.data_o;

	L1_Cache_Controller controller (
		.clk			(clk),
		.rst			(rst),
	
		// interface to CPU
		.cache_cs		(cache_cs),
		.cache_we		(cache_we),
		.cache_ack		(cache_ack),

		// interface to internal components
		.cache_hit		(cache_hit),
		.sram_we		(),
		.cache_valid	(sram_valid),
		.cache_dirty_i	(sram_dirty),
		.cache_dirty_o	(),
		.sram_data_sel	(),

		// interface to DRAM
		.dram_cs		(dram_cs),
		.dram_we		(dram_we),
		.dram_ack		(dram_ack)
	);
	
	SRAM #(.addr_width(5), .data_width(24), .mem_size(32)) tag_storage
	(
		.clk	(clk),
		.addr_i	(addr_index),
		.cs		(1'b1),
		.we		(controller.sram_we),
		.data_i	({1'b1, controller.cache_dirty_o, addr_tag}),
		.data_o	()
	);
	
	Decoder_3to8 decoder (
		.sel 	(block_offset),
		.out	()
	);
	
	Multiplexer4Way write_data_b1 (
		.data_1	(data_storage.data_o[255:224]),
		.data_2	(data_storage.data_o[255:224]),
		.data_3	(cache_data_i),
		.data_4	(dram_data_o[255:224]),
		.sel	({decoder.out[0], sram_data_sel}),
		.data_o	(data_storage.data_i[255:224])
	);
	Multiplexer4Way write_data_b2 (
		.data_1	(data_storage.data_o[223:192]),
		.data_2	(data_storage.data_o[223:192]),
		.data_3	(cache_data_i),
		.data_4	(dram_data_o[223:192]),
		.sel	({decoder.out[1], sram_data_sel}),
		.data_o	(data_storage.data_i[223:192])
	);
	Multiplexer4Way write_data_b3 (
		.data_1	(data_storage.data_o[191:160]),
		.data_2	(data_storage.data_o[191:160]),
		.data_3	(cache_data_i),
		.data_4	(dram_data_o[191:160]),
		.sel	({decoder.out[2], sram_data_sel}),
		.data_o	(data_storage.data_i[191:160])
	);
	Multiplexer4Way write_data_b4 (
		.data_1	(data_storage.data_o[159:128]),
		.data_2	(data_storage.data_o[159:128]),
		.data_3	(cache_data_i),
		.data_4	(dram_data_o[159:128]),
		.sel	({decoder.out[3], sram_data_sel}),
		.data_o	(data_storage.data_i[159:128])
	);
	Multiplexer4Way write_data_b5 (
		.data_1	(data_storage.data_o[127:96]),
		.data_2	(data_storage.data_o[127:96]),
		.data_3	(cache_data_i),
		.data_4	(dram_data_o[127:96]),
		.sel	({decoder.out[4], sram_data_sel}),
		.data_o	(data_storage.data_i[127:96])
	);
	Multiplexer4Way write_data_b6 (
		.data_1	(data_storage.data_o[95:64]),
		.data_2	(data_storage.data_o[95:64]),
		.data_3	(cache_data_i),
		.data_4	(dram_data_o[95:64]),
		.sel	({decoder.out[5], sram_data_sel}),
		.data_o	(data_storage.data_i[95:64])
	);
	Multiplexer4Way write_data_b7 (
		.data_1	(data_storage.data_o[63:32]),
		.data_2	(data_storage.data_o[63:32]),
		.data_3	(cache_data_i),
		.data_4	(dram_data_o[63:32]),
		.sel	({decoder.out[6], sram_data_sel}),
		.data_o	(data_storage.data_i[63:32])
	);
	Multiplexer4Way write_data_b8 (
		.data_1	(data_storage.data_o[31:0]),
		.data_2	(data_storage.data_o[31:0]),
		.data_3	(cache_data_i),
		.data_4	(dram_data_o[31:0]),
		.sel	({decoder.out[7], sram_data_sel}),
		.data_o	(data_storage.data_i[31:0])
	);
	
	SRAM #(.addr_width(5), .data_width(256), .mem_size(32)) data_storage
	(
		.clk	(clk),
		.addr_i	(addr_index),
		.cs		(1'b1),
		.we		(controller.sram_we),
		.data_i	(),
		.data_o	()
	);

	Multiplexer8Way read_data (
		.data_1	(data_storage.data_o[255:224]),
		.data_2	(data_storage.data_o[223:192]),
		.data_3	(data_storage.data_o[191:160]),
		.data_4	(data_storage.data_o[159:128]),
		.data_5	(data_storage.data_o[127:96]),
		.data_6	(data_storage.data_o[95:64]),
		.data_7	(data_storage.data_o[63:32]),
		.data_8	(data_storage.data_o[31:0]),
		.sel	(block_offset),
		.data_o	(cache_data_o)
	);

endmodule
