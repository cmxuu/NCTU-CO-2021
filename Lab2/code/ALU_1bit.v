/***************************************************
Student Name: 蔡銘萱
Student ID: 0812203
***************************************************/
`timescale 1ns/1ps

module ALU_1bit(
	input				src1,       //1 bit source 1  (input)
	input				src2,       //1 bit source 2  (input)
	input 				Ainvert,    //1 bit A_invert  (input)
	input				Binvert,    //1 bit B_invert  (input)
	input 				Cin,        //1 bit carry in  (input)
	input 	    [2-1:0] operation,  //2 bit operation (input)
	output reg          result,     //1 bit result    (output)
	output reg          cout        //1 bit carry out (output)
	);

	always @(*) begin

		case(operation)
	
			2'b00:
				begin
					// NOR
					if(Ainvert && Binvert)
						result = ~(src1 | src2);
					// AND
					else
						result = src1 & src2;
					cout = 0;
				end

			2'b01:
				begin
					// NAND
					if(Ainvert && Binvert)
						result = ~(src1 & src2);
					// OR
					else
						result = src1 | src2;
					cout = 0;
				end


			2'b10:
				begin
					// SUB
					if(Binvert) begin
						result = src1 ^ (~src2) ^ Cin;
						cout = (~src2 && Cin) || (src1 && ~src2) || (src1 && Cin);
					end
					// ADD
					else begin
						result = src1 ^ src2 ^ Cin;
						cout = (src1 && src2) || (Cin && src1) | (Cin && src2);
					end
				end

			2'b11:
				begin
					// SLT
					result = src1 ^ (~src2) ^ Cin;
					cout = (~src2 && Cin) || (src1 && ~src2) || (src1 && Cin);
				end
		endcase
	end

endmodule

/*

cd C:\Users\user\Desktop\Lab2
iverilog -o ALU_1bit.vvp ALU_1bit.v alu_1bit_tb.v
vvp AlU_1bit.vvp

*/