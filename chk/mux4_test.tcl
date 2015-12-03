onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label Select -radix binary -radixshowbase 0 /FourWayMux_TestBench/u_mux_case/sel_i
add wave -noupdate -divider Input
add wave -noupdate -label Data1 -radix decimal -radixshowbase 0 /FourWayMux_TestBench/u_mux_case/data_1
add wave -noupdate -label Data2 -radix decimal -radixshowbase 0 /FourWayMux_TestBench/u_mux_case/data_2
add wave -noupdate -label Data3 -radix decimal -radixshowbase 0 /FourWayMux_TestBench/u_mux_case/data_3
add wave -noupdate -label Data4 -radix decimal -radixshowbase 0 /FourWayMux_TestBench/u_mux_case/data_4
add wave -noupdate -divider Output
add wave -noupdate -label {Data Out} -radix decimal -radixshowbase 0 /FourWayMux_TestBench/u_mux_case/data_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 134
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
WaveRestoreZoom {0 ns} {58 ns}
