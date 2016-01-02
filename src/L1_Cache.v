module L1_Cache
#(
	parameter width 	= 32
)
(
	input					clk,
	input		[width-1:0]	addr_i,
	input					cs,
	input					we,
	input		[width-1:0]	data_i,
	output	reg	[width-1:0]	data_o,
	output	reg				stall
);

	initial begin
		data_o = { width{1'bz} };
	end

endmodule
