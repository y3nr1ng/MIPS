module HazardDetectionUnit
(
	input		[4:0]	IFID_Rs_i,
	input		[4:0]	IFID_Rt_i,
	input 		[4:0]	IDEX_Rt_i,
	input				IDEX_Mem_cs,
	output reg 			stall
);

	always @ (*) begin
		if(IDEX_Mem_cs && ((IDEX_Rt_i == IFID_Rs_i) || (IDEX_Rt_i == IFID_Rt_i))) begin
			stall = 1'b1;
			#(10)
			stall = 1'b0;
		end
		else
			stall = 1'b0;
	end
	
	//assign stall = (IDEX_Mem_cs && ((IDEX_Rt_i == IFID_Rs_i) || (IDEX_Rt_i == IFID_Rt_i))) ? 1'b1 : 1'b0;

endmodule
