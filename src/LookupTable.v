module LookupTable;

	parameter ADD_op	= 000000;
	parameter ADD_func	= 100000;

	parameter SUB_op	= 000000;
	parameter SUB_func	= 100010;

	parameter MUL_op	= 000000;
	parameter MUL_func	= 011000;

	parameter ADDI_op	= 001000;
 
	parameter SW_op		= 101011;

	parameter LW_op		= 100011;

	parameter J_op		= 000010;
	
	parameter BEQ_op	= 000100;

	parameter AND_op	= 000000;
	parameter AND_func	= 100100;

	parameter OR_op		= 000000;
	parameter OR_func	= 100101;

endmodule
