`include "LookupTable.v"

module GeneralControl (
	input			[5:0]	op_i,
	input					is_equal_i,
	output reg		[1:0]	PC_ctrl_o,
	output reg		[3:0]	EX_ctrl_o,	
	output reg		[1:0]	MEM_ctrl_o,
	output reg		[1:0]	WB_ctrl_o
);
	
	/** 
	 * PC_ctrl_o = { PC_mux(2) }
	 * PC_mux[0] -> jump/branch, PC_mux[1] -> normal/jump,branch
	 */

	/**
	 * EX_ctrl_o = { ALUop(2), ALUsrc(1), RegDst(1) }
	 * ALUsrc -> 0:register, 1:immediate
	 * RegDst -> 0:rt, 1:rd
	 */

	/**
	 * MEM_ctrl_o = { MEM_cs(1), MEM_we(1) }
	 */

	/**
	 * WB_ctrl_o = { WB_mux(1), Reg_we(1) } 
	 * WB_mux -> 0: memory, 1:ALU
	 */

	always @ (*)
	begin
		case (op_i)
			`ADD_op	:
			begin
				PC_ctrl_o	= { 1'b0, 1'b0 };
				EX_ctrl_o	= { `ADD_alu, 1'b0, 1'b1 };
				MEM_ctrl_o	= { 1'b0, 1'b0 };
				WB_ctrl_o	= { 1'b1, 1'b1 };
			end

			`SUB_op	:
			begin
				PC_ctrl_o	= { 1'b0, 1'b0 };
				EX_ctrl_o	= { `SUB_alu, 1'b0, 1'b1 };
				MEM_ctrl_o	= { 1'b0, 1'b0 };
				WB_ctrl_o	= { 1'b1, 1'b1 };
			end

			`MUL_op	:	
			begin
				PC_ctrl_o	= { 1'b0, 1'b0 };
				EX_ctrl_o	= { `MUL_alu, 1'b0, 1'b1 };
				MEM_ctrl_o	= { 1'b0, 1'b0 };
				WB_ctrl_o	= { 1'b1, 1'b1 };
			end

			`AND_op	:	
			begin
				PC_ctrl_o	= { 1'b0, 1'b0 };
				EX_ctrl_o	= { `AND_alu, 1'b0, 1'b1 };
				MEM_ctrl_o	= { 1'b0, 1'b0 };
				WB_ctrl_o	= { 1'b1, 1'b1 };
			end

			`OR_op	:
			begin
				PC_ctrl_o	= { 1'b0, 1'b0 };
				EX_ctrl_o	= { `OR_alu, 1'b0, 1'b1 };
				MEM_ctrl_o	= { 1'b0, 1'b0 };
				WB_ctrl_o	= { 1'b1, 1'b1 };
			end

			`ADDI_op	:
			begin
				PC_ctrl_o	= { 1'b0, 1'b0 };
				EX_ctrl_o	= { `ADD_alu, 1'b1, 1'b1 };
				MEM_ctrl_o	= { 1'b0, 1'b0 };
				WB_ctrl_o	= { 1'b1, 1'b1 };
			end

			`LW_op	:
			begin
				PC_ctrl_o	= { 1'b0, 1'b0 };
				EX_ctrl_o	= { `ADD_alu, 1'b1, 1'bz };
				MEM_ctrl_o	= { 1'b1, 1'b0 };
				WB_ctrl_o	= { 1'b1, 1'b1 };
			end

			`SW_op	:
			begin
				PC_ctrl_o	= { 1'b0, 1'b0 };
				EX_ctrl_o	= { `ADD_alu, 1'b1, 1'bz };
				MEM_ctrl_o	= { 1'b1, 1'b1 };
				WB_ctrl_o	= { 1'b1, 1'b0 };
			end

			`J_op	:
			begin
				PC_ctrl_o	= { 1'b1, 1'b0 };
				EX_ctrl_o	= { 6'bz, 1'bz, 1'bz };
				MEM_ctrl_o	= { 1'bz, 1'b0 };
				WB_ctrl_o	= { 1'bz, 1'b0 };
			end

			`BEQ_op	:
			begin
				PC_ctrl_o	= { 1'b1, 1'b1 };
				EX_ctrl_o	= { 6'bz, 1'bz, 1'bz };
				MEM_ctrl_o	= { 1'bz, 1'b0 };
				WB_ctrl_o	= { 1'bz, 1'b0 };
			end

			default:
			begin
				EX_ctrl_o	= 5'bz;
				MEM_ctrl_o	= 2'bz;
				WB_ctrl_o	= 1'bz;
			end
		endcase
	end

endmodule
