onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label Clock /Pipeline_TestBench/CPU/clk
add wave -noupdate -label Reset /Pipeline_TestBench/CPU/rst
add wave -noupdate -label Start /Pipeline_TestBench/CPU/start
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group IF -label WE -radix binary -radixshowbase 0 /Pipeline_TestBench/CPU/PC/we
add wave -noupdate -expand -group IF -label Stall -radix binary -radixshowbase 0 /Pipeline_TestBench/CPU/PC/stall
add wave -noupdate -expand -group IF -expand -group {PC Multiplexer} -label {PC += 4} -radix decimal -radixshowbase 0 /Pipeline_TestBench/CPU/PC_Mux/data_1
add wave -noupdate -expand -group IF -expand -group {PC Multiplexer} -label Hi-Z -radix decimal -radixshowbase 0 /Pipeline_TestBench/CPU/PC_Mux/data_2
add wave -noupdate -expand -group IF -expand -group {PC Multiplexer} -label {Jump Address} -radix decimal -radixshowbase 0 /Pipeline_TestBench/CPU/PC_Mux/data_3
add wave -noupdate -expand -group IF -expand -group {PC Multiplexer} -label {Branch Address} -radix decimal -radixshowbase 0 /Pipeline_TestBench/CPU/PC_Mux/data_4
add wave -noupdate -expand -group IF -expand -group {PC Multiplexer} -label sel -radix binary -radixshowbase 0 /Pipeline_TestBench/CPU/PC_Mux/sel
add wave -noupdate -expand -group IF -expand -group {PC Multiplexer} -label {Data Out} -radix decimal -radixshowbase 0 /Pipeline_TestBench/CPU/PC_Mux/data_o
add wave -noupdate -expand -group IF -label Address -radix decimal -radixshowbase 0 /Pipeline_TestBench/CPU/PC/addr_o
add wave -noupdate -expand -group IF -label CS -radix binary -radixshowbase 0 /Pipeline_TestBench/CPU/InstrMem/cs
add wave -noupdate -expand -group IF -label WE -radix binary -radixshowbase 0 /Pipeline_TestBench/CPU/InstrMem/we
add wave -noupdate -expand -group IF -label {Instruction Out} -radixshowbase 0 /Pipeline_TestBench/CPU/InstrMem/data_o
add wave -noupdate -expand -group ID -label Op -radix binary -radixshowbase 0 /Pipeline_TestBench/CPU/instr_op
add wave -noupdate -expand -group ID -label Func -radix binary -radixshowbase 0 /Pipeline_TestBench/CPU/instr_func
add wave -noupdate -expand -group ID -expand -group {General Control} /Pipeline_TestBench/CPU/Ctrl/is_equal_i
add wave -noupdate -expand -group ID -expand -group {General Control} /Pipeline_TestBench/CPU/Ctrl/PC_ctrl_o
add wave -noupdate -expand -group ID -expand -group {General Control} /Pipeline_TestBench/CPU/Ctrl/EX_ctrl_o
add wave -noupdate -expand -group ID -expand -group {General Control} /Pipeline_TestBench/CPU/Ctrl/MEM_ctrl_o
add wave -noupdate -expand -group ID -expand -group {General Control} /Pipeline_TestBench/CPU/Ctrl/WB_ctrl_o
add wave -noupdate -expand -group ID -label {Rs Address} -radix unsigned /Pipeline_TestBench/CPU/instr_rs
add wave -noupdate -expand -group ID -label {Rt Address} -radix unsigned /Pipeline_TestBench/CPU/instr_rt
add wave -noupdate -expand -group ID -label {Rd Address} -radix unsigned /Pipeline_TestBench/CPU/instr_rd
add wave -noupdate -expand -group ID -label {Data Immediate} -radix decimal -radixshowbase 0 /Pipeline_TestBench/CPU/instr_imm
add wave -noupdate -expand -group ID -label {Address Immediate} -radix binary -radixshowbase 0 /Pipeline_TestBench/CPU/addr_imm
add wave -noupdate -expand -group EX -label {ALU Op} -radix binary -radixshowbase 0 /Pipeline_TestBench/CPU/ALU/ALUop_i
add wave -noupdate -expand -group EX -label {Data 1} -radix decimal -radixshowbase 0 /Pipeline_TestBench/CPU/ALU/data_1
add wave -noupdate -expand -group EX -label {Data 2} -radix decimal -radixshowbase 0 /Pipeline_TestBench/CPU/ALU/data_2
add wave -noupdate -expand -group EX -label {Data Out} -radix decimal -radixshowbase 0 /Pipeline_TestBench/CPU/ALU/data_o
add wave -noupdate -expand -group EX -label {Is Zero} -radix binary -radixshowbase 0 /Pipeline_TestBench/CPU/ALU/is_zero
add wave -noupdate -expand -group EX -expand -group HDU -label IFID_Rs -radix decimal -radixshowbase 0 /Pipeline_TestBench/CPU/HDU/IFID_Rs_i
add wave -noupdate -expand -group EX -expand -group HDU -label IFID_Rt -radix decimal -radixshowbase 0 /Pipeline_TestBench/CPU/HDU/IFID_Rt_i
add wave -noupdate -expand -group EX -expand -group HDU -label IDEX_Rt -radix decimal /Pipeline_TestBench/CPU/HDU/IDEX_Rt_i
add wave -noupdate -expand -group EX -expand -group HDU -label {IDEX_Mem CS} -radix binary /Pipeline_TestBench/CPU/HDU/IDEX_Mem_cs
add wave -noupdate -expand -group EX -expand -group HDU -label Stall -radix binary -radixshowbase 0 /Pipeline_TestBench/CPU/HDU/stall
add wave -noupdate -expand -group MEM -label Address -radix decimal -radixshowbase 0 /Pipeline_TestBench/CPU/DataMem/addr_i
add wave -noupdate -expand -group MEM -label CS -radix binary -radixshowbase 0 /Pipeline_TestBench/CPU/DataMem/cs
add wave -noupdate -expand -group MEM -label WE -radix binary -radixshowbase 0 /Pipeline_TestBench/CPU/DataMem/we
add wave -noupdate -expand -group MEM -label {Data In} -radix decimal -radixshowbase 0 /Pipeline_TestBench/CPU/DataMem/data_i
add wave -noupdate -expand -group MEM -label {Data Out} -radix decimal -radixshowbase 0 /Pipeline_TestBench/CPU/DataMem/data_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {449 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 278
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
WaveRestoreZoom {264 ps} {614 ps}
