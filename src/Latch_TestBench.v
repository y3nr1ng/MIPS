`define CYCLE_TIME 10

module Latch_TestBench;

	reg		[7:0]		in;
	reg					clk, rst, en;
	wire 	[7:0]		out;
	
	always #(`CYCLE_TIME/2) clk = ~clk;

	Latch #(.width(8)) d_ff (
		.clk		(clk),
		.rst		(rst),
		.en			(en),
		.data_i		(in),
		.data_o		(out)
	);

	initial begin		
		#(`CYCLE_TIME/4)

		clk = 0;

		fork   
	    	#0	in	  = 42;
				rst   = 0;
	    	    en    = 0;
	        
	    	#10 en	  = 1;
	    	#20 en    = 0;
	    	#30 in    = 7;
	    	#40 en    = 1;
			#50 en 	  = 0;
			#60 rst   = 1;
		    #70 rst	  = 0;
		join
	end

endmodule
