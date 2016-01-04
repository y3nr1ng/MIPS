onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Timing
add wave -noupdate -label Clock /Memory_TestBench/mem_dut/clk
add wave -noupdate -divider Input
add wave -noupdate -label Address -radix hexadecimal -radixshowbase 0 /Memory_TestBench/mem_dut/addr_i
add wave -noupdate -label CS /Memory_TestBench/mem_dut/cs
add wave -noupdate -label WE /Memory_TestBench/mem_dut/we
add wave -noupdate -label {Data In} -radix decimal -radixshowbase 0 /Memory_TestBench/mem_dut/data_i
add wave -noupdate -divider Output
add wave -noupdate -label {Data Out} -radix decimal -radixshowbase 0 /Memory_TestBench/mem_dut/data_o
add wave -noupdate -label ACK /Memory_TestBench/mem_dut/ack
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {80 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 262
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
WaveRestoreZoom {889 ps} {1 ns}
