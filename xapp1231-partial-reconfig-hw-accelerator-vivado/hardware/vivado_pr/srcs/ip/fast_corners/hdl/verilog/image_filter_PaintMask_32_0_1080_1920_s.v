// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2014.4
// Copyright (C) 2014 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module image_filter_PaintMask_32_0_1080_1920_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        p_src_rows_V_read,
        p_src_cols_V_read,
        p_src_data_stream_0_V_dout,
        p_src_data_stream_0_V_empty_n,
        p_src_data_stream_0_V_read,
        p_src_data_stream_1_V_dout,
        p_src_data_stream_1_V_empty_n,
        p_src_data_stream_1_V_read,
        p_src_data_stream_2_V_dout,
        p_src_data_stream_2_V_empty_n,
        p_src_data_stream_2_V_read,
        p_mask_rows_V_read,
        p_mask_cols_V_read,
        p_mask_data_stream_V_dout,
        p_mask_data_stream_V_empty_n,
        p_mask_data_stream_V_read,
        p_dst_rows_V_read,
        p_dst_cols_V_read,
        p_dst_data_stream_0_V_din,
        p_dst_data_stream_0_V_full_n,
        p_dst_data_stream_0_V_write,
        p_dst_data_stream_1_V_din,
        p_dst_data_stream_1_V_full_n,
        p_dst_data_stream_1_V_write,
        p_dst_data_stream_2_V_din,
        p_dst_data_stream_2_V_full_n,
        p_dst_data_stream_2_V_write
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 4'b1;
parameter    ap_ST_st2_fsm_1 = 4'b10;
parameter    ap_ST_pp0_stg0_fsm_2 = 4'b100;
parameter    ap_ST_st6_fsm_3 = 4'b1000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv11_0 = 11'b00000000000;
parameter    ap_const_lv11_1 = 11'b1;
parameter    ap_const_lv8_0 = 8'b00000000;
parameter    ap_const_lv8_4C = 8'b1001100;
parameter    ap_const_lv8_54 = 8'b1010100;
parameter    ap_const_lv8_FF = 8'b11111111;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [11:0] p_src_rows_V_read;
input  [11:0] p_src_cols_V_read;
input  [7:0] p_src_data_stream_0_V_dout;
input   p_src_data_stream_0_V_empty_n;
output   p_src_data_stream_0_V_read;
input  [7:0] p_src_data_stream_1_V_dout;
input   p_src_data_stream_1_V_empty_n;
output   p_src_data_stream_1_V_read;
input  [7:0] p_src_data_stream_2_V_dout;
input   p_src_data_stream_2_V_empty_n;
output   p_src_data_stream_2_V_read;
input  [11:0] p_mask_rows_V_read;
input  [11:0] p_mask_cols_V_read;
input  [7:0] p_mask_data_stream_V_dout;
input   p_mask_data_stream_V_empty_n;
output   p_mask_data_stream_V_read;
input  [11:0] p_dst_rows_V_read;
input  [11:0] p_dst_cols_V_read;
output  [7:0] p_dst_data_stream_0_V_din;
input   p_dst_data_stream_0_V_full_n;
output   p_dst_data_stream_0_V_write;
output  [7:0] p_dst_data_stream_1_V_din;
input   p_dst_data_stream_1_V_full_n;
output   p_dst_data_stream_1_V_write;
output  [7:0] p_dst_data_stream_2_V_din;
input   p_dst_data_stream_2_V_full_n;
output   p_dst_data_stream_2_V_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg p_src_data_stream_0_V_read;
reg p_src_data_stream_1_V_read;
reg p_src_data_stream_2_V_read;
reg p_mask_data_stream_V_read;
reg p_dst_data_stream_0_V_write;
reg p_dst_data_stream_1_V_write;
reg p_dst_data_stream_2_V_write;
reg    ap_done_reg = 1'b0;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm = 4'b1;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_bdd_23;
reg   [10:0] p_8_reg_198;
reg    ap_sig_bdd_71;
wire   [0:0] exitcond6_fu_214_p2;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_bdd_83;
wire   [10:0] i_V_fu_219_p2;
reg   [10:0] i_V_reg_284;
wire   [0:0] exitcond_fu_229_p2;
reg   [0:0] exitcond_reg_289;
reg    ap_sig_cseq_ST_pp0_stg0_fsm_2;
reg    ap_sig_bdd_94;
reg    ap_reg_ppiten_pp0_it0 = 1'b0;
reg    ap_sig_bdd_111;
reg    ap_reg_ppiten_pp0_it1 = 1'b0;
reg   [0:0] ap_reg_ppstg_exitcond_reg_289_pp0_it1;
reg    ap_sig_bdd_125;
reg    ap_reg_ppiten_pp0_it2 = 1'b0;
wire   [10:0] j_V_fu_234_p2;
wire   [7:0] tmp_78_fu_246_p3;
reg   [7:0] tmp_78_reg_298;
wire   [7:0] tmp_80_fu_254_p3;
reg   [7:0] tmp_80_reg_303;
wire   [7:0] tmp_81_fu_262_p3;
reg   [7:0] tmp_81_reg_308;
reg   [10:0] p_s_reg_187;
reg    ap_sig_cseq_ST_st6_fsm_3;
reg    ap_sig_bdd_158;
wire   [11:0] p_cast_fu_210_p1;
wire   [11:0] p_8_cast_fu_225_p1;
wire   [0:0] tmp_37_fu_240_p2;
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
        end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond6_fu_214_p2 == ap_const_lv1_0))) begin
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
        if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~((ap_sig_bdd_111 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_125 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(exitcond_fu_229_p2 == ap_const_lv1_0))) begin
            ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
        end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond6_fu_214_p2 == ap_const_lv1_0))) begin
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
        if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~((ap_sig_bdd_111 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_125 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & (exitcond_fu_229_p2 == ap_const_lv1_0))) begin
            ap_reg_ppiten_pp0_it1 <= ap_const_logic_1;
        end else if ((((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond6_fu_214_p2 == ap_const_lv1_0)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~((ap_sig_bdd_111 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_125 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(exitcond_fu_229_p2 == ap_const_lv1_0)))) begin
            ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
        end
    end
end

/// ap_reg_ppiten_pp0_it2 assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it2
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it2 <= ap_const_logic_0;
    end else begin
        if (~((ap_sig_bdd_111 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_125 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)))) begin
            ap_reg_ppiten_pp0_it2 <= ap_reg_ppiten_pp0_it1;
        end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond6_fu_214_p2 == ap_const_lv1_0))) begin
            ap_reg_ppiten_pp0_it2 <= ap_const_logic_0;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_sig_bdd_111 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_125 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & (exitcond_fu_229_p2 == ap_const_lv1_0))) begin
        p_8_reg_198 <= j_V_fu_234_p2;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond6_fu_214_p2 == ap_const_lv1_0))) begin
        p_8_reg_198 <= ap_const_lv11_0;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~ap_sig_bdd_71)) begin
        p_s_reg_187 <= ap_const_lv11_0;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_3)) begin
        p_s_reg_187 <= i_V_reg_284;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~((ap_sig_bdd_111 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_125 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        ap_reg_ppstg_exitcond_reg_289_pp0_it1 <= exitcond_reg_289;
        exitcond_reg_289 <= exitcond_fu_229_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        i_V_reg_284 <= i_V_fu_219_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (exitcond_reg_289 == ap_const_lv1_0) & ~((ap_sig_bdd_111 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_125 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        tmp_78_reg_298 <= tmp_78_fu_246_p3;
        tmp_80_reg_303 <= tmp_80_fu_254_p3;
        tmp_81_reg_308 <= tmp_81_fu_262_p3;
    end
end

/// ap_done assign process. ///
always @ (ap_done_reg or exitcond6_fu_214_p2 or ap_sig_cseq_ST_st2_fsm_1)
begin
    if (((ap_const_logic_1 == ap_done_reg) | ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond6_fu_214_p2 == ap_const_lv1_0)))) begin
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
always @ (exitcond6_fu_214_p2 or ap_sig_cseq_ST_st2_fsm_1)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond6_fu_214_p2 == ap_const_lv1_0))) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_pp0_stg0_fsm_2 assign process. ///
always @ (ap_sig_bdd_94)
begin
    if (ap_sig_bdd_94) begin
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
always @ (ap_sig_bdd_83)
begin
    if (ap_sig_bdd_83) begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st6_fsm_3 assign process. ///
