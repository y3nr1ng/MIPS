onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label Clock -radix binary -radixshowbase 0 /Cache_TestBench/CPU/clk
add wave -noupdate -label Reset -radix binary -radixshowbase 0 /Cache_TestBench/CPU/rst
add wave -noupdate -label Start -radix binary -radixshowbase 0 /Cache_TestBench/CPU/start
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group ROM -label Address -radix hexadecimal -radixshowbase 0 /Cache_TestBench/CPU/DataMem/addr_i
add wave -noupdate -expand -group ROM -label CS -radix binary -radixshowbase 0 /Cache_TestBench/CPU/DataMem/cs
add wave -noupdate -expand -group ROM -label WE -radix binary -radixshowbase 0 /Cache_TestBench/CPU/DataMem/we
add wave -noupdate -expand -group ROM -label {Data In} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/DataMem/data_i
add wave -noupdate -expand -group ROM -label {Data Out} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/DataMem/data_o
add wave -noupdate -expand -group {L1 Cache} -label Address -radix hexadecimal -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/cache_addr
add wave -noupdate -expand -group {L1 Cache} -label CS -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/cache_cs
add wave -noupdate -expand -group {L1 Cache} -label WE -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/cache_we
add wave -noupdate -expand -group {L1 Cache} -label ACK -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/cache_ack
add wave -noupdate -expand -group {L1 Cache} -label {Data In} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/cache_data_i
add wave -noupdate -expand -group {L1 Cache} -label {Data Out} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/cache_data_o
add wave -noupdate -expand -group {L1 Cache} -label {Decoder Output} -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/decoder/out
add wave -noupdate -expand -group {L1 Cache} -expand -group SRAM -label {Data Out} -radix decimal /Cache_TestBench/CPU/L1Cache/data_storage/data_o
add wave -noupdate -expand -group {L1 Cache} -expand -group {Cache Controller} -label Hit /Cache_TestBench/CPU/L1Cache/controller/cache_hit
add wave -noupdate -expand -group {L1 Cache} -expand -group {Cache Controller} -label Valid /Cache_TestBench/CPU/L1Cache/controller/cache_valid
add wave -noupdate -expand -group {L1 Cache} -expand -group {Cache Controller} -label {CS (reg)} -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/controller/r_cache_cs
add wave -noupdate -expand -group {L1 Cache} -expand -group {Cache Controller} -label {WE (reg)} -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/controller/r_cache_we
add wave -noupdate -expand -group {L1 Cache} -expand -group {Cache Controller} -label {FSM State} -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/controller/state
add wave -noupdate -expand -group {L1 Cache} -expand -group {Cache Controller} -label {Next State} -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/controller/next_state
add wave -noupdate -expand -group {External Memory} -label Address -radix hexadecimal -radixshowbase 0 /Cache_TestBench/ExtMem/addr_i
add wave -noupdate -expand -group {External Memory} -label CS -radix binary -radixshowbase 0 /Cache_TestBench/ExtMem/cs
add wave -noupdate -expand -group {External Memory} -label WE -radix binary -radixshowbase 0 /Cache_TestBench/ExtMem/we
add wave -noupdate -expand -group {External Memory} -label ACK -radix binary -radixshowbase 0 /Cache_TestBench/ExtMem/ack
add wave -noupdate -expand -group {External Memory} -label {Data In} -radix decimal -radixshowbase 0 /Cache_TestBench/ExtMem/data_i
add wave -noupdate -expand -group {External Memory} -label {Data Out} -radix decimal -radixshowbase 0 /Cache_TestBench/ExtMem/data_o
add wave -noupdate /Cache_TestBench/CPU/L1Cache/write_data_b1/data_1
add wave -noupdate /Cache_TestBench/CPU/L1Cache/write_data_b1/data_2
add wave -noupdate /Cache_TestBench/CPU/L1Cache/write_data_b1/data_3
add wave -noupdate /Cache_TestBench/CPU/L1Cache/write_data_b1/data_4
add wave -noupdate /Cache_TestBench/CPU/L1Cache/write_data_b1/sel
add wave -noupdate /Cache_TestBench/CPU/L1Cache/write_data_b1/data_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {198 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 320
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
WaveRestoreZoom {4254 ps} {5040 ps}
