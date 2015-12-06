onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Timing
add wave -noupdate -label Start /TestBench/CPU/PC/start
add wave -noupdate -label Reset /TestBench/CPU/PC/rst
add wave -noupdate -label Clock /TestBench/CPU/PC/clk
add wave -noupdate -divider {Program Counter}
add wave -noupdate -label {Current Address} -radix decimal -radixshowbase 0 /TestBench/CPU/PC/addr_o
add wave -noupdate -label {Write Enable} /TestBench/CPU/PC/we
add wave -noupdate -divider Instruction
add wave -noupdate -label Instruction -radix binary -childformat {{{/TestBench/CPU/InstrMem/data_o[31]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[30]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[29]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[28]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[27]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[26]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[25]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[24]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[23]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[22]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[21]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[20]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[19]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[18]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[17]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[16]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[15]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[14]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[13]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[12]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[11]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[10]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[9]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[8]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[7]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[6]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[5]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[4]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[3]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[2]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[1]} -radix binary} {{/TestBench/CPU/InstrMem/data_o[0]} -radix binary}} -radixshowbase 0 -subitemconfig {{/TestBench/CPU/InstrMem/data_o[31]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[30]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[29]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[28]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[27]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[26]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[25]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[24]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[23]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[22]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[21]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[20]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[19]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[18]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[17]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[16]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[15]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[14]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[13]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[12]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[11]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[10]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[9]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[8]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[7]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[6]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[5]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[4]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[3]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[2]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[1]} {-height 15 -radix binary -radixshowbase 0} {/TestBench/CPU/InstrMem/data_o[0]} {-height 15 -radix binary -radixshowbase 0}} /TestBench/CPU/InstrMem/data_o
add wave -noupdate -expand -group {Parsed Instruction} -label {Rs Address} -radix decimal -radixshowbase 0 /TestBench/CPU/RegFiles/Rs_addr
add wave -noupdate -expand -group {Parsed Instruction} -label {Rt Address} -radix decimal -radixshowbase 0 /TestBench/CPU/RegFiles/Rt_addr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {147 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 243
configure wave -valuecolwidth 202
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
WaveRestoreZoom {0 ps} {782 ps}
