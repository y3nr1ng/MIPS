`include "StateTable.v"

module L1_Cache_Controller (
	input			clk,
	
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
	output reg		cpu_data_sel,
	
	// interface to DRAM
	output reg		dram_addr_sel,
	output reg		dram_cs,
	output reg		dram_we,
	output reg		dram_ack
);

	reg	[3:0]	state;	
	reg	[3:0]	next_state;

	initial begin	
		state		= `STATE_IDLE;
		next_state 	= `STATE_IDLE;
	end

	always @ (posedge clk) begin
	end

endmodule
