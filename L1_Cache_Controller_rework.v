module L1_Cache_Controller controller (
	// interface to CPU
	input			cache_cs,
	input			cache_we,
	output reg		cache_ack,

	// interface to internal components
	input			cache_hit,
	output reg		sram_we,
	input			cache_valid,
	input			cache_dirty_i,
	output reg		cache_dirty_o,
	output reg		dram_data_sel,
	output reg		dram_data_sel,
	
	// interface to DRAM
	output reg		dram_addr_sel,
	output reg		dram_cs,
	output reg		dram_we,
	output reg		dram_ack
);

endmodule
