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
		UpdateSignals(state);

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
						if(`DEBUG)
							$display(" ... READ HIT");
					end 
					else if((!cache_hit) && cache_valid && cache_dirty_i)
						next_state = `STATE_WRITEBACK;
					else
						next_state = `STATE_READMISS;					
				end
		
				`STATE_READMISS:
				begin
					if(`DEBUG)
						$display(" ... READ MISS", $time);
					
					// SCREW THIS STATE
					
				end
	
				`STATE_READMEM:
				begin
					if(`DEBUG)
						$display(" -> READ MEM", $time);
				end
				
				`STATE_READDATA:
				begin
					if(`DEBUG)
						$display(" -> READ DATA", $time);
				
					next_state = `STATE_IDLE;
				end
				
				`STATE_WRITE:
				begin
					if(`DEBUG)
						$display(" -> WRITE", $time);
					
					if(cache_hit && cache_valid)
						next_state = `STATE_WRITEHIT;
					else	
						next_state = `STATE_WRITEMISS;
				end
				
				`STATE_WRITEHIT:
				begin
					if(`DEBUG)
						$display(" ... WRITE HIT", $time);
				end
	
				`STATE_WRITEMISS:
				begin
					if(`DEBUG)
						$display(" ... WRITE MISS", $time);
				end

				`STATE_WRITEMEM:
				begin
					if(`DEBUG)
						$display(" -> WRITE MEM", $time);

				end

				`STATE_WRITEDATA:
				begin
					if(`DEBUG)
						$display(" -> WRITE DATA", $time);
				end

				`STATE_WRITEBACK:
				begin
					if(`DEBUG)
						$display(" -> WRITE BACK", $time);
				end

				`STATE_WRITEBACKMEM:
				begin
					if(`DEBUG)
						$display(" -> WRITE BACK MEM", $time);
				end
								
			endcase
		end
	end

task UpdateSignals (
	input	[3:0]	state
);

	case(state)
		`STATE_IDLE:      		ApplySignals();
      	`STATE_READ:      		ApplySignals();
     	`STATE_READMISS:  		ApplySignals();
     	`STATE_READMEM:   		ApplySignals();
     	`STATE_READDATA:  		ApplySignals();
     	`STATE_WRITE:     		ApplySignals();
     	`STATE_WRITEHIT:  		ApplySignals();
     	`STATE_WRITEMISS: 		ApplySignals();
     	`STATE_WRITEMEM:  		ApplySignals();
     	`STATE_WRITEDATA: 		ApplySignals();
     	`STATE_WRITEBACK:		ApplySignals();
     	`STATE_WRITEBACKMEM: 	ApplySignals();
	endcase

endtask

task ApplySignals (
	intput	[]	sig_vector
);

	begin
	end

endmodule
