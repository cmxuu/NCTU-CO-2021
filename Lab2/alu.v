/***************************************************
Student Name: 蔡銘萱
Student ID: 0812203
***************************************************/
`include "ALU_1bit.v"
`timescale 1ns/1ps

module alu(
	input                   rst_n,         // negative reset            (input)
	input	     [32-1:0]	src1,          // 32 bits source 1          (input)
	input	     [32-1:0]	src2,          // 32 bits source 2          (input)
	input 	     [ 4-1:0] 	ALU_control,   // 4 bits ALU control input  (input)
	output reg   [32-1:0]	result,        // 32 bits result            (output)
	output reg              zero,          // 1 bit when the output is 0, zero must be set (output)
	output reg              cout,          // 1 bit carry out           (output)
	output reg              overflow       // 1 bit overflow            (output)
	);

	wire [32-1:0] carry;
	wire [32-1:0] equal;

	// alu[3]	: Ainvert
	// alu[2]	: Binvert
	// alu[1-0]	: operation

	// src1, src2, Ainvert, Binvert, Cin, operation, result, cout 

	ALU_1bit a0(src1[0], src2[0], ALU_control[3], ALU_control[2], ALU_control[2], ALU_control[1:0], equal[0], carry[0]);
	ALU_1bit a1(src1[1], src2[1], ALU_control[3], ALU_control[2], carry[0], ALU_control[1:0], equal[1], carry[1]);
	ALU_1bit a2(src1[2], src2[2], ALU_control[3], ALU_control[2], carry[1], ALU_control[1:0], equal[2], carry[2]);
	ALU_1bit a3(src1[3], src2[3], ALU_control[3], ALU_control[2], carry[2], ALU_control[1:0], equal[3], carry[3]);

	ALU_1bit a4(src1[4], src2[4], ALU_control[3], ALU_control[2], carry[3], ALU_control[1:0], equal[4], carry[4]);
	ALU_1bit a5(src1[5], src2[5], ALU_control[3], ALU_control[2], carry[4], ALU_control[1:0], equal[5], carry[5]);
	ALU_1bit a6(src1[6], src2[6], ALU_control[3], ALU_control[2], carry[5], ALU_control[1:0], equal[6], carry[6]);
	ALU_1bit a7(src1[7], src2[7], ALU_control[3], ALU_control[2], carry[6], ALU_control[1:0], equal[7], carry[7]);

	ALU_1bit a8(src1[8], src2[8], ALU_control[3], ALU_control[2], carry[7], ALU_control[1:0], equal[8], carry[8]);
	ALU_1bit a9(src1[9], src2[9], ALU_control[3], ALU_control[2], carry[8], ALU_control[1:0], equal[9], carry[9]);
	ALU_1bit a10(src1[10], src2[10], ALU_control[3], ALU_control[2], carry[9], ALU_control[1:0], equal[10], carry[10]);
	ALU_1bit a11(src1[11], src2[11], ALU_control[3], ALU_control[2], carry[10], ALU_control[1:0], equal[11], carry[11]);
	
	ALU_1bit a12(src1[12], src2[12], ALU_control[3], ALU_control[2], carry[11], ALU_control[1:0], equal[12], carry[12]);
	ALU_1bit a13(src1[13], src2[13], ALU_control[3], ALU_control[2], carry[12], ALU_control[1:0], equal[13], carry[13]);
	ALU_1bit a14(src1[14], src2[14], ALU_control[3], ALU_control[2], carry[13], ALU_control[1:0], equal[14], carry[14]);
	ALU_1bit a15(src1[15], src2[15], ALU_control[3], ALU_control[2], carry[14], ALU_control[1:0], equal[15], carry[15]);
	
	ALU_1bit a16(src1[16], src2[16], ALU_control[3], ALU_control[2], carry[15], ALU_control[1:0], equal[16], carry[16]);
	ALU_1bit a17(src1[17], src2[17], ALU_control[3], ALU_control[2], carry[16], ALU_control[1:0], equal[17], carry[17]);
	ALU_1bit a18(src1[18], src2[18], ALU_control[3], ALU_control[2], carry[17], ALU_control[1:0], equal[18], carry[18]);
	ALU_1bit a19(src1[19], src2[19], ALU_control[3], ALU_control[2], carry[18], ALU_control[1:0], equal[19], carry[19]);

	ALU_1bit a20(src1[20], src2[20], ALU_control[3], ALU_control[2], carry[19], ALU_control[1:0], equal[20], carry[20]);
	ALU_1bit a21(src1[21], src2[21], ALU_control[3], ALU_control[2], carry[20], ALU_control[1:0], equal[21], carry[21]);
	ALU_1bit a22(src1[22], src2[22], ALU_control[3], ALU_control[2], carry[21], ALU_control[1:0], equal[22], carry[22]);
	ALU_1bit a23(src1[23], src2[23], ALU_control[3], ALU_control[2], carry[22], ALU_control[1:0], equal[23], carry[23]);
	
	ALU_1bit a24(src1[24], src2[24], ALU_control[3], ALU_control[2], carry[23], ALU_control[1:0], equal[24], carry[24]);
	ALU_1bit a25(src1[25], src2[25], ALU_control[3], ALU_control[2], carry[24], ALU_control[1:0], equal[25], carry[25]);
	ALU_1bit a26(src1[26], src2[26], ALU_control[3], ALU_control[2], carry[25], ALU_control[1:0], equal[26], carry[26]);
	ALU_1bit a27(src1[27], src2[27], ALU_control[3], ALU_control[2], carry[26], ALU_control[1:0], equal[27], carry[27]);
	
	ALU_1bit a28(src1[28], src2[28], ALU_control[3], ALU_control[2], carry[27], ALU_control[1:0], equal[28], carry[28]);
	ALU_1bit a29(src1[29], src2[29], ALU_control[3], ALU_control[2], carry[28], ALU_control[1:0], equal[29], carry[29]);
	ALU_1bit a30(src1[30], src2[30], ALU_control[3], ALU_control[2], carry[29], ALU_control[1:0], equal[30], carry[30]);
	ALU_1bit a31(src1[31], src2[31], ALU_control[3], ALU_control[2], carry[30], ALU_control[1:0], equal[31], carry[31]);


	always @(*) begin

		if(rst_n == 1) begin
			
			// SLT or not
			if(ALU_control == 4'b0111) begin
				if(equal[31] == 1)
					result = 32'b01;
				else
					result = 32'b00;
			end
			else
				result = equal;

			// Zero
			if(result == 0)
				zero = 1;
			else
				zero = 0;

			// Carry out
			if(ALU_control == 4'b0111)
				cout = 0;
			else
				cout = carry[31];

			// Overflow
			if(carry[30] ^ carry[31])
				overflow = 1;
			else 
				overflow = 0;

			end
	end


endmodule

/*

cd C:\Users\user\Desktop\Lab2

iverilog -o alu.vvp ALU_1bit.v alu.v testbench.v
vvp alu.vvp

iverilog -I ALU_1bit.v alu.v -o test testbench.v
./test

*/