onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Timing
add wave -noupdate -label Start /TestBench/CPU/PC/start
add wave -noupdate -label Reset /TestBench/CPU/PC/rst
add wave -noupdate -label Clock /TestBench/CPU/PC/clk
add wave -noupdate -divider {Program Counter}
add wave -noupdate -label {Current Address} -radix hexadecimal -radixshowbase 0 /TestBench/CPU/PC/addr_o
add wave -noupdate -label {Write Enable} /TestBench/CPU/PC/we
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 331
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
WaveRestoreZoom {44317 ps} {45115 ps}
