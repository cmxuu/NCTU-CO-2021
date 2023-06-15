/***************************************************
Student Name: 0812203、0816162
Student ID: 蔡銘萱、盧彥勳
***************************************************/

`timescale 1ns/1ps

module Decoder(
	input [32-1:0]      instr_i,
	output wire			ALUSrc,
	output wire			RegWrite,
	output wire			Branch,
	output wire [2-1:0]	ALUOp
	);

//Internal Signals
//wire    [7-1:0]     opcode;
//wire    [3-1:0]     funct3;
//wire    [3-1:0]     Instr_field;
//wire    [9-1:0]     Ctrl_o;

assign ALUSrc   = 1'b0;
assign RegWrite = 1'b1;
assign Branch   = 1'b0;
assign ALUOp    = 2'b10;

endmodule
