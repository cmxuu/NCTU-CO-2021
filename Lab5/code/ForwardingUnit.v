/***************************************************
Student Name: 盧彥勳、蔡銘萱
Student ID: group24_0816162_0812203
***************************************************/
module ForwardingUnit (EXE_instr19_15, EXE_instr24_20, MEM_instr11_7, MEM_WBControl, WB_instr11_7, WB_Control, src1_sel_o, src2_sel_o);

	input [5-1:0] EXE_instr19_15, EXE_instr24_20, MEM_instr11_7, WB_instr11_7;
	input MEM_WBControl, WB_Control;
	output wire [2-1:0] src1_sel_o, src2_sel_o;

	reg [2-1:0] src1_sel_output = 2'b00;
	reg [2-1:0] src2_sel_output = 2'b00;

	assign src1_sel_o = src1_sel_output;
	assign src2_sel_o = src2_sel_output;

	always @(*) begin
		// EX/MEM fowarding
		if(MEM_WBControl && MEM_instr11_7 && (MEM_instr11_7 == EXE_instr19_15)) // rs1 fowarding
			src1_sel_output = 2'b10;

		else if((WB_Control) && (WB_instr11_7 != 0) && (WB_instr11_7 == EXE_instr19_15)) // rs1 fowarding
			src1_sel_output = 2'b01;
		else
			src1_sel_output = 2'b00;
		
		if(MEM_WBControl && MEM_instr11_7 && (MEM_instr11_7 == EXE_instr24_20)) // rs2 fowarding
			src2_sel_output = 2'b10;

		else if((WB_Control) && (WB_instr11_7 != 0) && (WB_instr11_7 == EXE_instr24_20)) // rs2 fowarding
			src2_sel_output = 2'b01;

		else
			src2_sel_output = 2'b00;

		// MEM/WB fowarding


	end
endmodule