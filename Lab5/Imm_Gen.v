/***************************************************
Student Name: 盧彥勳、蔡銘萱
Student ID: group24_0816162_0812203
***************************************************/
`timescale 1ns/1ps

module Imm_Gen(
   input  [31:0] instr_i,
   output reg[31:0] Imm_Gen_o
);
  //Internal Signals
wire    [7-1:0] opcode;
wire    [2:0]   func3;
wire    [3-1:0] Instr_field;

assign opcode = instr_i[6:0];
assign func3  = instr_i[14:12];

/* Write your code HERE */
always @ (*)  begin
    if(opcode==7'b0010011) begin
        Imm_Gen_o = { {21{instr_i[31]}}, instr_i[30:20]};
    end

    else if(opcode==7'b1101111) begin  // 由OPcode判斷 JAL
        Imm_Gen_o = {{13{instr_i[31]}},instr_i[19:12],instr_i[20],instr_i[30:21], 1'b0};
    end

    else if(opcode==7'b0100011) begin // 由OPcode判斷S type
        Imm_Gen_o = { {21{instr_i [31]}}, instr_i [30:25], instr_i [11:8], instr_i[7]};
    end

    else if(opcode==7'b0000011) begin
        Imm_Gen_o = { {21{instr_i[31]}}  ,  instr_i[30:20]};
    end

    else if(opcode==7'b1100011) begin   // 由OPcode判斷B type
        Imm_Gen_o = { {20{instr_i [31]}}, instr_i [7], instr_i [30:25], instr_i [11:8], 1'b0};
    end

    else  begin // i
        Imm_Gen_o= { {21{instr_i[31]}} , instr_i[30:20] };
    end
end

endmodule