module L1_Cache
(
	input					clk,
	input		[32-1:0]	addr_i,
	input					cs,
	input					we,
	input		[32-1:0]	data_i,
	output	reg	[32-1:0]	data_o,
	output	reg				stall
);

endmodule
