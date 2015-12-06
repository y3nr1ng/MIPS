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

	reg	[width-1:0]	memory	[0:size];
	
	always @ (posedge clk)
		if(cs)
		begin
			if(we) 
			begin
				// WE = Write Enable, select to write
				memory[addr_i >> 2] <= data_i;
			end
			else
			begin
				// CS = Chip Select, select to read
				data_o = memory[addr_i >> 2];
			end
		end
		else 
		begin
			// Turn off the output pin.
			data_o = {width{1'bz}};
		end

endmodule
