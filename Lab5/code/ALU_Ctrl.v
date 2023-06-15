/***************************************************
Student Name: 盧彥勳、蔡銘萱
Student ID: group24_0816162_0812203
***************************************************/
`timescale 1ns/1ps

module ALU_Ctrl(
	input		[4-1:0]	instr,
	input		[2-1:0]	ALUOp,
	output wire	[4-1:0] ALU_Ctrl_o
	);

/* Write your code HERE */
assign ALU_Ctrl_o = (ALUOp == 2'b00)? 4'b0010:(			
					(ALUOp == 2'b01)? 4'b0110:(									
					(ALUOp == 2'b10 && instr == 4'b0000)? 4'b0010:(								
					(ALUOp == 2'b10 && instr == 4'b1000)? 4'b0110:(								
					(ALUOp == 2'b10 && instr[2:0] == 3'b111) ? 4'b0000:(						
					(ALUOp == 2'b10 && instr[2:0] == 3'b110) ? 4'b0001:(							
					(ALUOp == 2'b10 && instr[2:0] == 3'b100) ? 4'b1000:(									
					(ALUOp == 2'b10 && instr[2:0] == 3'b010) ? 4'b0111:(									
					(ALUOp == 2'b11 && instr[2:0] == 3'b000) ? 4'b0010:(								
					(ALUOp == 2'b11 && instr[2:0] == 3'b010) ? 4'b0111:(										
					(ALUOp == 2'b11 && instr[2:0] == 3'b001) ? 4'b1100:(											
														  4'b1111)))))))))));	

endmodule
