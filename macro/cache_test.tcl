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
add wave -noupdate -label PC -radix decimal -childformat {{{/Cache_TestBench/CPU/PC/addr_o[31]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[30]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[29]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[28]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[27]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[26]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[25]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[24]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[23]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[22]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[21]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[20]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[19]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[18]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[17]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[16]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[15]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[14]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[13]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[12]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[11]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[10]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[9]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[8]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[7]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[6]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[5]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[4]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[3]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[2]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[1]} -radix decimal} {{/Cache_TestBench/CPU/PC/addr_o[0]} -radix decimal}} -subitemconfig {{/Cache_TestBench/CPU/PC/addr_o[31]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[30]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[29]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[28]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[27]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[26]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[25]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[24]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[23]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[22]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[21]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[20]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[19]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[18]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[17]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[16]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[15]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[14]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[13]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[12]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[11]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[10]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[9]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[8]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[7]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[6]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[5]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[4]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[3]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[2]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[1]} {-radix decimal} {/Cache_TestBench/CPU/PC/addr_o[0]} {-radix decimal}} /Cache_TestBench/CPU/PC/addr_o
add wave -noupdate -label {FSM State} /Cache_TestBench/CPU/L1Cache/state
add wave -noupdate -label p1_stall_o -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/p1_stall_o
add wave -noupdate -label p1_addr_i -radix hexadecimal /Cache_TestBench/CPU/L1Cache/p1_addr_i
add wave -noupdate -label p1_MemRead_i -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/p1_MemRead_i
add wave -noupdate -label p1_MemWrite_i -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/p1_MemWrite_i
add wave -noupdate -label hit -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/hit
add wave -noupdate -label cache_mem_cs -radix binary /Cache_TestBench/CPU/L1Cache/mem_enable_o
add wave -noupdate -label cache_mem_we -radix binary /Cache_TestBench/CPU/L1Cache/mem_write_o
add wave -noupdate -label cache_mem_data_i -radix hexadecimal /Cache_TestBench/CPU/L1Cache/mem_data_i
add wave -noupdate -label mem_data_o -radix decimal /Cache_TestBench/CPU/L1Cache/mem_data_o
add wave -noupdate -label mem_ack /Cache_TestBench/CPU/L1Cache/mem_ack_i
add wave -noupdate -label mem_addr -radix hexadecimal /Cache_TestBench/CPU/L1Cache/mem_addr_o
add wave -noupdate -label reg_cache_we /Cache_TestBench/CPU/L1Cache/cache_we
add wave -noupdate -label reg_mem_en /Cache_TestBench/CPU/L1Cache/mem_enable
add wave -noupdate -label reg_wb /Cache_TestBench/CPU/L1Cache/write_back
add wave -noupdate -label p1_data_i -radix hexadecimal /Cache_TestBench/CPU/L1Cache/p1_data_i
add wave -noupdate -label p1_data_o -radix decimal /Cache_TestBench/CPU/L1Cache/p1_data_o
add wave -noupdate -label sram_index /Cache_TestBench/CPU/L1Cache/cache_sram_index
add wave -noupdate -label sram_enable /Cache_TestBench/CPU/L1Cache/cache_sram_enable
add wave -noupdate -label sram_tag /Cache_TestBench/CPU/L1Cache/cache_sram_tag
add wave -noupdate -label cache_sram_data -radix hexadecimal /Cache_TestBench/CPU/L1Cache/cache_sram_data
add wave -noupdate -label sram_we /Cache_TestBench/CPU/L1Cache/cache_sram_write
add wave -noupdate -label sc_tag /Cache_TestBench/CPU/L1Cache/sram_cache_tag
add wave -noupdate -label sc_data /Cache_TestBench/CPU/L1Cache/sram_cache_data
add wave -noupdate -label sram_valid -radix binary /Cache_TestBench/CPU/L1Cache/sram_valid
add wave -noupdate -label sram_dirty -radix binary /Cache_TestBench/CPU/L1Cache/sram_dirty
add wave -noupdate -label Mem_Rd /Cache_TestBench/CPU/L1Cache/mem_write
add wave -noupdate -label cache_dirty /Cache_TestBench/CPU/L1Cache/cache_dirty
add wave -noupdate -label p1_offset /Cache_TestBench/CPU/L1Cache/p1_offset
add wave -noupdate -label p1_index /Cache_TestBench/CPU/L1Cache/p1_index
add wave -noupdate -label p1_tag /Cache_TestBench/CPU/L1Cache/p1_tag
add wave -noupdate -label r_hit_data /Cache_TestBench/CPU/L1Cache/r_hit_data
add wave -noupdate -label sram_tag /Cache_TestBench/CPU/L1Cache/sram_tag
add wave -noupdate -label w_hit_data /Cache_TestBench/CPU/L1Cache/w_hit_data
add wave -noupdate -label write_hit /Cache_TestBench/CPU/L1Cache/write_hit
add wave -noupdate -label require /Cache_TestBench/CPU/L1Cache/p1_req
add wave -noupdate -label p1_data /Cache_TestBench/CPU/L1Cache/p1_data
add wave -noupdate -label pc_clk /Cache_TestBench/CPU/PC/clk
add wave -noupdate -label pc_rst /Cache_TestBench/CPU/PC/rst
add wave -noupdate -label pc_addi /Cache_TestBench/CPU/PC/addr_i
add wave -noupdate -label pc_addo /Cache_TestBench/CPU/PC/addr_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4884 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 304
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
WaveRestoreZoom {4775 ps} {5598 ps}
