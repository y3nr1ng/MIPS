`include "StateTable.v"

module L1_Cache_Controller (
	input			clk,
	input			rst,
	
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
		state = next_state;
		update_signals(state);

		if(~rst) begin	
			next_state = `STATE_IDLE;
		end
		else begin
			case(state)
				`STATE_IDLE: 
				begin
					if(`DEBUG)
						$display(" -> IDLE", $time);
					
					if(cache_cs && cache_we)
						next_state = `STATE_WRITE;
					else if(cache_cs && !cache_we)
						next_state = `STATE_READ;
					else
						next_state = `STATE_IDLE;
				end

				`STATE_READ:
				begin
					if(`DEBUG)
						$display(" -> READ", $time);
					
					if(cache_hit && cache_valid) begin
						next_state = `STATE_IDLE;
						$display(" ... READ HIT");
					end 
					else if((!cache_hit) && cache_valid && cache_dirty_i)
						next_state = `STATE_WRITEBACK;
					else
						next_state = `STATE_READMISS;					
				end
		
				`STATE_READMISS:
				begin
				end
	
				`STATE_READMEM:
				begin
				end
				
				`STATE_READDATA:
				begin
				end
				
				`STATE_WRITE:
				begin
				end
				
				`STATE_WRITEHIT:
				begin
				end
	
				`STATE_WRITEMISS:
				begin
				end

				`STATE_WRITEMISS:
				begin
				end

				`STATE_WRITEMEM:
				begin
				end

				`STATE_WRITEDATA:
				begin
				end

				`STATE_WRITEBACK:
				begin
				end

				`STATE_WRITEBACKMEM:
				begin
				end
								
			endcase
		end
	end

endmodule
