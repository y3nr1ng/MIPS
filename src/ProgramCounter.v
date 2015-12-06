module ProgramCounter
(
    input				clk,
    input				rst,
    input				start,
    input               we,
    input		[31:0]	addr_i,
    output reg	[31:0]	addr_o
);

initial begin
	addr_o <= 32'b0;
end

always@(posedge clk) begin
    if(rst) begin
        addr_o <= 32'b0;
    end
    else begin
        if(start && we)
            addr_o <= addr_i;
        else
            addr_o <= addr_o;
    end
end

endmodule
