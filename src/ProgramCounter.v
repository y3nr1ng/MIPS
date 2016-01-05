module ProgramCounter
(
    input				clk,
    input				rst,
    input				start,
    input               we,
	input				stall,
    input		[31:0]	addr_i,
    output reg	[31:0]	addr_o
);

always @ (posedge clk or negedge rst) begin
	if(~rst) begin
		addr_o <= 32'b0;
	end
	else begin
		if(stall) begin
		end
		else if(start) begin
			if(we)
				addr_o <= addr_i;
		end 
		else
			addr_o <= 32'b0;
	end
end

endmodule
