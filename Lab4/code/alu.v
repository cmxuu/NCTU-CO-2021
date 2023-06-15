/***************************************************
Student Name: 盧彥勳、蔡銘萱
Student ID: group24_0816162_0812203
***************************************************/

   `timescale 1ns/1ps

   module alu(
       input                   rst_n,         // negative reset            (input)
       input        [32-1:0]   src1,          // 32 bits source 1          (input)
       input        [32-1:0]   src2,          // 32 bits source 2          (input)
       input        [ 4-1:0]   ALU_control,   // 4 bits ALU control input  (input)
       output reg   [32-1:0]   result,        // 32 bits result            (output)
       output               Zero          // 1 bit when the output is 0, zero must be set (output)
   );

/* Write your code HERE */

always @(*) begin
        if(rst_n == 1) begin

            case(ALU_control)
                4'b0000:    result = src1 & src2;
                4'b0001:    result = src1 | src2;
                4'b0010:    result = (src1) + (src2); // add lw sw addi
                4'b0110:    result = (src1) - (src2);                // 4'b0111: begin
                //     if(src1 < src2)     result = 32'b01;
                //     else                result = 32'b00;
                // end // slt
                4'b0111: result = $signed(src1) < $signed(src2); // slt
                // 4'b1101: result <= (src1 == src2) ? 1 : 0;  //beq

                // default:    result = 32'b0;
                default:    result = 0;


            endcase
        end
        else result=0;
end

assign Zero = (result==0) ? 1 : 0;

   endmodule

