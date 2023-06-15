/***************************************************
Student Name: 0812203、0816162
Student ID: 蔡銘萱、盧彥勳
***************************************************/

`timescale 1ns/1ps

module Adder(
    input  [32-1:0] src1_i,
	input  [32-1:0] src2_i,
	output [32-1:0] sum_o
	);
    
/* Write your code HERE */

	assign sum_o = src1_i + src2_i;

endmodule