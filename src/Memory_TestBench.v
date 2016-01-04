module Memory_TestBench;

	reg				clk, cs, we;
	reg	[31:0] 		addr, data_i;
	
	integer 		i;

	parameter mem_size = 32;

	DRAM #(.mem_size(mem_size), .delay(5)) mem_dut 
	(
		.clk		(clk),
		.addr_i		(addr),
		.cs			(cs),
		.we			(we),
		.data_i		(data_i),
		.data_o		(),
		.ack		()
	);
	
	// The clock pulse.
	initial begin
		clk = 0;
		forever #10
			clk = ~clk;
	end

	// Reset the memory and control signals.
	initial begin
		for(i = 0; i < mem_size; i = i+1) begin
       		mem_dut.memory[i] = 32'b0;
   		end
	
		i = 0;
		cs = 0;
		we = 0;
		data_i = 32'bz;
	end

	// Stimulus
	always @ (posedge clk) begin
		if(i < 30) begin
			if(i > 15)
				addr = 32'h01;
		end else if(i < 60) begin
			if(i > 45) begin
				cs = 1;
				we = 0;
			end
		end else if(i < 90) begin
			if(i > 75)
				data_i = 42;
		end else if(i < 120) begin
			if(i > 105) begin
				cs = 0;
				we = 1;
			end
		end else if(i < 150) begin
			if(i > 135) begin
				cs = 1;
				we = 1;
			end
		end else if(i < 180) begin
			cs = 0;
			we = 0;
		end else
			$stop;

		i = i+1;
	end

endmodule
