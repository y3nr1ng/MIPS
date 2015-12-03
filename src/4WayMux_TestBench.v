`timescale 1 ns/1 ns

module FourWayMux_TestBench;

	reg		[3:0]		a_i, b_i, c_i, d_i;
	reg		[1:0]	 	sel_i;
	wire 	[3:0]		q_o;
	
	initial begin
		fork   
	    	#0	a_i   = 1;
	    	    b_i   = 3;
	    	    c_i   = 5;
	    	    d_i   = 7;
	    	    sel_i = 2'b00;
	        
	    	#10 sel_i = 2'b01;
	    	#20 sel_i = 2'b10;
	    	#30 sel_i = 2'b11;
	    	#40 sel_i = 2'b00;
		join
	end

	Multiplexer4Way #(.width(4)) u_mux_case (
		.data_1  	(a_i),
	  	.data_2  	(b_i),
	  	.data_3  	(c_i),
	  	.data_4  	(d_i),
	  	.sel_i		(sel_i),
	  	.data_o  	(q_o)
	);

endmodule
