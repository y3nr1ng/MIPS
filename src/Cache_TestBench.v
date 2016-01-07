`define CYCLE_TIME 50
`include "StateTable.v"

module Cache_TestBench;

	integer				i, outfile, outfile2, counter;

	parameter			flush_cycle = 300;

	reg					clk, rst, start;

	reg					flag;
	reg		[26:0]		address;
	reg		[23:0]		tag;
	reg		[4:0]		index;

	wire	[256-1:0]	mem_cpu_data;
	wire				mem_cpu_ack;
	wire	[256-1:0]	cpu_mem_data;
	wire	[32-1:0]	cpu_mem_addr;
	wire				cpu_mem_enable;
	wire				cpu_mem_write;

	always #(`CYCLE_TIME/2)
		clk = ~clk;

	CPU CPU(
		.clk	  		(clk),
   	 	.rst	  		(rst),
		.start			(start),

		// Interface to external memory.
		.ext_mem_addr	(cpu_mem_addr),
		.ext_mem_data_i	(mem_cpu_data),
		.ext_mem_cs		(cpu_mem_enable),
		.ext_mem_we		(cpu_mem_write),
		.ext_mem_data_o	(cpu_mem_data),
		.ext_mem_ack	(mem_cpu_ack)
	);

	Data_Memory Data_Memory
	(
		.clk_i    (clk),
  		.rst_i    (rst),
		.addr_i   (cpu_mem_addr),
		.data_i   (cpu_mem_data),
		.enable_i (cpu_mem_enable),
		.write_i  (cpu_mem_write),
		.ack_o    (mem_cpu_ack),
		.data_o   (mem_cpu_data)
	);

	/*
	// External memory, 16KB.
	DRAM #(.data_width(256), .mem_size(2048), .delay(10)) Data_Memory (
		.clk    		(clk),

		// Interface to the CPU.
		.addr_i   		(cpu_mem_addr),
		.data_i   		(cpu_mem_data),
		.cs		 		(cpu_mem_enable),
		.we  			(cpu_mem_write),
		.ack    		(mem_cpu_ack),
		.data_o   		(mem_cpu_data)
	);
*/

	initial begin
		counter = 1;

		// initialize data memory	(16KB)
		for(i=0; i<512; i=i+1) begin
			Data_Memory.memory[i] = 256'b0;
		end

		// initialize cache memory	(1KB)
		for(i=0; i<32; i=i+1) begin
			CPU.L1Cache.dcache_tag_sram.memory[i] = 24'b0;
			CPU.L1Cache.dcache_data_sram.memory[i] = 256'b0;
		end

		// Load instructions into instruction memory
		$readmemb(".\\dat\\cache_instruction.txt", CPU.InstrMem.memory);

		// Open output file
		outfile = $fopen(".\\dat\\output.txt") | 1;
		outfile2 = $fopen(".\\dat\\cache.txt") | 1;

		// Set Input n into data memory at 0x00
		Data_Memory.memory[0] = 256'h5;		// n = 5 for example
	
		/*
    	clk = 0;
    	rst = 1;
    	start = 0;

    	#(`CYCLE_TIME/8)
    	rst = 0;

    	#(`CYCLE_TIME/8)
    	start = 1;

		#(`CYCLE_TIME/8)
		rst = 1;
		*/

		clk = 0;
		rst = 0;
		start = 0;
		
		#(`CYCLE_TIME/4)
		rst = 1;
		start = 1;

	end

	always @ (posedge clk) begin
		// Store cache to memory.
		if(counter > flush_cycle)
			$stop;
		else if(counter == flush_cycle) begin
			$fdisplay(outfile, "Flush Cache! \n");

			for(i=0; i<32; i=i+1) begin
				tag = CPU.L1Cache.dcache_tag_sram.memory[i];
				index = i;
				address = {tag[21:0], index};
				Data_Memory.memory[address] = CPU.L1Cache.dcache_data_sram.memory[i];
			end
		end

		$fdisplay(outfile, "cycle = %d, Start = %b", counter, start);
		$fdisplay(outfile, "PC = %d", CPU.PC.addr_o);

		// Dump the registers.
   		$fdisplay(outfile, "RegFiles");
    	$fdisplay(outfile, "R0(r0) = %h, R8 (t0) = %h, R16(s0) = %h, R24(t8) = %h", CPU.RegFiles.register[0], CPU.RegFiles.register[8] , CPU.RegFiles.register[16], CPU.RegFiles.register[24]);
    	$fdisplay(outfile, "R1(at) = %h, R9 (t1) = %h, R17(s1) = %h, R25(t9) = %h", CPU.RegFiles.register[1], CPU.RegFiles.register[9] , CPU.RegFiles.register[17], CPU.RegFiles.register[25]);
    	$fdisplay(outfile, "R2(v0) = %h, R10(t2) = %h, R18(s2) = %h, R26(k0) = %h", CPU.RegFiles.register[2], CPU.RegFiles.register[10], CPU.RegFiles.register[18], CPU.RegFiles.register[26]);
    	$fdisplay(outfile, "R3(v1) = %h, R11(t3) = %h, R19(s3) = %h, R27(k1) = %h", CPU.RegFiles.register[3], CPU.RegFiles.register[11], CPU.RegFiles.register[19], CPU.RegFiles.register[27]);
    	$fdisplay(outfile, "R4(a0) = %h, R12(t4) = %h, R20(s4) = %h, R28(gp) = %h", CPU.RegFiles.register[4], CPU.RegFiles.register[12], CPU.RegFiles.register[20], CPU.RegFiles.register[28]);
    	$fdisplay(outfile, "R5(a1) = %h, R13(t5) = %h, R21(s5) = %h, R29(sp) = %h", CPU.RegFiles.register[5], CPU.RegFiles.register[13], CPU.RegFiles.register[21], CPU.RegFiles.register[29]);
    	$fdisplay(outfile, "R6(a2) = %h, R14(t6) = %h, R22(s6) = %h, R30(s8) = %h", CPU.RegFiles.register[6], CPU.RegFiles.register[14], CPU.RegFiles.register[22], CPU.RegFiles.register[30]);
    	$fdisplay(outfile, "R7(a3) = %h, R15(t7) = %h, R23(s7) = %h, R31(ra) = %h", CPU.RegFiles.register[7], CPU.RegFiles.register[15], CPU.RegFiles.register[23], CPU.RegFiles.register[31]);

		// Dump the data memory.
		$fdisplay(outfile, "Data Memory: 0x0000 = %h", Data_Memory.memory[0]);
		$fdisplay(outfile, "Data Memory: 0x0020 = %h", Data_Memory.memory[1]);
		$fdisplay(outfile, "Data Memory: 0x0040 = %h", Data_Memory.memory[2]);
		$fdisplay(outfile, "Data Memory: 0x0060 = %h", Data_Memory.memory[3]);
		$fdisplay(outfile, "Data Memory: 0x0080 = %h", Data_Memory.memory[4]);
		$fdisplay(outfile, "Data Memory: 0x00A0 = %h", Data_Memory.memory[5]);
		$fdisplay(outfile, "Data Memory: 0x00C0 = %h", Data_Memory.memory[6]);
		$fdisplay(outfile, "Data Memory: 0x00E0 = %h", Data_Memory.memory[7]);
		$fdisplay(outfile, "Data Memory: 0x0400 = %h", Data_Memory.memory[32]);

		$fdisplay(outfile, "\n");

		// Print the status of data cache.

		// print Data Cache Status
	if(CPU.L1Cache.p1_stall_o && CPU.L1Cache.state==0) begin
		if(CPU.L1Cache.sram_dirty) begin
			if(CPU.L1Cache.p1_MemWrite_i)
				$fdisplay(outfile2, "Cycle: %d, Write Miss, Address: %h, Write Data: %h (Write Back!)", counter, CPU.L1Cache.p1_addr_i, CPU.L1Cache.p1_data_i);
			else if(CPU.L1Cache.p1_MemRead_i)
				$fdisplay(outfile2, "Cycle: %d, Read Miss , Address: %h, Read Data : %h (Write Back!)", counter, CPU.L1Cache.p1_addr_i, CPU.L1Cache.p1_data_o);
		end
		else begin
			if(CPU.L1Cache.p1_MemWrite_i)
				$fdisplay(outfile2, "Cycle: %d, Write Miss, Address: %h, Write Data: %h", counter, CPU.L1Cache.p1_addr_i, CPU.L1Cache.p1_data_i);
			else if(CPU.L1Cache.p1_MemRead_i)
				$fdisplay(outfile2, "Cycle: %d, Read Miss , Address: %h, Read Data : %h", counter, CPU.L1Cache.p1_addr_i, CPU.L1Cache.p1_data_o);
		end
		flag = 1'b1;
	end
	else if(!CPU.L1Cache.p1_stall_o) begin
		if(!flag) begin
			if(CPU.L1Cache.p1_MemWrite_i)
				$fdisplay(outfile2, "Cycle: %d, Write Hit , Address: %h, Write Data: %h", counter, CPU.L1Cache.p1_addr_i, CPU.L1Cache.p1_data_i);
			else if(CPU.L1Cache.p1_MemRead_i)
				$fdisplay(outfile2, "Cycle: %d, Read Hit  , Address: %h, Read Data : %h", counter, CPU.L1Cache.p1_addr_i, CPU.L1Cache.p1_data_o);
		end
		flag = 1'b0;
	end

		counter = counter+1;
	end

endmodule
