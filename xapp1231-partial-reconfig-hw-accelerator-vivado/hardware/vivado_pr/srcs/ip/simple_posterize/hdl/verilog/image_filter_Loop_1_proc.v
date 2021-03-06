// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2014.4
// Copyright (C) 2014 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module image_filter_Loop_1_proc (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        rows_dout,
        rows_empty_n,
        rows_read,
        cols_dout,
        cols_empty_n,
        cols_read,
        img_0_data_stream_0_V_dout,
        img_0_data_stream_0_V_empty_n,
        img_0_data_stream_0_V_read,
        img_0_data_stream_1_V_dout,
        img_0_data_stream_1_V_empty_n,
        img_0_data_stream_1_V_read,
        img_1_data_stream_0_V_din,
        img_1_data_stream_0_V_full_n,
        img_1_data_stream_0_V_write,
        img_1_data_stream_1_V_din,
        img_1_data_stream_1_V_full_n,
        img_1_data_stream_1_V_write
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 4'b1;
parameter    ap_ST_st2_fsm_1 = 4'b10;
parameter    ap_ST_pp0_stg0_fsm_2 = 4'b100;
parameter    ap_ST_st5_fsm_3 = 4'b1000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv11_0 = 11'b00000000000;
parameter    ap_const_lv12_0 = 12'b000000000000;
parameter    ap_const_lv11_1 = 11'b1;
parameter    ap_const_lv12_1 = 12'b1;
parameter    ap_const_lv32_5 = 32'b101;
parameter    ap_const_lv32_7 = 32'b111;
parameter    ap_const_lv5_0 = 5'b00000;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] rows_dout;
input   rows_empty_n;
output   rows_read;
input  [31:0] cols_dout;
input   cols_empty_n;
output   cols_read;
input  [7:0] img_0_data_stream_0_V_dout;
input   img_0_data_stream_0_V_empty_n;
output   img_0_data_stream_0_V_read;
input  [7:0] img_0_data_stream_1_V_dout;
input   img_0_data_stream_1_V_empty_n;
output   img_0_data_stream_1_V_read;
output  [7:0] img_1_data_stream_0_V_din;
input   img_1_data_stream_0_V_full_n;
output   img_1_data_stream_0_V_write;
output  [7:0] img_1_data_stream_1_V_din;
input   img_1_data_stream_1_V_full_n;
output   img_1_data_stream_1_V_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg rows_read;
reg cols_read;
reg img_0_data_stream_0_V_read;
reg img_0_data_stream_1_V_read;
reg img_1_data_stream_0_V_write;
reg img_1_data_stream_1_V_write;
reg    ap_done_reg = 1'b0;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm = 4'b1;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_bdd_23;
reg   [11:0] col_i_reg_139;
wire   [11:0] tmp_fu_151_p1;
reg   [11:0] tmp_reg_223;
reg    ap_sig_bdd_65;
wire   [11:0] tmp_5_fu_155_p1;
reg   [11:0] tmp_5_reg_228;
wire   [0:0] exitcond1_i_fu_163_p2;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_bdd_77;
wire   [10:0] row_fu_168_p2;
reg   [10:0] row_reg_237;
wire   [0:0] exitcond_i_fu_174_p2;
reg   [0:0] exitcond_i_reg_242;
reg    ap_sig_cseq_ST_pp0_stg0_fsm_2;
reg    ap_sig_bdd_88;
reg    ap_reg_ppiten_pp0_it0 = 1'b0;
reg    ap_sig_bdd_105;
reg    ap_reg_ppiten_pp0_it1 = 1'b0;
wire   [11:0] col_fu_179_p2;
reg   [10:0] row_i_reg_128;
reg    ap_sig_cseq_ST_st5_fsm_3;
reg    ap_sig_bdd_129;
wire   [11:0] row_cast_i_fu_159_p1;
wire   [2:0] tmp_7_fu_185_p4;
wire   [2:0] tmp_8_fu_204_p4;
reg   [3:0] ap_NS_fsm;




/// the current state (ap_CS_fsm) of the state machine. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_CS_fsm
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

/// ap_done_reg assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_done_reg
    if (ap_rst == 1'b1) begin
        ap_done_reg <= ap_const_logic_0;
    end else begin
        if ((ap_const_logic_1 == ap_continue)) begin
            ap_done_reg <= ap_const_logic_0;
        end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond1_i_fu_163_p2 == ap_const_lv1_0))) begin
            ap_done_reg <= ap_const_logic_1;
        end
    end
end

/// ap_reg_ppiten_pp0_it0 assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it0
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~(ap_sig_bdd_105 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) & ~(exitcond_i_fu_174_p2 == ap_const_lv1_0))) begin
            ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
        end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond1_i_fu_163_p2 == ap_const_lv1_0))) begin
            ap_reg_ppiten_pp0_it0 <= ap_const_logic_1;
        end
    end
