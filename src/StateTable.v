`ifndef _STATE_TABLE_
`define _STATE_TABLE_
	
	`define	DEBUG					1

	`define STATE_IDLE      		0
	`define STATE_READ      		1
	`define STATE_READ_MISS  		2
	`define STATE_READ_MEM   		3
	`define STATE_READ_DATA  		4
	`define STATE_WRITE     		5
	`define STATE_WRITE_HIT  		6
	`define STATE_WRITE_MISS 		7
	`define STATE_WRITE_MEM  		8
	`define STATE_WRITE_DATA 		9
	`define STATE_WRITE_BACK 		10
	`define STATE_WRITE_BACK_MEM 	11

`endif
