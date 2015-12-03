module PC
(
    input				clk,
    input				rst,
    input				start,
    input		[31:0]	addr_i,
    output reg	[31:0]	addr_o
);

always@(posedge clk or negedge rst) begin
    if(~rst) begin
        addr_o <= 32'b0;
    end
    else begin
        if(start)
            addr_o <= addr_i;
        else
            addr_o <= addr_o;
    end
end

endmodule
