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

	reg			[data_width-1:0]	memory	[0:mem_size-1];

	initial begin
		data_o = {data_width{1'bz}};
	end
	
	always @ (posedge clk)
		if(cs) begin
			if(we)
				// WE = Write Enable, select to write, output remain the same.
				memory[addr_i >> 2] <= data_i;
			else
				// CS = Chip Select, select to read, update the output.
				data_o = memory[addr_i >> 2];
		end else
			// Turn off the output pin.
			data_o = {data_width{1'bz}};

endmodule

module ShiftDelay
#(
	parameter depth = 3
)
(
	input clk,
	input reset,
	input data_in,
	output data_out
);

	wire [depth-1:0] connect_wire;

	assign data_out = connect_wire[depth-1];
	assign connect_wire[0] = data_in;

	generate
		genvar i;
		for (i = 1; i < depth; i = i+1) begin
			dff DFF(clk, reset, connect_wire[i-1], connect_wire[i]);
		end
	endgenerate

endmodule
