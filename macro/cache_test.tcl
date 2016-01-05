onerror {resume}
quietly virtual signal -install /Cache_TestBench/CPU/L1Cache { /Cache_TestBench/CPU/L1Cache/p1_offset[4:2]} block_offset
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
add wave -noupdate -expand -group CPU -group {General Control} -label Op -radix binary -radixshowbase 0 /Cache_TestBench/CPU/Ctrl/op_i
add wave -noupdate -expand -group CPU -group {General Control} -label Func -radix binary -radixshowbase 0 /Cache_TestBench/CPU/Ctrl/func_i
add wave -noupdate -expand -group CPU -group {General Control} /Cache_TestBench/CPU/Ctrl/is_equal_i
add wave -noupdate -expand -group CPU -group {General Control} /Cache_TestBench/CPU/Ctrl/PC_ctrl_o
add wave -noupdate -expand -group CPU -group {General Control} /Cache_TestBench/CPU/Ctrl/EX_ctrl_o
add wave -noupdate -expand -group CPU -group {General Control} /Cache_TestBench/CPU/Ctrl/MEM_ctrl_o
add wave -noupdate -expand -group CPU -group {General Control} /Cache_TestBench/CPU/Ctrl/WB_ctrl_o
add wave -noupdate -expand -group CPU -group {IFID Latch} -radix binary /Cache_TestBench/CPU/IFID_Reg/flush
add wave -noupdate -expand -group CPU -group {IFID Latch} -radix binary /Cache_TestBench/CPU/IFID_Reg/stall
add wave -noupdate -expand -group CPU -group {IFID Latch} -radix decimal /Cache_TestBench/CPU/IFID_Reg/PC_Inc_i
add wave -noupdate -expand -group CPU -group {IFID Latch} -radix decimal /Cache_TestBench/CPU/IFID_Reg/PC_Inc_o
add wave -noupdate -expand -group CPU -group {IFID Latch} -radix hexadecimal /Cache_TestBench/CPU/IFID_Reg/InstrMem_i
add wave -noupdate -expand -group CPU -group {IFID Latch} -radix hexadecimal /Cache_TestBench/CPU/IFID_Reg/InstrMem_o
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label CS -radix binary /Cache_TestBench/CPU/L1Cache/p1_MemRead_i
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label WE -radix binary /Cache_TestBench/CPU/L1Cache/p1_MemWrite_i
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label cache_we -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/cache_we
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label Hit -radix binary /Cache_TestBench/CPU/L1Cache/hit
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label Require -radix binary /Cache_TestBench/CPU/L1Cache/p1_req
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -divider <NULL>
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label {FSM State} -radix unsigned -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/state
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label Stall -radix binary /Cache_TestBench/CPU/L1Cache/p1_stall_o
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -divider SRAM
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label cache_sram_enable -radix binary /Cache_TestBench/CPU/L1Cache/cache_sram_enable
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label sram_valid -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/sram_valid
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label sram_dirty -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/sram_dirty
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label cache_sram_write -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/cache_sram_write
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label sram_cache_data -radix hexadecimal /Cache_TestBench/CPU/L1Cache/sram_cache_data
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -divider {DRAM Output}
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label {Block Offset} -radix unsigned -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/block_offset
add wave -noupdate -group ROM -label Address -radix hexadecimal -radixshowbase 0 /Cache_TestBench/CPU/DataMem/addr_i
add wave -noupdate -group ROM -label CS -radix binary -radixshowbase 0 /Cache_TestBench/CPU/DataMem/cs
add wave -noupdate -group ROM -label WE -radix binary -radixshowbase 0 /Cache_TestBench/CPU/DataMem/we
add wave -noupdate -group ROM -label {Data In} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/DataMem/data_i
add wave -noupdate -group ROM -label {Data Out} -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/DataMem/data_o
add wave -noupdate -expand -group DRAM -label ACK /Cache_TestBench/Data_Memory/ack
add wave -noupdate -divider <NULL>
add wave -noupdate -label {HDU Stall} -radix binary /Cache_TestBench/CPU/HDU/stall
add wave -noupdate -radix hexadecimal /Cache_TestBench/CPU/L1Cache/p1_data_i
add wave -noupdate -radix hexadecimal /Cache_TestBench/CPU/L1Cache/p1_addr_i
add wave -noupdate -radix hexadecimal /Cache_TestBench/CPU/L1Cache/p1_data_o
add wave -noupdate -divider <NULL>
add wave -noupdate /Cache_TestBench/CPU/L1Cache/cache_sram_index
add wave -noupdate /Cache_TestBench/CPU/L1Cache/cache_sram_tag
add wave -noupdate /Cache_TestBench/CPU/L1Cache/cache_sram_data
add wave -noupdate /Cache_TestBench/CPU/L1Cache/sram_cache_tag
add wave -noupdate /Cache_TestBench/CPU/L1Cache/mem_enable
add wave -noupdate /Cache_TestBench/CPU/L1Cache/mem_write
add wave -noupdate /Cache_TestBench/CPU/L1Cache/cache_dirty
add wave -noupdate /Cache_TestBench/CPU/L1Cache/write_back
add wave -noupdate /Cache_TestBench/CPU/L1Cache/p1_index
add wave -noupdate /Cache_TestBench/CPU/L1Cache/p1_tag
add wave -noupdate /Cache_TestBench/CPU/L1Cache/r_hit_data
add wave -noupdate /Cache_TestBench/CPU/L1Cache/sram_tag
add wave -noupdate /Cache_TestBench/CPU/L1Cache/w_hit_data
add wave -noupdate /Cache_TestBench/CPU/L1Cache/write_hit
add wave -noupdate /Cache_TestBench/CPU/L1Cache/p1_data
add wave -noupdate /Cache_TestBench/Data_Memory/addr_i
add wave -noupdate /Cache_TestBench/Data_Memory/data_i
add wave -noupdate /Cache_TestBench/Data_Memory/enable_i
add wave -noupdate /Cache_TestBench/Data_Memory/write_i
add wave -noupdate /Cache_TestBench/Data_Memory/ack_o
add wave -noupdate /Cache_TestBench/Data_Memory/data_o
add wave -noupdate /Cache_TestBench/Data_Memory/count
add wave -noupdate /Cache_TestBench/Data_Memory/ok
add wave -noupdate /Cache_TestBench/Data_Memory/data
add wave -noupdate /Cache_TestBench/Data_Memory/addr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1608 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 329
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
WaveRestoreZoom {1405 ps} {1913 ps}
