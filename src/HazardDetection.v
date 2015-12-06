module HazardDetectionUnit
(
	input			IDEX_Mem_cs,
	input 	[4:0]	IDEX_Rt_i,
	input	[4:0]	IFID_Rs_i,
	input	[4:0]	IFID_Rt_i,
	output			stall
);

	always @ (*)
	begin
		if (IDEX_Mem_cs && ((IDEX_Rt_i == IFID_Rs) || (IDEX_Rt_i == IFID_Rt)))
			// Stall the pipeline.

	end

endmodule
