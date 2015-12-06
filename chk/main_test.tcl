onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Timing
add wave -noupdate -label Start /TestBench/CPU/PC/start
add wave -noupdate -label Reset /TestBench/CPU/PC/rst
add wave -noupdate -label Clock /TestBench/CPU/PC/clk
add wave -noupdate -expand -group IF -label {Current Address} -radix unsigned -radixshowbase 0 /TestBench/CPU/PC/addr_o
add wave -noupdate -expand -group IF -label {Write Enable} /TestBench/CPU/PC/we
add wave -noupdate -expand -group ID -label Instruction /TestBench/CPU/instr
add wave -noupdate -expand -group ID -expand -group {Parsed Instruction} -label {Rs Address} -radix unsigned -radixshowbase 0 /TestBench/CPU/RegFiles/Rs_addr
add wave -noupdate -expand -group ID -expand -group {Parsed Instruction} -label {Rt Address} -radix unsigned -radixshowbase 0 /TestBench/CPU/RegFiles/Rt_addr
add wave -noupdate -expand -group ID -expand -group {Parsed Instruction} -label {I-type Immediate} -radix decimal /TestBench/CPU/SignExt/data_i
add wave -noupdate -expand -group ID -label {R[Rs] == R[Rt]?} /TestBench/CPU/Rs_eq_Rt/is_equal
add wave -noupdate -expand -group ID -label {Branch Target Address} -radix decimal /TestBench/CPU/PC_Mux/data_4
add wave -noupdate -expand -group ID -label {Jump Target Address} -radix decimal -radixshowbase 0 /TestBench/CPU/PC_Mux/data_3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {720 ps} 0}
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
WaveRestoreZoom {257 ps} {1039 ps}
