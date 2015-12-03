module PC
(
    input		clk,
    input		rst,
    input		start,
    input	[31:0]	pc_i,
    output reg	[31:0]	pc_o
);

always@(posedge clk or negedge rst) begin
    if(~rst) begin
        pc_o <= 32'b0;
    end
    else begin
        if(start)
            pc_o <= pc_i;
        else
            pc_o <= pc_o;
    end
end

endmodule
