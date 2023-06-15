/***************************************************
Student Name: 盧彥勳、蔡銘萱
Student ID: group24_0816162_0812203
***************************************************/
`timescale 1ns/1ps

module Decoder(
	input [32-1:0] 	instr_i,
	output wire			Branch,
	output wire			ALUSrc,
	output wire			RegWrite,
	output wire [2-1:0]	ALUOp,
	output wire			MemRead,
	output wire			MemWrite,
	output wire			MemtoReg1,
	output wire			MemtoReg2,
	output wire 		Jump,
	output reg 			Flush
	);
	
//Internal Signals
wire	[7-1:0]		opcode;
wire 	[3-1:0]		funct3;
wire	[3-1:0]		Instr_field;
wire	[11-1:0]		Ctrl_o;

assign opcode = instr_i[6:0];
assign funct3 = instr_i[14:12];

// Check Instr. Field
// 0:R-type, 1:I-type, 2:S-type, 3:B-type	4:J-type				 
assign Instr_field = (opcode==7'b1101111)?4:( // JAL
					(opcode==7'b1100011)?3:(
                     (opcode==7'b0100011)?2:(( //SW
					 (opcode==7'b0000011 && funct3==3'b010) ||	//LW
					 (opcode==7'b1100111 && funct3==3'b000) ||	//JALR
                     (opcode==7'b0010011 && funct3==3'b000) ||	//ADDI
					 (opcode==7'b0010011 && funct3==3'b010) ||	//SLTI
					 (opcode==7'b0010011 && funct3==3'b100) ||	//XORI
					 (opcode==7'b0010011 && funct3==3'b110) ||	//ORI
					 (opcode==7'b0010011 && funct3==3'b111))?1:(//ANDI
					 (opcode==7'b0110011)?0:(
					 (opcode==7'b1100011)?3:(  		
					 1))))));
					 
assign Ctrl_o = (Instr_field==0 && opcode[5]==0)?10'b0100100010:(
				(Instr_field==0)?10'b0000100010:(
				(Instr_field==1 && opcode==7'b1100111)?10'b1110100000:( //JALR
				(Instr_field==1 && opcode==7'b0000011)?10'b0101110000:( //LW
				(Instr_field==1)?10'b0100100011:(
				(Instr_field==2)?10'b0100001000:(
				(Instr_field==3)?10'b0000000101:(
				(Instr_field==4)?10'b1010100000:( // JAL
				0))))))));

// assign Flush = Ctrl_o[10];
assign Jump = Ctrl_o[9];
assign ALUSrc 	= Ctrl_o[8];
assign MemtoReg2 = Ctrl_o[7];
assign MemtoReg1 = Ctrl_o[6];
assign RegWrite = Ctrl_o[5];
assign MemRead= Ctrl_o[4];
assign MemWrite= Ctrl_o[3];
assign Branch	= Ctrl_o[2];
assign ALUOp 	= {Ctrl_o[1:0]};

always @(*) begin
	if (Instr_field==1 && opcode==7'b1100111) begin
		Flush = 1;
	end
	else if ((Instr_field==3) || (Instr_field==4)) begin
		Flush = 1;
	end
	else begin
		Flush = 0;
	end
end

endmodule





                    
                    
