onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label Clock -radix binary -radixshowbase 0 /Cache_TestBench/CPU/clk
add wave -noupdate -label Reset -radix binary -radixshowbase 0 /Cache_TestBench/CPU/rst
add wave -noupdate -label Start -radix binary -radixshowbase 0 /Cache_TestBench/CPU/start
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group CPU -group {Program Counter} -divider {PC Multiplexer}
add wave -noupdate -expand -group CPU -group {Program Counter} -radix decimal /Cache_TestBench/CPU/PC_Mux/data_1
add wave -noupdate -expand -group CPU -group {Program Counter} -radix decimal /Cache_TestBench/CPU/PC_Mux/data_2
add wave -noupdate -expand -group CPU -group {Program Counter} -radix decimal /Cache_TestBench/CPU/PC_Mux/data_3
add wave -noupdate -expand -group CPU -group {Program Counter} -radix decimal /Cache_TestBench/CPU/PC_Mux/data_4
add wave -noupdate -expand -group CPU -group {Program Counter} /Cache_TestBench/CPU/PC_Mux/sel
add wave -noupdate -expand -group CPU -group {Program Counter} -radix decimal /Cache_TestBench/CPU/PC_Mux/data_o
add wave -noupdate -expand -group CPU -group {Program Counter} -divider {Program Counter}
add wave -noupdate -expand -group CPU -group {Program Counter} -label WE -radix binary -radixshowbase 0 /Cache_TestBench/CPU/PC/we
add wave -noupdate -expand -group CPU -group {Program Counter} -radix decimal /Cache_TestBench/CPU/PC/addr_i
add wave -noupdate -expand -group CPU -group {Program Counter} -radix decimal /Cache_TestBench/CPU/PC/addr_o
add wave -noupdate -expand -group CPU -group {Program Counter} -divider {PC Adder}
add wave -noupdate -expand -group CPU -group {Program Counter} -radix decimal /Cache_TestBench/CPU/PC_Inc/data_1
add wave -noupdate -expand -group CPU -group {Program Counter} -radix decimal /Cache_TestBench/CPU/PC_Inc/data_2
add wave -noupdate -expand -group CPU -group {Program Counter} -radix decimal /Cache_TestBench/CPU/PC_Inc/data_o
add wave -noupdate -expand -group CPU -expand -group {Instruction Memory} -label CS -radix binary -radixshowbase 0 /Cache_TestBench/CPU/InstrMem/cs
add wave -noupdate -expand -group CPU -expand -group {Instruction Memory} -label WE -radix binary -radixshowbase 0 /Cache_TestBench/CPU/InstrMem/we
add wave -noupdate -expand -group CPU -expand -group {Instruction Memory} -label {Data In} -radix hexadecimal -radixshowbase 0 /Cache_TestBench/CPU/InstrMem/data_i
add wave -noupdate -expand -group CPU -expand -group {Instruction Memory} -label {Data Out} -radix hexadecimal -radixshowbase 0 /Cache_TestBench/CPU/InstrMem/data_o
add wave -noupdate -expand -group CPU -expand -group {IFID Latch} -label Clock -radix binary -radixshowbase 0 /Cache_TestBench/CPU/IFID_Instr/clk
add wave -noupdate -expand -group CPU -expand -group {IFID Latch} -label Reset -radix binary -radixshowbase 0 /Cache_TestBench/CPU/IFID_Instr/rst
add wave -noupdate -expand -group CPU -expand -group {IFID Latch} -label EN -radix binary -radixshowbase 0 /Cache_TestBench/CPU/IFID_Instr/en
add wave -noupdate -expand -group CPU -expand -group {IFID Latch} -label {Data In} -radix hexadecimal -radixshowbase 0 /Cache_TestBench/CPU/IFID_Instr/data_i
add wave -noupdate -expand -group CPU -expand -group {IFID Latch} -label {Data Out} -radix hexadecimal -radixshowbase 0 /Cache_TestBench/CPU/IFID_Instr/data_o
add wave -noupdate -group ROM -label Address -radix hexadecimal -radixshowbase 0 /Cache_TestBench/CPU/DataMem/addr_i
add wave -noupdate -group ROM -label CS -radix binary -radixshowbase 0 /Cache_TestBench/CPU/DataMem/cs
add wave -noupdate -group ROM -label WE -radix binary -radixshowbase 0 /Cache_TestBench/CPU/DataMem/we
add wave -noupdate -group ROM -label {Data In} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/DataMem/data_i
add wave -noupdate -group ROM -label {Data Out} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/DataMem/data_o
add wave -noupdate -divider <NULL>
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {37 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 292
configure wave -valuecolwidth 100
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {270 ps}
