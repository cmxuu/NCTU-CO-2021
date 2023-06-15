/***************************************************
Student Name: 盧彥勳、蔡銘萱
Student ID: group24_0816162_0812203
***************************************************/
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

/* Write your code HERE */
reg [32-1:0] result_t;
always@(*) begin
	if(!rst_n) begin
			result = 0;
			//zero = 0;
			cout = 0;
			overflow = 0;
	end
	else begin
		zero = (result)? 0 : 1;
		case(ALU_control)
			4'b0010://add 
			begin
				{cout, result} = src1 + src2;
				result_t = src1[30:0] + src2[30:0];
				//zero = 0;
				overflow = result_t[31] ^ cout;
			end
			4'b0110://sub
			begin
				{cout ,result} = src1 + ~src2 + 1;
				result_t = src1[30:0] + src2[30:0];
				zero = 0;
				overflow = result_t[31] ^ cout;
			end
			4'b0000://and 
			begin
				result = src1 & src2;
				//zero = 0;
				cout = 0;
				overflow = 0;
			end
			4'b0001://or
			begin
				result = src1 | src2;
				//zero = 0;
				cout = 0;
				overflow = 0;
			end
			4'b1000://xor 
			begin
				result = src1 ^ src2;
				//zero = 0;
				cout = 0;
				overflow = 0;
			end
			4'b0111://slt 
			begin
				result = $signed(src1) < $signed(src2);
				//zero = 0;
				cout = 0;
				overflow = 0;
			end
			4'b1100://sll
			begin			
				result = src1 << src2;
				//zero = 0;
				cout = 0;
				overflow = 0;
			end
    		endcase
	end
end
endmodule
