/***************************************************
Student Name: 盧彥勳、蔡銘萱
Student ID: group24_0816162_0812203
***************************************************/


   `timescale 1ns/1ps
   /*instr[30,14:12]*/
   module ALU_Ctrl(
       input       [4-1:0] instr,
       input       [2-1:0] ALUOp,
       output reg  [4-1:0] ALU_Ctrl_o
   );
   wire [2:0] func3;
   assign func3 = instr[2:0];
   /* Write your code HERE */

   always @(*) begin

    if(ALUOp == 2'b00)      // sw, lw
      ALU_Ctrl_o = 4'b0010;

    else if(ALUOp == 2'b01) // beq
      ALU_Ctrl_o = 4'b0110;

    else if(ALUOp == 2'b10) begin
      if(func3 == 3'b010)  ALU_Ctrl_o = 4'b0111;   // slt
      else if(func3 == 3'b000) ALU_Ctrl_o = 4'b0010;                    // add, addi
    end

    else begin
      ALU_Ctrl_o = 4'b1111;
    end

   end


   endmodule
