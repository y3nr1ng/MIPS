onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label Clock /Cache_TestBench/CPU/clk
add wave -noupdate -label Reset /Cache_TestBench/CPU/rst
add wave -noupdate -label Start /Cache_TestBench/CPU/start
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group IF -label WE -radix binary -radixshowbase 0 /Cache_TestBench/CPU/PC/we
add wave -noupdate -expand -group IF -label Stall -radix binary -radixshowbase 0 /Cache_TestBench/CPU/PC/stall
add wave -noupdate -expand -group IF -group {PC Multiplexer} -label {PC += 4} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/PC_Mux/data_1
add wave -noupdate -expand -group IF -group {PC Multiplexer} -label Hi-Z -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/PC_Mux/data_2
add wave -noupdate -expand -group IF -group {PC Multiplexer} -label {Jump Address} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/PC_Mux/data_3
add wave -noupdate -expand -group IF -group {PC Multiplexer} -label {Branch Address} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/PC_Mux/data_4
add wave -noupdate -expand -group IF -group {PC Multiplexer} -label sel -radix binary -radixshowbase 0 /Cache_TestBench/CPU/PC_Mux/sel
add wave -noupdate -expand -group IF -group {PC Multiplexer} -label {Data Out} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/PC_Mux/data_o
add wave -noupdate -expand -group IF -label Address -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/PC/addr_o
add wave -noupdate -expand -group IF -label CS -radix binary -radixshowbase 0 /Cache_TestBench/CPU/InstrMem/cs
add wave -noupdate -expand -group IF -label WE -radix binary -radixshowbase 0 /Cache_TestBench/CPU/InstrMem/we
add wave -noupdate -expand -group IF -label {Instruction Out} -radixshowbase 0 /Cache_TestBench/CPU/InstrMem/data_o
add wave -noupdate -expand -group IF/ID -label {IF/ID Flush} -radix binary -radixshowbase 0 /Cache_TestBench/CPU/IFID_Reg/flush
add wave -noupdate -expand -group IF/ID -label {Flush Reg} -radix binary -radixshowbase 0 /Cache_TestBench/CPU/IFID_Reg/r_flush
add wave -noupdate -expand -group IF/ID -label {IF/ID Stall} -radix binary -radixshowbase 0 /Cache_TestBench/CPU/IFID_Reg/stall
add wave -noupdate -expand -group IF/ID -label {Pre PC Increment} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/IFID_Reg/PC_Inc_i
add wave -noupdate -expand -group IF/ID -label {Pre Instr} -radix binary -radixshowbase 0 /Cache_TestBench/CPU/IFID_Reg/InstrMem_i
add wave -noupdate -expand -group IF/ID -divider <NULL>
add wave -noupdate -expand -group IF/ID -label {Post PC Increment} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/IFID_Reg/PC_Inc_o
add wave -noupdate -expand -group IF/ID -label {Post Instr} -radix binary -radixshowbase 0 /Cache_TestBench/CPU/IFID_Reg/InstrMem_o
add wave -noupdate -expand -group ID -label Op -radix binary -radixshowbase 0 /Cache_TestBench/CPU/instr_op
add wave -noupdate -expand -group ID -label Func -radix binary -radixshowbase 0 /Cache_TestBench/CPU/instr_func
add wave -noupdate -expand -group ID -expand -group {General Control} -label {Rs == Rt} -radix binary -radixshowbase 0 /Cache_TestBench/CPU/Ctrl/is_equal_i
add wave -noupdate -expand -group ID -expand -group {General Control} -label PC_ctrl -radix binary -radixshowbase 0 /Cache_TestBench/CPU/Ctrl/PC_ctrl_o
add wave -noupdate -expand -group ID -expand -group {General Control} -label EX_ctrl -radix binary -radixshowbase 0 /Cache_TestBench/CPU/Ctrl/EX_ctrl_o
add wave -noupdate -expand -group ID -expand -group {General Control} -label MEM_ctrl -radix binary -radixshowbase 0 /Cache_TestBench/CPU/Ctrl/MEM_ctrl_o
add wave -noupdate -expand -group ID -expand -group {General Control} -label WB_ctrl -radix binary -radixshowbase 0 /Cache_TestBench/CPU/Ctrl/WB_ctrl_o
add wave -noupdate -expand -group ID -label {Rs Address} -radix unsigned /Cache_TestBench/CPU/instr_rs
add wave -noupdate -expand -group ID -label {Rt Address} -radix unsigned /Cache_TestBench/CPU/instr_rt
add wave -noupdate -expand -group ID -label {Rd Address} -radix unsigned /Cache_TestBench/CPU/instr_rd
add wave -noupdate -expand -group ID -label {Data Immediate} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/instr_imm
add wave -noupdate -expand -group ID -label {Address Immediate} -radix binary -radixshowbase 0 /Cache_TestBench/CPU/addr_imm
add wave -noupdate -expand -group EX -label {ALU Op} -radix binary -radixshowbase 0 /Cache_TestBench/CPU/ALU/ALUop_i
add wave -noupdate -expand -group EX -expand -group {Data 1 Multiplexer} -label {Data 1} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/Data_1_Mux/data_1
add wave -noupdate -expand -group EX -expand -group {Data 1 Multiplexer} -label {Data 2} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/Data_1_Mux/data_2
add wave -noupdate -expand -group EX -expand -group {Data 1 Multiplexer} -label {Data 3} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/Data_1_Mux/data_3
add wave -noupdate -expand -group EX -expand -group {Data 1 Multiplexer} -label {Data 4} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/Data_1_Mux/data_4
add wave -noupdate -expand -group EX -expand -group {Data 1 Multiplexer} -label sel -radix binary -radixshowbase 0 /Cache_TestBench/CPU/Data_1_Mux/sel
add wave -noupdate -expand -group EX -expand -group {Data 1 Multiplexer} -label {Data Out} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/Data_1_Mux/data_o
add wave -noupdate -expand -group EX -label {Data 1} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/ALU/data_1
add wave -noupdate -expand -group EX -label {Data 2} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/ALU/data_2
add wave -noupdate -expand -group EX -label {Data Out} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/ALU/data_o
add wave -noupdate -expand -group EX -label {Is Zero} -radix binary -radixshowbase 0 /Cache_TestBench/CPU/ALU/is_zero
add wave -noupdate -expand -group EX -expand -group HDU -label IFID_Rs -radix unsigned -radixshowbase 0 /Cache_TestBench/CPU/HDU/IFID_Rs_i
add wave -noupdate -expand -group EX -expand -group HDU -label IFID_Rt -radix unsigned -radixshowbase 0 /Cache_TestBench/CPU/HDU/IFID_Rt_i
add wave -noupdate -expand -group EX -expand -group HDU -label IDEX_Rt -radix unsigned /Cache_TestBench/CPU/HDU/IDEX_Rt_i
add wave -noupdate -expand -group EX -expand -group HDU -label {IDEX_Mem CS} -radix binary /Cache_TestBench/CPU/HDU/IDEX_Mem_cs
add wave -noupdate -expand -group EX -expand -group HDU -label Stall -radix binary -radixshowbase 0 /Cache_TestBench/CPU/HDU/stall
add wave -noupdate -expand -group MEM -label Address -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/DataMem/addr_i
add wave -noupdate -expand -group MEM -label CS -radix binary -radixshowbase 0 /Cache_TestBench/CPU/DataMem/cs
add wave -noupdate -expand -group MEM -label WE -radix binary -radixshowbase 0 /Cache_TestBench/CPU/DataMem/we
add wave -noupdate -expand -group MEM -label {Data In} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/DataMem/data_i
add wave -noupdate -expand -group MEM -label {Data Out} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/DataMem/data_o
add wave -noupdate -expand -group MEM/WB -label {MEM/WB Flush} -radix binary -radixshowbase 0 /Cache_TestBench/CPU/MEMWB_Reg/flush
add wave -noupdate -expand -group MEM/WB -label {MEM/WB Stall} -radix binary -radixshowbase 0 /Cache_TestBench/CPU/MEMWB_Reg/stall
add wave -noupdate -expand -group MEM/WB -divider <NULL>
add wave -noupdate -expand -group MEM/WB -label {Pre WB_ctrl} -radix binary -radixshowbase 0 /Cache_TestBench/CPU/MEMWB_Reg/WB_ctrl_i
add wave -noupdate -expand -group MEM/WB -label {Pre ALU_output} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/MEMWB_Reg/ALU_output_i
add wave -noupdate -expand -group MEM/WB -label {Pre Mem_output} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/MEMWB_Reg/Mem_output_i
add wave -noupdate -expand -group MEM/WB -label {Pre RegFwd} -radix unsigned -radixshowbase 0 /Cache_TestBench/CPU/MEMWB_Reg/RegFwd_i
add wave -noupdate -expand -group MEM/WB -divider <NULL>
add wave -noupdate -expand -group MEM/WB -label {Post WB_ctrl} -radix binary -radixshowbase 0 /Cache_TestBench/CPU/MEMWB_Reg/WB_ctrl_o
add wave -noupdate -expand -group MEM/WB -label {Post ALU_output} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/MEMWB_Reg/ALU_output_o
add wave -noupdate -expand -group MEM/WB -label {Post Mem_output} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/MEMWB_Reg/Mem_output_o
add wave -noupdate -expand -group MEM/WB -label {Post RegFwd} -radix unsigned -radixshowbase 0 /Cache_TestBench/CPU/MEMWB_Reg/RegFwd_o
add wave -noupdate -expand -group WB -label {Data 1} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/WB_Mux/data_1
add wave -noupdate -expand -group WB -label {Data 2} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/WB_Mux/data_2
add wave -noupdate -expand -group WB -label sel -radix binary -radixshowbase 0 /Cache_TestBench/CPU/WB_Mux/sel
add wave -noupdate -expand -group WB -label {Data Out} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/WB_Mux/data_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {593 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 224
configure wave -valuecolwidth 213
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {387 ps} {1033 ps}
