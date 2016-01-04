module DRAM
#(
	parameter addr_width 	= 32,
	parameter data_width	= 32,
	parameter mem_size 		= 1024,
	parameter delay			= 0
)
(
	input							clk,
	input		[addr_width-1:0]	addr_i,
	input							cs,		
	input							we,		
	input 		[data_width-1:0] 	data_i,
	output	reg [data_width-1:0]	data_o,
	output	reg						ack
);
	`define	DRAM_IDLE			0
	`define	DRAM_READ_WAIT		1
	`define DRAM_WRITE_WAIT		2
	`define	DRAM_READ			3
	`define	DRAM_WRITE			4
	`define	DRAM_NCS			5
	
	integer i;
	integer delay_cnt;

	reg	[data_width-1:0]	memory	[0:mem_size-1];

	reg	[2:0]				state;

	reg	[addr_width-1:0]	r_addr;
	reg	[data_width-1:0]	r_data_i;

	initial begin
		data_o = {data_width{1'bz}};
		ack = 1'b0;

		state = `DRAM_IDLE;
	end
	
	always @ (posedge clk) begin
		case(state)
			`DRAM_IDLE: 
			begin
				ack = 1'b1;

				r_addr = addr_i;
				r_data_i = data_i;
				
				if(cs) begin
					delay_cnt = delay-2;
					if(delay_cnt > 0) begin
						ack = 1'b0;
						if(we)
							state = `DRAM_WRITE_WAIT;
						else
							state = `DRAM_READ_WAIT;
					end
					else begin
						if(we)
							memory[addr_i >> 2] <= data_i;
						else
							data_o = memory[addr_i >> 2];
						state = `DRAM_NCS;
					end
				end
			end

			`DRAM_READ_WAIT:
			begin
				if(delay_cnt > 0)
					delay_cnt = delay_cnt-1;
				else
					state = `DRAM_READ;
			end

			`DRAM_WRITE_WAIT:
			begin
				if(delay_cnt > 0)
					delay_cnt = delay_cnt-1;
				else
					state = `DRAM_WRITE;
			end

			`DRAM_READ:
			begin	
				data_o = memory[r_addr >> 2];
				ack = 1'b1;
				
				state = `DRAM_NCS;
			end

			`DRAM_WRITE:
			begin	
				memory[r_addr >> 2] <= r_data_i;
				ack = 1'b1;
				
				state = `DRAM_NCS;
			end

			`DRAM_NCS:
			begin	
				// Turn off output pins.
				data_o = {data_width{1'bz}};

				state = `DRAM_IDLE;
			end
		endcase
	end

endmodule