end

/// ap_reg_ppiten_pp0_it1 assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it1
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~(ap_sig_bdd_105 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) & (exitcond_i_fu_174_p2 == ap_const_lv1_0))) begin
            ap_reg_ppiten_pp0_it1 <= ap_const_logic_1;
        end else if ((((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond1_i_fu_163_p2 == ap_const_lv1_0)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~(ap_sig_bdd_105 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) & ~(exitcond_i_fu_174_p2 == ap_const_lv1_0)))) begin
            ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(ap_sig_bdd_105 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) & (exitcond_i_fu_174_p2 == ap_const_lv1_0))) begin
        col_i_reg_139 <= col_fu_179_p2;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond1_i_fu_163_p2 == ap_const_lv1_0))) begin
        col_i_reg_139 <= ap_const_lv12_0;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~ap_sig_bdd_65)) begin
        row_i_reg_128 <= ap_const_lv11_0;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_3)) begin
        row_i_reg_128 <= row_reg_237;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~(ap_sig_bdd_105 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) begin
        exitcond_i_reg_242 <= exitcond_i_fu_174_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        row_reg_237 <= row_fu_168_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~ap_sig_bdd_65)) begin
        tmp_5_reg_228 <= tmp_5_fu_155_p1;
        tmp_reg_223 <= tmp_fu_151_p1;
    end
end

/// ap_done assign process. ///
always @ (ap_done_reg or exitcond1_i_fu_163_p2 or ap_sig_cseq_ST_st2_fsm_1)
begin
    if (((ap_const_logic_1 == ap_done_reg) | ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond1_i_fu_163_p2 == ap_const_lv1_0)))) begin
        ap_done = ap_const_logic_1;
    end else begin
        ap_done = ap_const_logic_0;
    end
end

/// ap_idle assign process. ///
always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0)
begin
    if ((~(ap_const_logic_1 == ap_start) & (ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0))) begin
        ap_idle = ap_const_logic_1;
    end else begin
        ap_idle = ap_const_logic_0;
    end
end

/// ap_ready assign process. ///
always @ (exitcond1_i_fu_163_p2 or ap_sig_cseq_ST_st2_fsm_1)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond1_i_fu_163_p2 == ap_const_lv1_0))) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_pp0_stg0_fsm_2 assign process. ///
always @ (ap_sig_bdd_88)
begin
    if (ap_sig_bdd_88) begin
        ap_sig_cseq_ST_pp0_stg0_fsm_2 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_pp0_stg0_fsm_2 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st1_fsm_0 assign process. ///
always @ (ap_sig_bdd_23)
begin
    if (ap_sig_bdd_23) begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st2_fsm_1 assign process. ///
always @ (ap_sig_bdd_77)
begin
    if (ap_sig_bdd_77) begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st5_fsm_3 assign process. ///
always @ (ap_sig_bdd_129)
begin
    if (ap_sig_bdd_129) begin
        ap_sig_cseq_ST_st5_fsm_3 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st5_fsm_3 = ap_const_logic_0;
    end
end

/// cols_read assign process. ///
always @ (ap_sig_cseq_ST_st1_fsm_0 or ap_sig_bdd_65)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~ap_sig_bdd_65)) begin
        cols_read = ap_const_logic_1;
    end else begin
        cols_read = ap_const_logic_0;
    end
end

/// img_0_data_stream_0_V_read assign process. ///
always @ (exitcond_i_reg_242 or ap_sig_cseq_ST_pp0_stg0_fsm_2 or ap_sig_bdd_105 or ap_reg_ppiten_pp0_it1)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (exitcond_i_reg_242 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_105 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) begin
        img_0_data_stream_0_V_read = ap_const_logic_1;
    end else begin
        img_0_data_stream_0_V_read = ap_const_logic_0;
    end
end

/// img_0_data_stream_1_V_read assign process. ///
always @ (exitcond_i_reg_242 or ap_sig_cseq_ST_pp0_stg0_fsm_2 or ap_sig_bdd_105 or ap_reg_ppiten_pp0_it1)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (exitcond_i_reg_242 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_105 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) begin
        img_0_data_stream_1_V_read = ap_const_logic_1;
    end else begin
        img_0_data_stream_1_V_read = ap_const_logic_0;
    end
end

/// img_1_data_stream_0_V_write assign process. ///
always @ (exitcond_i_reg_242 or ap_sig_cseq_ST_pp0_stg0_fsm_2 or ap_sig_bdd_105 or ap_reg_ppiten_pp0_it1)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (exitcond_i_reg_242 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_105 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) begin
        img_1_data_stream_0_V_write = ap_const_logic_1;
    end else begin
        img_1_data_stream_0_V_write = ap_const_logic_0;
    end
