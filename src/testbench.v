`define CYCLE_TIME 50

module TestBench;

reg         clk;
reg			reset;
reg         start;
integer     i, outfile, counter;
integer     stall, flush;

always #(`CYCLE_TIME/2) clk = ~clk;

CPU CPU(
    .clk	(clk),
	.rst	(reset),
    .start	(start)
);

initial begin
    counter = 0;
    stall = 0;
    flush = 0;

    // Initialize the instruction memory.
    for(i=0; i<1024; i=i+1) begin
        CPU.InstrMem.memory[i] = 32'b0;
    end

    // Initialize the data memory.
    for(i=0; i<32; i=i+1) begin
        CPU.DataMem.memory[i] = 8'b0;
    end

    // Initialize the registers.
    for(i=0; i<32; i=i+1) begin
        CPU.RegFiles.register[i] = 32'b0;
    end

    // Load instructions into instruction memory
    $readmemb(".\\dat\\fibonacci_instruction.txt", CPU.InstrMem.memory);

    // Open output file
    outfile = $fopen(".\\dat\\output.txt") | 1;

    // Set Input n into data memory at 0x00
    CPU.DataMem.memory[0] = 8'h5;       // n = 5 for example

   	clk = 1;
	start = 0;
    reset = 1;

	#(`CYCLE_TIME/2)
	reset = 0;

    #(`CYCLE_TIME/4)
	start = 1;
	reset = 1;

end

always@(posedge clk) begin
    if(counter == 500)
        $stop;

    // print HDU
    $fdisplay(outfile, "HDU signal");
    $fdisplay(outfile, "stall = %d, Flush_o = %d", CPU.HDU.stall, CPU.Ctrl.PC_ctrl_o[1]);

    // count stall and flush
	if(CPU.HDU.stall == 1)
		stall = stall + 1;

    if(CPU.Ctrl.PC_ctrl_o[1] == 1)
		flush = flush + 1;
    // print PC
    $fdisplay(outfile, "cycle = %d, start = %d, Stall = %d, Flush = %d\nPC = %d", counter, start, stall, flush, CPU.PC.addr_o);

    // print RegFiles
    $fdisplay(outfile, "RegFiles");
    $fdisplay(outfile, "R0(r0) = %d, R8 (t0) = %d, R16(s0) = %d, R24(t8) = %d", CPU.RegFiles.register[0], CPU.RegFiles.register[8] , CPU.RegFiles.register[16], CPU.RegFiles.register[24]);
    $fdisplay(outfile, "R1(at) = %d, R9 (t1) = %d, R17(s1) = %d, R25(t9) = %d", CPU.RegFiles.register[1], CPU.RegFiles.register[9] , CPU.RegFiles.register[17], CPU.RegFiles.register[25]);
    $fdisplay(outfile, "R2(v0) = %d, R10(t2) = %d, R18(s2) = %d, R26(k0) = %d", CPU.RegFiles.register[2], CPU.RegFiles.register[10], CPU.RegFiles.register[18], CPU.RegFiles.register[26]);
    $fdisplay(outfile, "R3(v1) = %d, R11(t3) = %d, R19(s3) = %d, R27(k1) = %d", CPU.RegFiles.register[3], CPU.RegFiles.register[11], CPU.RegFiles.register[19], CPU.RegFiles.register[27]);
    $fdisplay(outfile, "R4(a0) = %d, R12(t4) = %d, R20(s4) = %d, R28(gp) = %d", CPU.RegFiles.register[4], CPU.RegFiles.register[12], CPU.RegFiles.register[20], CPU.RegFiles.register[28]);
    $fdisplay(outfile, "R5(a1) = %d, R13(t5) = %d, R21(s5) = %d, R29(sp) = %d", CPU.RegFiles.register[5], CPU.RegFiles.register[13], CPU.RegFiles.register[21], CPU.RegFiles.register[29]);
    $fdisplay(outfile, "R6(a2) = %d, R14(t6) = %d, R22(s6) = %d, R30(s8) = %d", CPU.RegFiles.register[6], CPU.RegFiles.register[14], CPU.RegFiles.register[22], CPU.RegFiles.register[30]);
    $fdisplay(outfile, "R7(a3) = %d, R15(t7) = %d, R23(s7) = %d, R31(ra) = %d", CPU.RegFiles.register[7], CPU.RegFiles.register[15], CPU.RegFiles.register[23], CPU.RegFiles.register[31]);

    // print Data Memory
    $fdisplay(outfile, "Data Memory: 0x00 = %d", {CPU.DataMem.memory[3] , CPU.DataMem.memory[2] , CPU.DataMem.memory[1] , CPU.DataMem.memory[0] });
    $fdisplay(outfile, "Data Memory: 0x04 = %d", {CPU.DataMem.memory[7] , CPU.DataMem.memory[6] , CPU.DataMem.memory[5] , CPU.DataMem.memory[4] });
    $fdisplay(outfile, "Data Memory: 0x08 = %d", {CPU.DataMem.memory[11], CPU.DataMem.memory[10], CPU.DataMem.memory[9] , CPU.DataMem.memory[8] });
    $fdisplay(outfile, "Data Memory: 0x0c = %d", {CPU.DataMem.memory[15], CPU.DataMem.memory[14], CPU.DataMem.memory[13], CPU.DataMem.memory[12]});
    $fdisplay(outfile, "Data Memory: 0x10 = %d", {CPU.DataMem.memory[19], CPU.DataMem.memory[18], CPU.DataMem.memory[17], CPU.DataMem.memory[16]});
    $fdisplay(outfile, "Data Memory: 0x14 = %d", {CPU.DataMem.memory[23], CPU.DataMem.memory[22], CPU.DataMem.memory[21], CPU.DataMem.memory[20]});
    $fdisplay(outfile, "Data Memory: 0x18 = %d", {CPU.DataMem.memory[27], CPU.DataMem.memory[26], CPU.DataMem.memory[25], CPU.DataMem.memory[24]});
    $fdisplay(outfile, "Data Memory: 0x1c = %d", {CPU.DataMem.memory[31], CPU.DataMem.memory[30], CPU.DataMem.memory[29], CPU.DataMem.memory[28]});

    $fdisplay(outfile, "\n");

    counter = counter + 1;

end

endmodule
