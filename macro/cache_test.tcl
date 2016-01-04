onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label Clock -radix binary -radixshowbase 0 /Cache_TestBench/CPU/clk
add wave -noupdate -label Reset -radix binary -radixshowbase 0 /Cache_TestBench/CPU/rst
add wave -noupdate -label Start -radix binary -radixshowbase 0 /Cache_TestBench/CPU/start
add wave -noupdate -divider <NULL>
add wave -noupdate -group ROM -label Address -radix hexadecimal -radixshowbase 0 /Cache_TestBench/CPU/DataMem/addr_i
add wave -noupdate -group ROM -label CS -radix binary -radixshowbase 0 /Cache_TestBench/CPU/DataMem/cs
add wave -noupdate -group ROM -label WE -radix binary -radixshowbase 0 /Cache_TestBench/CPU/DataMem/we
add wave -noupdate -group ROM -label {Data In} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/DataMem/data_i
add wave -noupdate -group ROM -label {Data Out} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/DataMem/data_o
add wave -noupdate -divider <NULL>
add wave -noupdate -label PC -radix decimal /Cache_TestBench/CPU/PC/addr_o
add wave -noupdate -label {FSM State} /Cache_TestBench/CPU/L1Cache/state
add wave -noupdate -label p1_stall_o -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/p1_stall_o
add wave -noupdate -label p1_addr_i -radix hexadecimal /Cache_TestBench/CPU/L1Cache/p1_addr_i
add wave -noupdate -label p1_MemRead_i -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/p1_MemRead_i
add wave -noupdate -label p1_MemWrite_i -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/p1_MemWrite_i
add wave -noupdate -label hit -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/hit
add wave -noupdate -radix binary /Cache_TestBench/CPU/L1Cache/mem_enable_o
add wave -noupdate -radix binary /Cache_TestBench/CPU/L1Cache/mem_write_o
add wave -noupdate -radix hexadecimal /Cache_TestBench/CPU/L1Cache/mem_data_i
add wave -noupdate -radix decimal /Cache_TestBench/CPU/L1Cache/mem_data_o
add wave -noupdate /Cache_TestBench/CPU/L1Cache/mem_ack_i
add wave -noupdate -radix hexadecimal /Cache_TestBench/CPU/L1Cache/mem_addr_o
add wave -noupdate /Cache_TestBench/CPU/L1Cache/cache_we
add wave -noupdate /Cache_TestBench/CPU/L1Cache/mem_enable
add wave -noupdate -radix hexadecimal /Cache_TestBench/CPU/L1Cache/p1_data_i
add wave -noupdate -radix decimal /Cache_TestBench/CPU/L1Cache/p1_data_o
add wave -noupdate /Cache_TestBench/CPU/L1Cache/cache_sram_index
add wave -noupdate /Cache_TestBench/CPU/L1Cache/cache_sram_enable
add wave -noupdate /Cache_TestBench/CPU/L1Cache/cache_sram_tag
add wave -noupdate /Cache_TestBench/CPU/L1Cache/cache_sram_data
add wave -noupdate /Cache_TestBench/CPU/L1Cache/cache_sram_write
add wave -noupdate /Cache_TestBench/CPU/L1Cache/sram_cache_tag
add wave -noupdate /Cache_TestBench/CPU/L1Cache/sram_cache_data
add wave -noupdate -radix binary /Cache_TestBench/CPU/L1Cache/sram_valid
add wave -noupdate -radix binary /Cache_TestBench/CPU/L1Cache/sram_dirty
add wave -noupdate /Cache_TestBench/CPU/L1Cache/mem_write
add wave -noupdate /Cache_TestBench/CPU/L1Cache/cache_dirty
add wave -noupdate /Cache_TestBench/CPU/L1Cache/write_back
add wave -noupdate /Cache_TestBench/CPU/L1Cache/p1_offset
add wave -noupdate /Cache_TestBench/CPU/L1Cache/p1_index
add wave -noupdate /Cache_TestBench/CPU/L1Cache/p1_tag
add wave -noupdate /Cache_TestBench/CPU/L1Cache/r_hit_data
add wave -noupdate /Cache_TestBench/CPU/L1Cache/sram_tag
add wave -noupdate /Cache_TestBench/CPU/L1Cache/w_hit_data
add wave -noupdate /Cache_TestBench/CPU/L1Cache/write_hit
add wave -noupdate /Cache_TestBench/CPU/L1Cache/p1_req
add wave -noupdate /Cache_TestBench/CPU/L1Cache/p1_data
add wave -noupdate /Cache_TestBench/CPU/PC/clk
add wave -noupdate /Cache_TestBench/CPU/PC/rst
add wave -noupdate /Cache_TestBench/CPU/PC/start
add wave -noupdate /Cache_TestBench/CPU/PC/addr_i
add wave -noupdate /Cache_TestBench/CPU/PC/addr_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3466 ps} 0}
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
WaveRestoreZoom {3410 ps} {4202 ps}
