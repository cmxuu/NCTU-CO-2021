/***************************************************
Student Name: 0812203、0816162
Student ID: 蔡銘萱、盧彥勳
***************************************************/

`timescale 1ns/1ps

module ALU_Ctrl(
	input	[4-1:0]	instr,
	input	[2-1:0]	ALUOp,
	output	reg [4-1:0] ALU_Ctrl_o
	);
	
/* Write your code HERE */

	// instr [30][14][13][12]

	always @(*) begin
		if(ALUOp == 2'b00)
			ALU_Ctrl_o = 4'b0010;

		else if (ALUOp == 2'b01)
			ALU_Ctrl_o = 4'b0110;

		else begin
			case(instr)
				4'b0111:	ALU_Ctrl_o = 4'b0000;	// and
				4'b0110:	ALU_Ctrl_o = 4'b0001;	// or
				4'b0000:	ALU_Ctrl_o = 4'b0010;	// add
				4'b1000:	ALU_Ctrl_o = 4'b0110;	// sub
				4'b0100:	ALU_Ctrl_o = 4'b1001;	// xor
				4'b0010:	ALU_Ctrl_o = 4'b0111;	// slt
				4'b0001:	ALU_Ctrl_o = 4'b1010;	// sll
				4'b1101:	ALU_Ctrl_o = 4'b1011;	// sra
			endcase
		end
	end

endmodule