always @ (ap_sig_bdd_158)
begin
    if (ap_sig_bdd_158) begin
        ap_sig_cseq_ST_st6_fsm_3 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st6_fsm_3 = ap_const_logic_0;
    end
end

/// p_dst_data_stream_0_V_write assign process. ///
always @ (ap_sig_bdd_111 or ap_reg_ppiten_pp0_it1 or ap_reg_ppstg_exitcond_reg_289_pp0_it1 or ap_sig_bdd_125 or ap_reg_ppiten_pp0_it2)
begin
    if (((ap_const_lv1_0 == ap_reg_ppstg_exitcond_reg_289_pp0_it1) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_sig_bdd_111 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_125 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        p_dst_data_stream_0_V_write = ap_const_logic_1;
    end else begin
        p_dst_data_stream_0_V_write = ap_const_logic_0;
    end
end

/// p_dst_data_stream_1_V_write assign process. ///
always @ (ap_sig_bdd_111 or ap_reg_ppiten_pp0_it1 or ap_reg_ppstg_exitcond_reg_289_pp0_it1 or ap_sig_bdd_125 or ap_reg_ppiten_pp0_it2)
begin
    if (((ap_const_lv1_0 == ap_reg_ppstg_exitcond_reg_289_pp0_it1) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_sig_bdd_111 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_125 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        p_dst_data_stream_1_V_write = ap_const_logic_1;
    end else begin
        p_dst_data_stream_1_V_write = ap_const_logic_0;
    end
end

/// p_dst_data_stream_2_V_write assign process. ///
always @ (ap_sig_bdd_111 or ap_reg_ppiten_pp0_it1 or ap_reg_ppstg_exitcond_reg_289_pp0_it1 or ap_sig_bdd_125 or ap_reg_ppiten_pp0_it2)
begin
    if (((ap_const_lv1_0 == ap_reg_ppstg_exitcond_reg_289_pp0_it1) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_sig_bdd_111 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_125 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        p_dst_data_stream_2_V_write = ap_const_logic_1;
    end else begin
        p_dst_data_stream_2_V_write = ap_const_logic_0;
    end
end

/// p_mask_data_stream_V_read assign process. ///
always @ (exitcond_reg_289 or ap_sig_cseq_ST_pp0_stg0_fsm_2 or ap_sig_bdd_111 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_125 or ap_reg_ppiten_pp0_it2)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (exitcond_reg_289 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_sig_bdd_111 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_125 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        p_mask_data_stream_V_read = ap_const_logic_1;
    end else begin
        p_mask_data_stream_V_read = ap_const_logic_0;
    end
end

/// p_src_data_stream_0_V_read assign process. ///
always @ (exitcond_reg_289 or ap_sig_cseq_ST_pp0_stg0_fsm_2 or ap_sig_bdd_111 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_125 or ap_reg_ppiten_pp0_it2)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (exitcond_reg_289 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_sig_bdd_111 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_125 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        p_src_data_stream_0_V_read = ap_const_logic_1;
    end else begin
        p_src_data_stream_0_V_read = ap_const_logic_0;
    end
end

/// p_src_data_stream_1_V_read assign process. ///
always @ (exitcond_reg_289 or ap_sig_cseq_ST_pp0_stg0_fsm_2 or ap_sig_bdd_111 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_125 or ap_reg_ppiten_pp0_it2)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (exitcond_reg_289 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_sig_bdd_111 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_125 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        p_src_data_stream_1_V_read = ap_const_logic_1;
    end else begin
        p_src_data_stream_1_V_read = ap_const_logic_0;
    end
end

/// p_src_data_stream_2_V_read assign process. ///
always @ (exitcond_reg_289 or ap_sig_cseq_ST_pp0_stg0_fsm_2 or ap_sig_bdd_111 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_125 or ap_reg_ppiten_pp0_it2)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (exitcond_reg_289 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_sig_bdd_111 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_125 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        p_src_data_stream_2_V_read = ap_const_logic_1;
    end else begin
        p_src_data_stream_2_V_read = ap_const_logic_0;
    end
end
/// the next state (ap_NS_fsm) of the state machine. ///
always @ (ap_CS_fsm or ap_sig_bdd_71 or exitcond6_fu_214_p2 or exitcond_fu_229_p2 or ap_reg_ppiten_pp0_it0 or ap_sig_bdd_111 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_125 or ap_reg_ppiten_pp0_it2)
begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : 
        begin
            if (~ap_sig_bdd_71) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end
        end
        ap_ST_st2_fsm_1 : 
        begin
            if (~(exitcond6_fu_214_p2 == ap_const_lv1_0)) begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end else begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_2;
            end
        end
        ap_ST_pp0_stg0_fsm_2 : 
        begin
            if ((~((ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_sig_bdd_111 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_125 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) & ~((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_sig_bdd_111 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_125 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(exitcond_fu_229_p2 == ap_const_lv1_0) & ~(ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_2;
            end else if ((((ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_sig_bdd_111 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_125 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_sig_bdd_111 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_125 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(exitcond_fu_229_p2 == ap_const_lv1_0) & ~(ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) begin
                ap_NS_fsm = ap_ST_st6_fsm_3;
            end else begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_2;
            end
        end
        ap_ST_st6_fsm_3 : 
        begin
            ap_NS_fsm = ap_ST_st2_fsm_1;
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end


/// ap_sig_bdd_111 assign process. ///
always @ (p_src_data_stream_0_V_empty_n or p_src_data_stream_1_V_empty_n or p_src_data_stream_2_V_empty_n or p_mask_data_stream_V_empty_n or exitcond_reg_289)
begin
    ap_sig_bdd_111 = (((p_src_data_stream_0_V_empty_n == ap_const_logic_0) & (exitcond_reg_289 == ap_const_lv1_0)) | ((exitcond_reg_289 == ap_const_lv1_0) & (p_src_data_stream_1_V_empty_n == ap_const_logic_0)) | ((exitcond_reg_289 == ap_const_lv1_0) & (p_src_data_stream_2_V_empty_n == ap_const_logic_0)) | ((exitcond_reg_289 == ap_const_lv1_0) & (p_mask_data_stream_V_empty_n == ap_const_logic_0)));
end

/// ap_sig_bdd_125 assign process. ///
always @ (p_dst_data_stream_0_V_full_n or p_dst_data_stream_1_V_full_n or p_dst_data_stream_2_V_full_n or ap_reg_ppstg_exitcond_reg_289_pp0_it1)
begin
    ap_sig_bdd_125 = (((p_dst_data_stream_0_V_full_n == ap_const_logic_0) & (ap_const_lv1_0 == ap_reg_ppstg_exitcond_reg_289_pp0_it1)) | ((ap_const_lv1_0 == ap_reg_ppstg_exitcond_reg_289_pp0_it1) & (p_dst_data_stream_1_V_full_n == ap_const_logic_0)) | ((ap_const_lv1_0 == ap_reg_ppstg_exitcond_reg_289_pp0_it1) & (p_dst_data_stream_2_V_full_n == ap_const_logic_0)));
end

/// ap_sig_bdd_158 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_158 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_3]);
end

/// ap_sig_bdd_23 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_23 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end

/// ap_sig_bdd_71 assign process. ///
always @ (ap_start or ap_done_reg)
begin
    ap_sig_bdd_71 = ((ap_start == ap_const_logic_0) | (ap_done_reg == ap_const_logic_1));
end

/// ap_sig_bdd_83 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_83 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1]);
end

/// ap_sig_bdd_94 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_94 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_2]);
end
assign exitcond6_fu_214_p2 = (p_cast_fu_210_p1 == p_dst_rows_V_read? 1'b1: 1'b0);
assign exitcond_fu_229_p2 = (p_8_cast_fu_225_p1 == p_dst_cols_V_read? 1'b1: 1'b0);
assign i_V_fu_219_p2 = (p_s_reg_187 + ap_const_lv11_1);
assign j_V_fu_234_p2 = (p_8_reg_198 + ap_const_lv11_1);
assign p_8_cast_fu_225_p1 = p_8_reg_198;
assign p_cast_fu_210_p1 = p_s_reg_187;
assign p_dst_data_stream_0_V_din = tmp_78_reg_298;
assign p_dst_data_stream_1_V_din = tmp_80_reg_303;
assign p_dst_data_stream_2_V_din = tmp_81_reg_308;
assign tmp_37_fu_240_p2 = (p_mask_data_stream_V_dout == ap_const_lv8_0? 1'b1: 1'b0);
assign tmp_78_fu_246_p3 = ((tmp_37_fu_240_p2)? p_src_data_stream_0_V_dout: ap_const_lv8_4C);
assign tmp_80_fu_254_p3 = ((tmp_37_fu_240_p2)? p_src_data_stream_1_V_dout: ap_const_lv8_54);
assign tmp_81_fu_262_p3 = ((tmp_37_fu_240_p2)? p_src_data_stream_2_V_dout: ap_const_lv8_FF);


endmodule //image_filter_PaintMask_32_0_1080_1920_s