end

/// img_1_data_stream_1_V_write assign process. ///
always @ (exitcond_i_reg_242 or ap_sig_cseq_ST_pp0_stg0_fsm_2 or ap_sig_bdd_105 or ap_reg_ppiten_pp0_it1)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (exitcond_i_reg_242 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_105 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) begin
        img_1_data_stream_1_V_write = ap_const_logic_1;
    end else begin
        img_1_data_stream_1_V_write = ap_const_logic_0;
    end
end

/// rows_read assign process. ///
always @ (ap_sig_cseq_ST_st1_fsm_0 or ap_sig_bdd_65)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~ap_sig_bdd_65)) begin
        rows_read = ap_const_logic_1;
    end else begin
        rows_read = ap_const_logic_0;
    end
end
/// the next state (ap_NS_fsm) of the state machine. ///
always @ (ap_CS_fsm or ap_sig_bdd_65 or exitcond1_i_fu_163_p2 or exitcond_i_fu_174_p2 or ap_reg_ppiten_pp0_it0 or ap_sig_bdd_105 or ap_reg_ppiten_pp0_it1)
begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : 
        begin
            if (~ap_sig_bdd_65) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end
        end
        ap_ST_st2_fsm_1 : 
        begin
            if (~(exitcond1_i_fu_163_p2 == ap_const_lv1_0)) begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end else begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_2;
            end
        end
        ap_ST_pp0_stg0_fsm_2 : 
        begin
            if (~((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(ap_sig_bdd_105 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) & ~(exitcond_i_fu_174_p2 == ap_const_lv1_0))) begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_2;
            end else if (((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(ap_sig_bdd_105 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) & ~(exitcond_i_fu_174_p2 == ap_const_lv1_0))) begin
                ap_NS_fsm = ap_ST_st5_fsm_3;
            end else begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_2;
            end
        end
        ap_ST_st5_fsm_3 : 
        begin
            ap_NS_fsm = ap_ST_st2_fsm_1;
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end


/// ap_sig_bdd_105 assign process. ///
always @ (img_0_data_stream_0_V_empty_n or img_0_data_stream_1_V_empty_n or img_1_data_stream_0_V_full_n or img_1_data_stream_1_V_full_n or exitcond_i_reg_242)
begin
    ap_sig_bdd_105 = (((img_0_data_stream_0_V_empty_n == ap_const_logic_0) & (exitcond_i_reg_242 == ap_const_lv1_0)) | ((exitcond_i_reg_242 == ap_const_lv1_0) & (img_0_data_stream_1_V_empty_n == ap_const_logic_0)) | ((exitcond_i_reg_242 == ap_const_lv1_0) & (img_1_data_stream_0_V_full_n == ap_const_logic_0)) | ((exitcond_i_reg_242 == ap_const_lv1_0) & (img_1_data_stream_1_V_full_n == ap_const_logic_0)));
end

/// ap_sig_bdd_129 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_129 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_3]);
end

/// ap_sig_bdd_23 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_23 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end

/// ap_sig_bdd_65 assign process. ///
always @ (ap_start or ap_done_reg or rows_empty_n or cols_empty_n)
begin
    ap_sig_bdd_65 = ((cols_empty_n == ap_const_logic_0) | (rows_empty_n == ap_const_logic_0) | (ap_start == ap_const_logic_0) | (ap_done_reg == ap_const_logic_1));
end

/// ap_sig_bdd_77 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_77 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1]);
end

/// ap_sig_bdd_88 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_88 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_2]);
end
assign col_fu_179_p2 = (col_i_reg_139 + ap_const_lv12_1);
assign exitcond1_i_fu_163_p2 = (row_cast_i_fu_159_p1 == tmp_reg_223? 1'b1: 1'b0);
assign exitcond_i_fu_174_p2 = (col_i_reg_139 == tmp_5_reg_228? 1'b1: 1'b0);
assign img_1_data_stream_0_V_din = {{tmp_7_fu_185_p4}, {ap_const_lv5_0}};
assign img_1_data_stream_1_V_din = {{tmp_8_fu_204_p4}, {ap_const_lv5_0}};
assign row_cast_i_fu_159_p1 = row_i_reg_128;
assign row_fu_168_p2 = (row_i_reg_128 + ap_const_lv11_1);
assign tmp_5_fu_155_p1 = cols_dout[11:0];
assign tmp_7_fu_185_p4 = {{img_0_data_stream_0_V_dout[ap_const_lv32_7 : ap_const_lv32_5]}};
assign tmp_8_fu_204_p4 = {{img_0_data_stream_1_V_dout[ap_const_lv32_7 : ap_const_lv32_5]}};
assign tmp_fu_151_p1 = rows_dout[11:0];


endmodule //image_filter_Loop_1_proc

