module LookupTable;

	parameter ADD_op	= 6'b000000;
	parameter ADD_func	= 6'b100000;
	parameter ADD_alu	= 3'b000;

	parameter SUB_op	= 6'b000000;
	parameter SUB_func	= 6'b100010;
	parameter SUB_alu	= 3'b001;

	parameter MUL_op	= 6'b000000;
	parameter MUL_func	= 6'b011000;
	parameter MUL_alu	= 3'b010;

	parameter ADDI_op	= 6'b001000;
 
	parameter SW_op		= 6'b101011;

	parameter LW_op		= 6'b100011;

	parameter J_op		= 6'b000010;
	
	parameter BEQ_op	= 6'b000100;

	parameter AND_op	= 6'b000000;
	parameter AND_func	= 6'b100100;
	parameter AND_alu	= 3'b011;

	parameter OR_op		= 6'b000000;
	parameter OR_func	= 6'b100101;
	parameter OR_alu	= 3'b100;

endmodule
