`ifndef _STATE_TABLE_
`define _STATE_TABLE_
	
	`define	DEBUG					1

	`define STATE_IDLE      		0
	`define STATE_COMPARE      		1
	`define STATE_READ_MISS  		2
	`define STATE_READ_MEM   		3
	`define STATE_READ_DATA  		4    		
	`define STATE_WRITE_HIT  		5
	`define STATE_WRITE_MISS 		6
	`define STATE_WRITE_MEM  		7
	`define STATE_WRITE_DATA 		8
	`define STATE_WRITE_BACK 		9
	`define STATE_WRITE_BACK_MEM 	10

`endif
