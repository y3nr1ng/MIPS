`ifndef _LOOKUP_TABLE_
`define _LOOKUP_TABLE_
	
	`define	R_type		2'b00
	`define I_type		2'b01
	`define J_type		2'b10

	`define ADD_op		6'b000000
	`define ADD_func	6'b100000
	`define ADD_type	R_type
	`define ADD_alu		3'b000

	`define SUB_op		6'b000000
	`define SUB_func	6'b100010
	`define SUB_alu		3'b001

	`define MUL_op		6'b000000
	`define MUL_func	6'b011000
	`define MUL_alu		3'b010

	`define ADDI_op		6'b001000
 
	`define SW_op		6'b101011

	`define LW_op		6'b100011

	`define J_op		6'b000010
	
	`define BEQ_op		6'b000100

	`define AND_op		6'b000000
	`define AND_func	6'b100100
	`define AND_alu		3'b011

	`define OR_op		6'b000000
	`define OR_func		6'b100101
	`define OR_alu		3'b100

`endif
