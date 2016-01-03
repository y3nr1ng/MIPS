`ifndef _STATE_TABLE_
`define _STATE_TABLE_

	`define STATE_IDLE      	0
	`define STATE_READ      	1
	`define STATE_READMISS  	2
	`define STATE_READMEM   	3
	`define STATE_READDATA  	4
	`define STATE_WRITE     	5
	`define STATE_WRITEHIT  	6
	`define STATE_WRITEMISS 	7
	`define STATE_WRITEMEM  	8
	`define STATE_WRITEDATA 	9
	`define STATE_WRITEBACK 	10
	`define STATE_WRITEBACKMEM 	11

`endif
