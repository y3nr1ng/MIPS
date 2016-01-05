module HazardDetectionUnit
(
	input	[4:0]	IFID_Rs_i,
	input	[4:0]	IFID_Rt_i,
	input 	[4:0]	IDEX_Rt_i,
	input			IDEX_Mem_cs,
	output 			stall
);

	assign stall = (IDEX_Mem_cs && ((IDEX_Rt_i == IFID_Rs_i) || (IDEX_Rt_i == IFID_Rt_i))) ? 1'b1 : 1'b0;

endmodule
