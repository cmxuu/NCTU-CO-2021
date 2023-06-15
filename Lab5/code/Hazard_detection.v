/***************************************************
Student Name: 盧彥勳、蔡銘萱
Student ID: group24_0816162_0812203
***************************************************/
module Hazard_detection(
    input [4:0] IFID_regRs,
    input [4:0] IFID_regRt,
    input [4:0] IDEXE_regRd,
    input IDEXE_memRead,
    output reg PC_write,
    output reg IFID_write,
    output reg control_output_select
    );

    always @(*) begin
        // hazard detect
        if(IDEXE_memRead  && (IDEXE_regRd == IFID_regRs || IDEXE_regRd == IFID_regRt)) begin
            PC_write = 0;
            IFID_write = 0;
            // control_output_select_output = 0;    
        end
        else begin
            PC_write = 1;
            IFID_write = 1;
        end

        if(IDEXE_memRead && (IDEXE_regRd == IFID_regRs || IDEXE_regRd == IFID_regRt)) begin
                 control_output_select = 1;
        end
        else begin
            control_output_select = 0;
        end
    end

endmodule

