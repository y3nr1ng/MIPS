`include "StateTable.v"

module L1_Cache_Controller (
	input			clk,
	input			rst,
	
	// Interface to CPU-side components.
	input			cache_cs,
	input			cache_we,
	output			cache_ack,

	// Interface to the internal components.
	input			cache_hit,
	output reg		sram_we,
	input			cache_valid,
	input			cache_dirty_i,
	output reg		cache_dirty_o,
	output reg		sram_data_sel,
	
	// Interface to the DRAM (external memory).
	output reg		dram_cs,
	output reg		dram_we,
	input 			dram_ack
);
	
	// Internal registers for state recording.
	reg	[3:0]	state;	
	reg	[3:0]	next_state;

	reg			cache_ack_en;	// Enable CPU-side ACK response.
	reg			r_cache_ack;	// Internal ACK signal driver.
	
	reg			r_cache_cs;
	reg			r_cache_we;

	initial begin	
		state		= `STATE_IDLE;
		next_state 	= `STATE_IDLE;
	end

	// Control when the ACK signal is emitted.
	assign cache_ack = (cache_ack_en && cache_hit && cache_valid && cache_we) || r_cache_ack;

	// Finite state machine of the L1 cache controller.
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
					
					r_cache_cs = cache_cs;
					r_cache_we = cache_we;
	
					if(r_cache_cs || r_cache_we)
						next_state = `STATE_COMPARE;
					else
						next_state = `STATE_IDLE;
				end

				`STATE_COMPARE:
				begin
					if(`DEBUG)
						$display(" -> COMPARE ", $time);
					if(cache_hit && cache_valid) begin
						if(r_cache_we)
							next_state = `STATE_WRITE_HIT;	
						else begin
							next_state = `STATE_IDLE;
							
							if(`DEBUG)
								$display(" ... READ HIT");
						end
					end
					else begin
						if(cache_valid && cache_dirty_i)
							next_state = `STATE_WRITE_BACK;
						else if(r_cache_we)
							next_state = `STATE_WRITE_MISS;
						else
							next_state = `STATE_READ_MISS;
					end
				end
		
				`STATE_READ_MISS:
				begin
					if(`DEBUG)
						$display(" ... READ MISS", $time);

					if(dram_ack)
						next_state = `STATE_READ_DATA;
					else
						next_state = `STATE_READ_MISS;
				end
				
				`STATE_READ_DATA:
				begin
					if(`DEBUG)
						$display(" -> READ DATA", $time);
				
					next_state = `STATE_IDLE;
				end
				
				`STATE_WRITE_HIT:
				begin
					if(`DEBUG)
						$display(" ... WRITE HIT", $time);
					
						next_state = `STATE_IDLE;
				end
	
				`STATE_WRITE_MISS:
				begin
					if(`DEBUG)
						$display(" ... WRITE MISS", $time);
					
					if(dram_ack)
						next_state = `STATE_WRITE_DATA;
					else
						next_state = `STATE_WRITE_MISS;
				end

				`STATE_WRITE_DATA:
				begin
					if(`DEBUG)
						$display(" -> WRITE DATA", $time);

					next_state = `STATE_WRITE_HIT;
				end

				`STATE_WRITE_BACK:
				begin
					if(`DEBUG)
						$display(" -> WRITE BACK", $time);

					if(dram_ack)
						next_state = `STATE_COMPARE;
					else
						next_state = `STATE_WRITE_BACK;
				end
								
			endcase
		end
	end

	task UpdateSignals (
		input	[3:0]	state
	);

		case(state)
			`STATE_IDLE:      		ApplySignals({2'b11, 3'b000, 2'b00});
	      	`STATE_COMPARE:      	ApplySignals({2'b00, 3'b000, 2'b00});
	     	`STATE_READ_MISS:  		ApplySignals({2'b00, 3'b000, 2'b10}); 
	     	`STATE_READ_DATA:  		ApplySignals({2'b00, 3'b101, 2'b00});
	     	`STATE_WRITE_HIT:  		ApplySignals({2'b00, 3'b110, 2'b00});
	     	`STATE_WRITE_MISS: 		ApplySignals({2'b00, 3'b000, 2'b10});
	     	`STATE_WRITE_DATA: 		ApplySignals({2'b00, 3'b101, 2'b00});
	     	`STATE_WRITE_BACK:		ApplySignals({2'b00, 3'b000, 2'b11}); 
		endcase

	endtask

	task ApplySignals (
		input	[6:0]	sig_vector
	);

		begin
			// Control the CPU-side cache interface.
			cache_ack_en	= sig_vector[6];
			r_cache_ack		= sig_vector[5];
	
			// Control the internal SRAM of L1 cache.
			sram_we			= sig_vector[4];
			cache_dirty_o	= sig_vector[3];
			sram_data_sel	= sig_vector[2];
	
			// Control the DRAM-side cache interface.
			dram_cs			= sig_vector[1];
			dram_we			= sig_vector[0];
		end
	endtask

endmodule
