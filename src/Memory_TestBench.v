module Memory_TestBench;

	reg			Clk, CS, WE;
	reg	[31:0] 		addr, data_i;
	
	integer 		i;

	parameter mem_size	= 32;

	Memory #(.size(mem_size)) Mem 
	(
		.clk_i		(Clk),
		.addr_i		(addr),
		.cs		(CS),
		.we		(WE),
		.data_i		(data_i),
		.data_o		()
	);

	// Reset the memory.
	initial begin
		Clk = 0;
		for(i = 0; i < mem_size; i = i+1) begin
       	 		Mem.memory[i] = 32'b0;
   		end
		
		#0
		$display("Read at 0x0A...");
		addr = 32'h01;
		#1
		Clk = 1; 
		#2
		Clk = 0;
		#3
		$display("... not selected, value is %d\n", Mem.data_o);
		CS = 1;
		WE = 0;
		#4
		Clk = 1; 
		#5
		Clk = 0;
		#6
		$display("... selected, value is %d\n", Mem.data_o);
		$display("Write 42 at 0x0A, but not write enabled...");
		data_i = 42;
		#7
		Clk = 1; 
		#8
		Clk = 0;
		#9
		$display("... value is %d\n", Mem.data_o);
		CS = 0;
		WE = 1;
		#10
		Clk = 1; 
		#11
		Clk = 0;
		#12
		CS = 1;
		WE = 0;
		#13
		Clk = 1; 
		#14
		Clk = 0;
		#15
		$display("... enabled, value is %d\n", Mem.data_o);
	end

endmodule
