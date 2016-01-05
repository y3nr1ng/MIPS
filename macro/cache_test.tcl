onerror {resume}
quietly virtual signal -install /Cache_TestBench/CPU/L1Cache { /Cache_TestBench/CPU/L1Cache/p1_offset[4:2]} block_offset
quietly WaveActivateNextPane {} 0
add wave -noupdate -label Clock -radix binary -radixshowbase 0 /Cache_TestBench/CPU/clk
add wave -noupdate -label Reset -radix binary -radixshowbase 0 /Cache_TestBench/CPU/rst
add wave -noupdate -label Start -radix binary -radixshowbase 0 /Cache_TestBench/CPU/start
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group CPU -expand -group {Program Counter} -divider {PC Multiplexer}
add wave -noupdate -expand -group CPU -expand -group {Program Counter} -radix decimal /Cache_TestBench/CPU/PC_Mux/data_1
add wave -noupdate -expand -group CPU -expand -group {Program Counter} -radix decimal /Cache_TestBench/CPU/PC_Mux/data_2
add wave -noupdate -expand -group CPU -expand -group {Program Counter} -radix decimal /Cache_TestBench/CPU/PC_Mux/data_3
add wave -noupdate -expand -group CPU -expand -group {Program Counter} -radix decimal /Cache_TestBench/CPU/PC_Mux/data_4
add wave -noupdate -expand -group CPU -expand -group {Program Counter} /Cache_TestBench/CPU/PC_Mux/sel
add wave -noupdate -expand -group CPU -expand -group {Program Counter} -radix decimal /Cache_TestBench/CPU/PC_Mux/data_o
add wave -noupdate -expand -group CPU -expand -group {Program Counter} -divider {Program Counter}
add wave -noupdate -expand -group CPU -expand -group {Program Counter} -label {HDU Stall} -radix binary -radixshowbase 0 /Cache_TestBench/CPU/HDU/stall
add wave -noupdate -expand -group CPU -expand -group {Program Counter} -label {L1 Cache Stall} -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/p1_stall_o
add wave -noupdate -expand -group CPU -expand -group {Program Counter} -label Reset -radix binary -radixshowbase 0 /Cache_TestBench/CPU/PC/rst
add wave -noupdate -expand -group CPU -expand -group {Program Counter} -label Start -radix binary /Cache_TestBench/CPU/PC/start
add wave -noupdate -expand -group CPU -expand -group {Program Counter} -label WE -radix binary -radixshowbase 0 /Cache_TestBench/CPU/PC/we
add wave -noupdate -expand -group CPU -expand -group {Program Counter} -label Stall -radix binary -radixshowbase 0 /Cache_TestBench/CPU/PC/stall
add wave -noupdate -expand -group CPU -expand -group {Program Counter} -label {Address In} -radix decimal /Cache_TestBench/CPU/PC/addr_i
add wave -noupdate -expand -group CPU -expand -group {Program Counter} -label {Address Out} -radix decimal /Cache_TestBench/CPU/PC/addr_o
add wave -noupdate -expand -group CPU -expand -group {Program Counter} -divider {PC Adder}
add wave -noupdate -expand -group CPU -expand -group {Program Counter} -radix decimal /Cache_TestBench/CPU/PC_Inc/data_1
add wave -noupdate -expand -group CPU -expand -group {Program Counter} -radix decimal /Cache_TestBench/CPU/PC_Inc/data_2
add wave -noupdate -expand -group CPU -expand -group {Program Counter} -radix decimal /Cache_TestBench/CPU/PC_Inc/data_o
add wave -noupdate -expand -group CPU -expand -group {Instruction Memory} -label Address -radix hexadecimal -radixshowbase 0 /Cache_TestBench/CPU/InstrMem/addr_i
add wave -noupdate -expand -group CPU -expand -group {Instruction Memory} -label CS -radix binary -radixshowbase 0 /Cache_TestBench/CPU/InstrMem/cs
add wave -noupdate -expand -group CPU -expand -group {Instruction Memory} -label WE -radix binary -radixshowbase 0 /Cache_TestBench/CPU/InstrMem/we
add wave -noupdate -expand -group CPU -expand -group {Instruction Memory} -label {Data Out} -radix hexadecimal -childformat {{{/Cache_TestBench/CPU/InstrMem/data_o[31]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[30]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[29]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[28]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[27]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[26]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[25]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[24]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[23]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[22]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[21]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[20]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[19]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[18]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[17]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[16]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[15]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[14]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[13]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[12]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[11]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[10]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[9]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[8]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[7]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[6]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[5]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[4]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[3]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[2]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[1]} -radix hexadecimal} {{/Cache_TestBench/CPU/InstrMem/data_o[0]} -radix hexadecimal}} -radixshowbase 0 -subitemconfig {{/Cache_TestBench/CPU/InstrMem/data_o[31]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[30]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[29]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[28]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[27]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[26]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[25]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[24]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[23]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[22]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[21]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[20]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[19]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[18]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[17]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[16]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[15]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[14]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[13]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[12]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[11]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[10]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[9]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[8]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[7]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[6]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[5]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[4]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[3]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[2]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[1]} {-height 15 -radix hexadecimal -radixshowbase 0} {/Cache_TestBench/CPU/InstrMem/data_o[0]} {-height 15 -radix hexadecimal -radixshowbase 0}} /Cache_TestBench/CPU/InstrMem/data_o
add wave -noupdate -expand -group CPU -expand -group {Instruction Memory} -divider {Post Pipeline Register}
add wave -noupdate -expand -group CPU -expand -group {Instruction Memory} -label Rs -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/instr_rs
add wave -noupdate -expand -group CPU -expand -group {Instruction Memory} -label Rt -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/instr_rt
add wave -noupdate -expand -group CPU -expand -group {Instruction Memory} -label Rd -radix decimal -radixshowbase 0 /Cache_TestBench/CPU/instr_rd
add wave -noupdate -expand -group CPU -expand -group {Instruction Memory} -label Immediate -radix hexadecimal /Cache_TestBench/CPU/instr_imm
add wave -noupdate -expand -group CPU -expand -group {General Control} -label Op -radix binary -radixshowbase 0 /Cache_TestBench/CPU/Ctrl/op_i
add wave -noupdate -expand -group CPU -expand -group {General Control} -label Func -radix binary -radixshowbase 0 /Cache_TestBench/CPU/Ctrl/func_i
add wave -noupdate -expand -group CPU -expand -group {General Control} /Cache_TestBench/CPU/Ctrl/is_equal_i
add wave -noupdate -expand -group CPU -expand -group {General Control} /Cache_TestBench/CPU/Ctrl/PC_ctrl_o
add wave -noupdate -expand -group CPU -expand -group {General Control} /Cache_TestBench/CPU/Ctrl/EX_ctrl_o
add wave -noupdate -expand -group CPU -expand -group {General Control} /Cache_TestBench/CPU/Ctrl/MEM_ctrl_o
add wave -noupdate -expand -group CPU -expand -group {General Control} /Cache_TestBench/CPU/Ctrl/WB_ctrl_o
add wave -noupdate -expand -group CPU -expand -group {IFID Latch} -radix binary /Cache_TestBench/CPU/IFID_Reg/flush
add wave -noupdate -expand -group CPU -expand -group {IFID Latch} -radix binary /Cache_TestBench/CPU/IFID_Reg/stall
add wave -noupdate -expand -group CPU -expand -group {IFID Latch} -radix decimal /Cache_TestBench/CPU/IFID_Reg/PC_Inc_i
add wave -noupdate -expand -group CPU -expand -group {IFID Latch} -radix decimal /Cache_TestBench/CPU/IFID_Reg/PC_Inc_o
add wave -noupdate -expand -group CPU -expand -group {IFID Latch} -radix hexadecimal /Cache_TestBench/CPU/IFID_Reg/InstrMem_i
add wave -noupdate -expand -group CPU -expand -group {IFID Latch} -radix hexadecimal /Cache_TestBench/CPU/IFID_Reg/InstrMem_o
add wave -noupdate -expand -group CPU -group Data_2_mux -radix hexadecimal /Cache_TestBench/CPU/Data_2_Mux/data_1
add wave -noupdate -expand -group CPU -group Data_2_mux -radix hexadecimal /Cache_TestBench/CPU/Data_2_Mux/data_2
add wave -noupdate -expand -group CPU -group Data_2_mux -radix hexadecimal /Cache_TestBench/CPU/Data_2_Mux/data_3
add wave -noupdate -expand -group CPU -group Data_2_mux -radix hexadecimal /Cache_TestBench/CPU/Data_2_Mux/data_4
add wave -noupdate -expand -group CPU -group Data_2_mux -radix unsigned /Cache_TestBench/CPU/Data_2_Mux/sel
add wave -noupdate -expand -group CPU -group Data_2_mux -radix hexadecimal /Cache_TestBench/CPU/Data_2_Mux/data_o
add wave -noupdate -expand -group CPU -expand -group {IDEX Latch} -label Flush -radix binary -radixshowbase 0 /Cache_TestBench/CPU/IDEX_Reg/flush
add wave -noupdate -expand -group CPU -expand -group {IDEX Latch} -label Stall -radix binary -radixshowbase 0 /Cache_TestBench/CPU/IDEX_Reg/stall
add wave -noupdate -expand -group CPU -expand -group {IDEX Latch} /Cache_TestBench/CPU/IDEX_Reg/EX_ctrl_i
add wave -noupdate -expand -group CPU -expand -group {IDEX Latch} /Cache_TestBench/CPU/IDEX_Reg/EX_ctrl_o
add wave -noupdate -expand -group CPU -expand -group {IDEX Latch} /Cache_TestBench/CPU/IDEX_Reg/MEM_ctrl_i
add wave -noupdate -expand -group CPU -expand -group {IDEX Latch} /Cache_TestBench/CPU/IDEX_Reg/MEM_ctrl_o
add wave -noupdate -expand -group CPU -expand -group {IDEX Latch} /Cache_TestBench/CPU/IDEX_Reg/WB_ctrl_i
add wave -noupdate -expand -group CPU -expand -group {IDEX Latch} /Cache_TestBench/CPU/IDEX_Reg/WB_ctrl_o
add wave -noupdate -expand -group CPU -expand -group {IDEX Latch} -radix hexadecimal /Cache_TestBench/CPU/IDEX_Reg/Rs_data_i
add wave -noupdate -expand -group CPU -expand -group {IDEX Latch} -radix hexadecimal /Cache_TestBench/CPU/IDEX_Reg/Rs_data_o
add wave -noupdate -expand -group CPU -expand -group {IDEX Latch} -radix hexadecimal /Cache_TestBench/CPU/IDEX_Reg/Rt_data_i
add wave -noupdate -expand -group CPU -expand -group {IDEX Latch} -radix hexadecimal /Cache_TestBench/CPU/IDEX_Reg/Rt_data_o
add wave -noupdate -expand -group CPU -expand -group {IDEX Latch} -radix hexadecimal /Cache_TestBench/CPU/IDEX_Reg/imm_data_i
add wave -noupdate -expand -group CPU -expand -group {IDEX Latch} -radix hexadecimal /Cache_TestBench/CPU/IDEX_Reg/imm_data_o
add wave -noupdate -expand -group CPU -expand -group {IDEX Latch} -radix hexadecimal /Cache_TestBench/CPU/IDEX_Reg/Rs_i
add wave -noupdate -expand -group CPU -expand -group {IDEX Latch} -radix hexadecimal /Cache_TestBench/CPU/IDEX_Reg/Rs_o
add wave -noupdate -expand -group CPU -expand -group {IDEX Latch} -radix hexadecimal /Cache_TestBench/CPU/IDEX_Reg/Rt_i
add wave -noupdate -expand -group CPU -expand -group {IDEX Latch} -radix hexadecimal /Cache_TestBench/CPU/IDEX_Reg/Rt_o
add wave -noupdate -expand -group CPU -expand -group {IDEX Latch} -radix hexadecimal /Cache_TestBench/CPU/IDEX_Reg/Rd_i
add wave -noupdate -expand -group CPU -expand -group {IDEX Latch} -radix hexadecimal /Cache_TestBench/CPU/IDEX_Reg/Rd_o
add wave -noupdate -expand -group CPU -group {EXMEM Latch} -label Flush -radix binary -radixshowbase 0 /Cache_TestBench/CPU/EXMEM_Reg/flush
add wave -noupdate -expand -group CPU -group {EXMEM Latch} -label Stall -radix binary -radixshowbase 0 /Cache_TestBench/CPU/EXMEM_Reg/stall
add wave -noupdate -expand -group CPU -group {EXMEM Latch} /Cache_TestBench/CPU/EXMEM_Reg/MEM_ctrl_i
add wave -noupdate -expand -group CPU -group {EXMEM Latch} /Cache_TestBench/CPU/EXMEM_Reg/MEM_ctrl_o
add wave -noupdate -expand -group CPU -group {EXMEM Latch} /Cache_TestBench/CPU/EXMEM_Reg/WB_ctrl_i
add wave -noupdate -expand -group CPU -group {EXMEM Latch} /Cache_TestBench/CPU/EXMEM_Reg/WB_ctrl_o
add wave -noupdate -expand -group CPU -group {EXMEM Latch} -radix hexadecimal /Cache_TestBench/CPU/EXMEM_Reg/ALU_output_i
add wave -noupdate -expand -group CPU -group {EXMEM Latch} -radix hexadecimal /Cache_TestBench/CPU/EXMEM_Reg/ALU_output_o
add wave -noupdate -expand -group CPU -group {EXMEM Latch} -radix hexadecimal /Cache_TestBench/CPU/EXMEM_Reg/ALU_data_2_i
add wave -noupdate -expand -group CPU -group {EXMEM Latch} -radix hexadecimal /Cache_TestBench/CPU/EXMEM_Reg/ALU_data_2_o
add wave -noupdate -expand -group CPU -group {EXMEM Latch} -radix decimal /Cache_TestBench/CPU/EXMEM_Reg/RegFwd_i
add wave -noupdate -expand -group CPU -group {EXMEM Latch} -radix decimal /Cache_TestBench/CPU/EXMEM_Reg/RegFwd_o
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label Address -radix hexadecimal /Cache_TestBench/CPU/L1Cache/p1_addr_i
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label {Data In} -radix hexadecimal /Cache_TestBench/CPU/L1Cache/p1_data_i
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label CS -radix binary /Cache_TestBench/CPU/L1Cache/p1_MemRead_i
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label WE -radix binary /Cache_TestBench/CPU/L1Cache/p1_MemWrite_i
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label cache_we -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/cache_we
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label Hit -radix binary /Cache_TestBench/CPU/L1Cache/hit
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label Require -radix binary /Cache_TestBench/CPU/L1Cache/p1_req
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -divider {Internal Buses}
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label {FSM State} -radix unsigned -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/state
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label Stall -radix binary /Cache_TestBench/CPU/L1Cache/p1_stall_o
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label p1_data -radix hexadecimal -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/p1_data
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label w_hit_data -radix hexadecimal -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/w_hit_data
add wave -noupdate -expand -group CPU -expand -group {L1 Cache} -label {Write Hit} -radix binary -radixshowbase 0 /Cache_TestBench/CPU/L1Cache/write_hit
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
add wave -noupdate -radix hexadecimal /Cache_TestBench/CPU/ALU/data_1
add wave -noupdate -radix hexadecimal /Cache_TestBench/CPU/ALU/data_2
add wave -noupdate -radix hexadecimal /Cache_TestBench/CPU/ALU/data_o
add wave -noupdate -radix hexadecimal /Cache_TestBench/CPU/Data_2_imm_Mux/data_1
add wave -noupdate -radix hexadecimal /Cache_TestBench/CPU/Data_2_imm_Mux/data_2
add wave -noupdate -radix binary /Cache_TestBench/CPU/Data_2_imm_Mux/sel
add wave -noupdate -radix hexadecimal /Cache_TestBench/CPU/Data_2_imm_Mux/data_o
add wave -noupdate /Cache_TestBench/CPU/HDU/IFID_Rs_i
add wave -noupdate /Cache_TestBench/CPU/HDU/IFID_Rt_i
add wave -noupdate /Cache_TestBench/CPU/HDU/IDEX_Rt_i
add wave -noupdate /Cache_TestBench/CPU/HDU/IDEX_Mem_cs
add wave -noupdate /Cache_TestBench/CPU/L1Cache/clk_i
add wave -noupdate /Cache_TestBench/CPU/L1Cache/rst_i
add wave -noupdate /Cache_TestBench/CPU/L1Cache/mem_data_i
add wave -noupdate /Cache_TestBench/CPU/L1Cache/mem_ack_i
add wave -noupdate /Cache_TestBench/CPU/L1Cache/mem_data_o
add wave -noupdate /Cache_TestBench/CPU/L1Cache/mem_addr_o
add wave -noupdate /Cache_TestBench/CPU/L1Cache/mem_enable_o
add wave -noupdate /Cache_TestBench/CPU/L1Cache/mem_write_o
add wave -noupdate /Cache_TestBench/CPU/L1Cache/p1_data_i
add wave -noupdate -radix hexadecimal /Cache_TestBench/CPU/L1Cache/p1_addr_i
add wave -noupdate /Cache_TestBench/CPU/L1Cache/p1_MemRead_i
add wave -noupdate /Cache_TestBench/CPU/L1Cache/p1_MemWrite_i
add wave -noupdate /Cache_TestBench/CPU/L1Cache/p1_data_o
add wave -noupdate /Cache_TestBench/CPU/L1Cache/i
add wave -noupdate /Cache_TestBench/CPU/L1Cache/cache_sram_index
add wave -noupdate /Cache_TestBench/CPU/L1Cache/cache_sram_enable
add wave -noupdate /Cache_TestBench/CPU/L1Cache/cache_sram_tag
add wave -noupdate /Cache_TestBench/CPU/L1Cache/cache_sram_data
add wave -noupdate /Cache_TestBench/CPU/L1Cache/cache_sram_write
add wave -noupdate /Cache_TestBench/CPU/L1Cache/sram_cache_tag
add wave -noupdate /Cache_TestBench/CPU/L1Cache/sram_cache_data
add wave -noupdate /Cache_TestBench/CPU/L1Cache/sram_valid
add wave -noupdate /Cache_TestBench/CPU/L1Cache/sram_dirty
add wave -noupdate /Cache_TestBench/CPU/L1Cache/state
add wave -noupdate /Cache_TestBench/CPU/L1Cache/mem_enable
add wave -noupdate /Cache_TestBench/CPU/L1Cache/mem_write
add wave -noupdate /Cache_TestBench/CPU/L1Cache/cache_we
add wave -noupdate /Cache_TestBench/CPU/L1Cache/cache_dirty
add wave -noupdate /Cache_TestBench/CPU/L1Cache/write_back
add wave -noupdate /Cache_TestBench/CPU/L1Cache/p1_offset
add wave -noupdate /Cache_TestBench/CPU/L1Cache/p1_index
add wave -noupdate /Cache_TestBench/CPU/L1Cache/p1_tag
add wave -noupdate /Cache_TestBench/CPU/L1Cache/r_hit_data
add wave -noupdate /Cache_TestBench/CPU/L1Cache/sram_tag
add wave -noupdate /Cache_TestBench/CPU/L1Cache/hit
add wave -noupdate /Cache_TestBench/CPU/L1Cache/w_hit_data
add wave -noupdate /Cache_TestBench/CPU/L1Cache/write_hit
add wave -noupdate /Cache_TestBench/CPU/L1Cache/p1_req
add wave -noupdate /Cache_TestBench/CPU/L1Cache/p1_data
add wave -noupdate /Cache_TestBench/CPU/L1Cache/block_offset
add wave -noupdate /Cache_TestBench/CPU/ALU/ALUop_i
add wave -noupdate /Cache_TestBench/CPU/ALU/is_zero
add wave -noupdate -radix hexadecimal /Cache_TestBench/CPU/SignExt/data_i
add wave -noupdate -radix hexadecimal /Cache_TestBench/CPU/SignExt/data_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7008 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 365
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
WaveRestoreZoom {7546 ps} {8024 ps}
