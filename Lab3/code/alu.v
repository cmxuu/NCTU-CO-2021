/***************************************************
Student Name: 0812203、0816162
Student ID: 蔡銘萱、盧彥勳
***************************************************/
`timescale 1ns/1ps

module alu(
	input						rst_n,         // negative reset            (input)
	input	signed	[32-1:0]	src1,          // 32 bits source 1          (input)
	input	signed 	[32-1:0]	src2,          // 32 bits source 2          (input)
	input 	     	[ 4-1:0] 	ALU_control,   // 4 bits ALU control input  (input)
	output reg		[32-1:0]	result,        // 32 bits result            (output)
	output reg					zero,          // 1 bit when the output is 0, zero must be set (output)
	output reg					cout,          // 1 bit carry out           (output)
	output reg					overflow       // 1 bit overflow            (output)
	);

/* Write your code HERE */

	always @(*) begin
		if(rst_n == 1) begin

			case(ALU_control)
				4'b0000:	result = src1 & src2;
				4'b0001:	result = src1 | src2;
				4'b0010:	result = src1 + src2;
				4'b0110:	result = src1 - src2;
				4'b1001:	result = src1 ^ src2;
				4'b0111: begin
					if(src1 < src2)		result = 32'b01;
					else 				result = 32'b00;
				end
				4'b1010:	result = src1 << src2;
				4'b1011:	result = src1 >>> src2;
				default:	result = 32'b0;
			endcase

			if(result == 32'b0)
				zero = 0;
			else
				zero = 1;
			
			cout = 0;
			overflow = 0;

			// cout and overflow, need? 
		
		end
	end

endmodule
