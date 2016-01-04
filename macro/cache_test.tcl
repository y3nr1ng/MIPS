onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label Clock -radix binary -radixshowbase 0 /Cache_TestBench/ExtMem/clk
add wave -noupdate -label Start -radix binary /Cache_TestBench/CPU/start
add wave -noupdate -label Reset -radix binary -radixshowbase 0 /Cache_TestBench/CPU/rst
add wave -noupdate -divider CPU
add wave -noupdate -label {Instr Address} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/InstrMem/addr_i
add wave -noupdate -divider {External Memory}
add wave -noupdate -label Address -radix hexadecimal -radixshowbase 0 /Cache_TestBench/ExtMem/addr_i
add wave -noupdate -label {Data In} -radix decimal /Cache_TestBench/ExtMem/data_i
add wave -noupdate -label CS -radix binary -radixshowbase 0 /Cache_TestBench/ExtMem/cs
add wave -noupdate -label WE -radix binary -radixshowbase 0 /Cache_TestBench/ExtMem/we
add wave -noupdate -label ACK -radix binary -radixshowbase 0 /Cache_TestBench/ExtMem/ack
add wave -noupdate -label {Data Out} -radix decimal /Cache_TestBench/ExtMem/data_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1104 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 237
configure wave -valuecolwidth 91
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
WaveRestoreZoom {6864 ps} {7560 ps}
