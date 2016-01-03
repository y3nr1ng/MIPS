`define CYCLE_TIME 100

module Dram_Testbench;

	reg 	[31:0]		data_i;
	reg		[31:0]		addr_i;
	reg 	clk, cs, we;
	wire				ack;
	wire 	[31:0]		data_o;

	always #(`CYCLE_TIME/2) clk = ~clk;

	DRAM #(.delay(10)) dram(
		.clk(clk),
		.addr_i(addr_i),
		.cs(cs),
		.we(we),
		.data_i(data_i),
		.data_o(data_o),
		.ack(ack)
	);

	initial begin		
		#(`CYCLE_TIME/4)

		clk = 0;

		fork   
	    	#0
	    		addr_i = 32'd0;
				data_i = 32'd0;
				cs = 0;
				we = 0;
	    	#1	
	    		addr_i = 32'd2;
				data_i = 32'd10;
				cs = 1;
				we = 1;
			#1
				cs = 0;
				we = 0;
		    #20
		    	addr_i = 32'd2;
		    	cs = 1;
		    #21
		    	cs = 0;
		    #35
		    	addr_i = 32'd2;
				data_i = 32'd120;
				cs = 1;
				we = 1;
			#36
				cs = 0;
				we = 0;

			#50
				addr_i = 32'd2;
		    	cs = 1;
		    #51
		    	cs = 0;
		join
	end

endmodule