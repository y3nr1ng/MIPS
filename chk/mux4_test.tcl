onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label Clock /Latch_TestBench/d_ff/clk
add wave -noupdate -divider Control
add wave -noupdate -label Enable /Latch_TestBench/d_ff/en
add wave -noupdate -label Reset /Latch_TestBench/d_ff/rst
add wave -noupdate -divider Data
add wave -noupdate -label Input -radix decimal -radixshowbase 0 /Latch_TestBench/d_ff/data_i
add wave -noupdate -label Output -radix decimal -radixshowbase 0 /Latch_TestBench/d_ff/data_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {28 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 215
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {116 ns}
