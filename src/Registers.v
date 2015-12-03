module Registers #(parameter width=32, size=32) (
    input				clk,
	input	[4:0]		Rs_addr, Rt_addr,
	output	[width-1:0]	Rs_data, Rt_data,
	input				we,
	input	[4:0]		Rd_addr,
	input	[width-1:0]	Rd_data
);

	// Register File
	reg     [31:0]      register        [0:31];

	// Read Data      
	assign  Rs_data = register[Rs_addr];
	assign  Rt_data = register[Rt_addr];

	// Write Data   
	always@(posedge clk) begin
    	if(we)
    	    register[Rd_addr] <= Rd_data;
	end
   
endmodule 
