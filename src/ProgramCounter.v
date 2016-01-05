module ProgramCounter
(
    input				clk,
    input				rst,
    input				start,
    input               we,
    input		[31:0]	addr_i,
    output reg	[31:0]	addr_o
);

always @ (posedge clk or negedge rst) begin
    if(~rst)
        addr_o = 32'b0;
    else begin
        if(start && we)
            addr_o = addr_i;
        else
            addr_o = addr_o;
    end
end

endmodule
