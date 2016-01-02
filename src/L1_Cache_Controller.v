module L1_Cache_Controller
(
);
	
input	[256-1:0]	ext_mem_data_i,
	input				ext_mem_ack, 	
	output	[256-1:0]	ext_mem_data_o, 
	output	[32-1:0]	ext_mem_addr,
	output				ext_mem_cs, 
	output				ext_mem_we 

	wire	[255:0]	mem_data = CPU.ext_mem_data_i;
		assign	mem_cs	= CPU.ext_mem_cs;
		assign	mem_we	= CPU.ext_mem_we;
		assign	mem_ack	= CPU.ext_mem_ack;
		assign	cache_we	= ?;
		assign	

	parameter STATE_IDLE 		= 3'd0,
			  STATE_COMPARE_TAG	= 3'd1,
			  STATE_ALLOCATE	= 3'd2,
			  STATE_WRITE_BACK	= 3'd3;
	reg		[2:0]	state;

	always @ (posedge clk or negedge rst) begin
		if(~rst) begin
			state <= STATE_IDLE;
			
		end
		else begin
			case(state)
				STATE_IDLE:
				begin
				end
				STATE_COMPARE_TAG:
				begin
				end
			endcase
		end
	end

endmodule
