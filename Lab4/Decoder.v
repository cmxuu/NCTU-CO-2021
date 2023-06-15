/***************************************************
Student Name: 盧彥勳、蔡銘萱
Student ID: group24_0816162_0812203
***************************************************/

   `timescale 1ns/1ps

   module Decoder(
       input   [7-1:0]     instr_i,
       output              RegWrite,
       output              Branch,
       output              Jump,
       output              WriteBack1,
       output              WriteBack0,
       output              MemRead,
       output              MemWrite,
       output              ALUSrcA,
       output              ALUSrcB,
       output  [2-1:0]     ALUOp
   );

   /* Write your code HERE */

   // R-type  0110011
   // addi    0010011
   // lw    0000011
   // sw    0100011
   // beq   1100011
   // jal   1101111
   // jalr    1100111

   assign RegWrite = (instr_i == 7'b0100011 || instr_i == 7'b1100011)? 0:1;
   assign Branch = (instr_i == 7'b1100011)? 1:0;
   assign Jump = (instr_i == 7'b1101111 || instr_i == 7'b1100111)? 1:0;
   assign WriteBack1 = (instr_i == 7'b1101111 || instr_i == 7'b1100111)? 1:0;
   assign WriteBack0 = (instr_i == 7'b0000011)? 1:0;
   assign MemRead = (instr_i == 7'b0000011)? 1:0;
   assign MemWrite = (instr_i == 7'b0100011)? 1:0;
   assign ALUSrcA = (instr_i == 7'b1100111)? 1:0;
   assign ALUSrcB = (instr_i == 7'b0010011 || instr_i == 7'b0000011 || instr_i == 7'b0100011)? 1:0;

   assign ALUOp[1] = (instr_i[4] == 1 || instr_i[2] ==1)? 1:0;
   assign ALUOp[0] = (instr_i[6] == 1)? 1:0;


   endmodule

