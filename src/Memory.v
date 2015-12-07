module Memory
#(
	parameter width 	= 32,
	parameter size 		= 1024
)
(
	input					clk,
	input		[width-1:0]	addr_i,
	input					cs,		
	input					we,		
	input 		[width-1:0] data_i,
	output	reg [width-1:0]	data_o
);

	reg	[width-1:0]	memory	[0:size-1];

	initial begin
		data_o = { width{1'bz} };
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
			data_o = {width{1'bz}};

endmodule
