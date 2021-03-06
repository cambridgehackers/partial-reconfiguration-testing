// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2014.4
// Copyright (C) 2014 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module image_filter_Consume_1080_1920_0_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        src_rows_V_read,
        src_cols_V_read,
        src_data_stream_V_dout,
        src_data_stream_V_empty_n,
        src_data_stream_V_read
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
parameter    ap_const_lv11_1 = 11'b1;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [11:0] src_rows_V_read;
input  [11:0] src_cols_V_read;
input  [7:0] src_data_stream_V_dout;
input   src_data_stream_V_empty_n;
output   src_data_stream_V_read;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg src_data_stream_V_read;
reg    ap_done_reg = 1'b0;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm = 4'b1;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_bdd_23;
reg   [10:0] p_7_reg_79;
reg    ap_sig_bdd_43;
wire   [0:0] exitcond5_fu_95_p2;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_bdd_55;
wire   [10:0] i_V_fu_100_p2;
reg   [10:0] i_V_reg_135;
wire   [0:0] exitcond_fu_110_p2;
reg   [0:0] exitcond_reg_140;
reg    ap_sig_cseq_ST_pp0_stg0_fsm_2;
reg    ap_sig_bdd_66;
reg    ap_reg_ppiten_pp0_it0 = 1'b0;
reg    ap_sig_bdd_74;
reg    ap_reg_ppiten_pp0_it1 = 1'b0;
wire   [10:0] j_V_fu_115_p2;
reg   [10:0] p_s_reg_68;
reg    ap_sig_cseq_ST_st5_fsm_3;
reg    ap_sig_bdd_98;
wire   [11:0] p_cast_fu_91_p1;
wire   [11:0] p_7_cast_fu_106_p1;
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
        end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond5_fu_95_p2 == ap_const_lv1_0))) begin
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
        if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~(ap_sig_bdd_74 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) & ~(exitcond_fu_110_p2 == ap_const_lv1_0))) begin
            ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
        end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond5_fu_95_p2 == ap_const_lv1_0))) begin
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
        if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~(ap_sig_bdd_74 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) & (exitcond_fu_110_p2 == ap_const_lv1_0))) begin
            ap_reg_ppiten_pp0_it1 <= ap_const_logic_1;
        end else if ((((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond5_fu_95_p2 == ap_const_lv1_0)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~(ap_sig_bdd_74 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) & ~(exitcond_fu_110_p2 == ap_const_lv1_0)))) begin
            ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(ap_sig_bdd_74 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) & (exitcond_fu_110_p2 == ap_const_lv1_0))) begin
        p_7_reg_79 <= j_V_fu_115_p2;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond5_fu_95_p2 == ap_const_lv1_0))) begin
        p_7_reg_79 <= ap_const_lv11_0;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~ap_sig_bdd_43)) begin
        p_s_reg_68 <= ap_const_lv11_0;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_3)) begin
        p_s_reg_68 <= i_V_reg_135;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~(ap_sig_bdd_74 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) begin
        exitcond_reg_140 <= exitcond_fu_110_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        i_V_reg_135 <= i_V_fu_100_p2;
    end
end

/// ap_done assign process. ///
always @ (ap_done_reg or exitcond5_fu_95_p2 or ap_sig_cseq_ST_st2_fsm_1)
begin
    if (((ap_const_logic_1 == ap_done_reg) | ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond5_fu_95_p2 == ap_const_lv1_0)))) begin
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
always @ (exitcond5_fu_95_p2 or ap_sig_cseq_ST_st2_fsm_1)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond5_fu_95_p2 == ap_const_lv1_0))) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_pp0_stg0_fsm_2 assign process. ///
always @ (ap_sig_bdd_66)
begin
    if (ap_sig_bdd_66) begin
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
always @ (ap_sig_bdd_55)
begin
    if (ap_sig_bdd_55) begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st5_fsm_3 assign process. ///
always @ (ap_sig_bdd_98)
begin
    if (ap_sig_bdd_98) begin
        ap_sig_cseq_ST_st5_fsm_3 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st5_fsm_3 = ap_const_logic_0;
    end
end

/// src_data_stream_V_read assign process. ///
always @ (exitcond_reg_140 or ap_sig_cseq_ST_pp0_stg0_fsm_2 or ap_sig_bdd_74 or ap_reg_ppiten_pp0_it1)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (exitcond_reg_140 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_74 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) begin
        src_data_stream_V_read = ap_const_logic_1;
    end else begin
        src_data_stream_V_read = ap_const_logic_0;
    end
end
/// the next state (ap_NS_fsm) of the state machine. ///
always @ (ap_CS_fsm or ap_sig_bdd_43 or exitcond5_fu_95_p2 or exitcond_fu_110_p2 or ap_reg_ppiten_pp0_it0 or ap_sig_bdd_74 or ap_reg_ppiten_pp0_it1)
begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : 
        begin
            if (~ap_sig_bdd_43) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end
        end
        ap_ST_st2_fsm_1 : 
        begin
            if (~(exitcond5_fu_95_p2 == ap_const_lv1_0)) begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end else begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_2;
            end
        end
        ap_ST_pp0_stg0_fsm_2 : 
        begin
            if (~((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(ap_sig_bdd_74 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) & ~(exitcond_fu_110_p2 == ap_const_lv1_0))) begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_2;
            end else if (((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(ap_sig_bdd_74 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) & ~(exitcond_fu_110_p2 == ap_const_lv1_0))) begin
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


/// ap_sig_bdd_23 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_23 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end

/// ap_sig_bdd_43 assign process. ///
always @ (ap_start or ap_done_reg)
begin
    ap_sig_bdd_43 = ((ap_start == ap_const_logic_0) | (ap_done_reg == ap_const_logic_1));
end

/// ap_sig_bdd_55 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_55 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1]);
end

/// ap_sig_bdd_66 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_66 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_2]);
end

/// ap_sig_bdd_74 assign process. ///
always @ (src_data_stream_V_empty_n or exitcond_reg_140)
begin
    ap_sig_bdd_74 = ((src_data_stream_V_empty_n == ap_const_logic_0) & (exitcond_reg_140 == ap_const_lv1_0));
end

/// ap_sig_bdd_98 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_98 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_3]);
end
assign exitcond5_fu_95_p2 = (p_cast_fu_91_p1 == src_rows_V_read? 1'b1: 1'b0);
assign exitcond_fu_110_p2 = (p_7_cast_fu_106_p1 == src_cols_V_read? 1'b1: 1'b0);
assign i_V_fu_100_p2 = (p_s_reg_68 + ap_const_lv11_1);
assign j_V_fu_115_p2 = (p_7_reg_79 + ap_const_lv11_1);
assign p_7_cast_fu_106_p1 = p_7_reg_79;
assign p_cast_fu_91_p1 = p_s_reg_68;


endmodule //image_filter_Consume_1080_1920_0_s

