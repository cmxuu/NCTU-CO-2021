/***************************************************
Student Name: 盧彥勳、蔡銘萱
Student ID: group24_0816162_0812203
***************************************************/

`timescale 1ns/1ps

module Adder(
    input  [31:0] src1_i,
	input  [31:0] src2_i,
	output [31:0] sum_o
	);
    
/* Write your code HERE */

assign sum_o = src1_i + src2_i ; //把傳入兩個值相加

endmodule