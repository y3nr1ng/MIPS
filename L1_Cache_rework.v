module L1_Cache
#(
	parameter	addr_width = 32,
	parameter	cpu_data_width = 32,
	parameter	mem_data_width = 256
)
(
	input								clk,

	// cpu side
	input		[addr_width-1:0]		cache_addr,
	input								cache_cs,
	input								cache_we,
	output	reg							cache_ack,
	input		[cpu_data_width-1:0]	cache_data_i,
	output	reg	[cpu_data_width-1:0]	cache_data_o
	
	// external memory side
	output	reg	[addr_width-1:0]		dram_addr,
	output	reg							dram_cs,
	output	reg							dram_we,
	input								dram_ack,
	input		[mem_data_width-1:0]	dram_data_i,
	output	reg	[mem_data_width-1:0]	dram_data_o
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

	assign cache_hit = ((addr_tag == sram_tag) && sram_valid) ? 1'b1 : 1'b0;
		
	L1_Cache_Controller controller (
		// interface to CPU
		.cache_cs		(),
		.cache_we		(),
		.cache_ack		(),

		// interface to internal components
		.cache_hit		(cache_hit),
		.sram_we		(),
		.cache_valid	(sram_valid),
		.cache_dirty_i	(sram_dirty),
		.cache_dirty_o	(),
		.dram_sel		(),
		.cpu_sel		(),

		// interface to DRAM
		.dram_cs		(),
		.dram_we		(),
		.dram_ack		()
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
	
	SRAM #(.addr_width(5), .data_width(256), .mem_size(32)) data_storage
	(
		.clk	(clk),
		.addr_i	(addr_index),
		.cs		(1'b1),
		.we		(controller.sram_we),
		.data_i	(cache_data_i),
		.data_o	()
	);

	Multiplexer2Way DRAM_data_mux (
		.data_1	(cache_data_i),
		.data_2	(data_storage.data_o),
		.sel	(controller.dram_sel),
		.data_o	(cache_data_o)
	);
	
	Multiplexer2Way CPU_data_mux (
		.data_1	(data_storage.data_o),	
		.data_2	(dram_data_i),
		.sel	(controller.cpu_sel),
		.data_o	(data_storage.data_o)
	);

endmodule
