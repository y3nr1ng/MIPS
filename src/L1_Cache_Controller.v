module L1_Cache_Controller
(
// input from CPU control unit
	require,
	p_mem_we,
// external memory input	
	ext_mem_cs,
	ext_mem_we,
	ext_mem_ack,
// external memory control signal
	mem_cs, 
	mem_we,
// sram input
	sram_valid,
	sram_dirty,
// sram control signal
	sram_cs,
	sram_we,
// Tag comparator
	hit
);

// input from CPU control unit
	input			require; // require signal to cache
	input			p_mem_we;

// external memory input	
	input			ext_mem_cs;
	input			ext_mem_we;
	input			ext_mem_ack;

// external memory control signal
	output			mem_cs; 
	output			mem_we;

// sram input
	input			sram_valid;
	input			sram_dirty;

// sram control signal
	output 			sram_cs;
	output			sram_we;

// Tag comparator
	input 			hit;
	input			write_hit;

// controller reg
	reg				mem_enable;
	reg				mem_write;
	reg				cache_we;	
	reg				write_back;

// external memory signal assignment
//
		assign	mem_cs	= mem_enable;
		assign	mem_we	= mem_write;
//
//	sram control signal assignment
//
		assign	sram_cs = require;
	wire 		write_hit = hit & p_mem_we;
		assign	sram_we = cache_we | write_hit;


	parameter STATE_IDLE 		= 2'd0,
			  STATE_COMPARE_TAG	= 2'd1,
			  STATE_ALLOCATE	= 2'd2,
			  STATE_WRITE_BACK	= 2'd3;

	reg		[1:0]	state;


	always @ (posedge clk or negedge rst) begin
		if(~rst) 
		begin
			state <= STATE_IDLE;
			mem_enable <= 1'b0;
			mem_write <= 1'b0;
			cache_we   <= 1'b0; 
			write_back <= 1'b0;
		end

		else 
		begin
			case(state)
				
				STATE_IDLE:
				begin
					if(require)
					begin
						state <= STATE_COMPARE_TAG;
					end
					
					else
					begin
						state <= STATE_IDLE;
					end

				end

				STATE_COMPARE_TAG:
				begin
					//check valid
					if(sram_valid && hit)
					begin
						mem_enable <= 1'b0;
						mem_write <= 1'b0;
						cache_we   <= 1'b0; 
						write_back <= 1'b0;
						state <= STATE_IDLE;
					end

					else if(sram_dirty && !hit)
					begin
						mem_enable <= 1'b1;
						mem_write <= 1'b1;
						cache_we   <= 1'b0; 
						write_back <= 1'b1;
						state<= STATE_WRITE_BACK;
					end

					else if(!sram_dirty && !hit)
					begin
						mem_enable <= 1'b1;
						mem_write <= 1'b0;
						cache_we   <= 1'b1; 
						write_back <= 1'b0;
						state <= STATE_ALLOCATE;
					end

					else
					begin
						mem_enable <= 1'b0;
						mem_write <= 1'b0;
						cache_we   <= 1'b0; 
						write_back <= 1'b0;
						state <= STATE_IDLE;
					end
				end
				
				STATE_ALLOCATE:
				begin
					if(ext_mem_ack)
					begin
						state <= STATE_COMPARE_TAG;
					end
					else
					begin
						state <= STATE_ALLOCATE;
					end
				end
				
				STATE_WRITE_BACK:
				begin
					if(ext_mem_ack)
					begin
						mem_enable <= 1'b1;
						mem_write <= 1'b0;
						cache_we   <= 1'b1; 
						write_back <= 1'b0;
						state <= STATE_ALLOCATE;
					end
					else
					begin
						state <= STATE_WRITE_BACK;
					end
				end

			endcase
		end
	end

endmodule
