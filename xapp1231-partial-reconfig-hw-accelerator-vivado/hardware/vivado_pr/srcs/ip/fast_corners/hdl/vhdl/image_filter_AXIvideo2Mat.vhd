-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2014.4
-- Copyright (C) 2014 Xilinx Inc. All rights reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity image_filter_AXIvideo2Mat is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    video_in_TDATA : IN STD_LOGIC_VECTOR (15 downto 0);
    video_in_TVALID : IN STD_LOGIC;
    video_in_TREADY : OUT STD_LOGIC;
    video_in_TKEEP : IN STD_LOGIC_VECTOR (1 downto 0);
    video_in_TSTRB : IN STD_LOGIC_VECTOR (1 downto 0);
    video_in_TUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    video_in_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    video_in_TID : IN STD_LOGIC_VECTOR (0 downto 0);
    video_in_TDEST : IN STD_LOGIC_VECTOR (0 downto 0);
    img_rows_V_read : IN STD_LOGIC_VECTOR (11 downto 0);
    img_cols_V_read : IN STD_LOGIC_VECTOR (11 downto 0);
    img_data_stream_0_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    img_data_stream_0_V_full_n : IN STD_LOGIC;
    img_data_stream_0_V_write : OUT STD_LOGIC;
    img_data_stream_1_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    img_data_stream_1_V_full_n : IN STD_LOGIC;
    img_data_stream_1_V_write : OUT STD_LOGIC );
end;


architecture behav of image_filter_AXIvideo2Mat is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    constant ap_ST_st2_fsm_1 : STD_LOGIC_VECTOR (6 downto 0) := "0000010";
    constant ap_ST_st3_fsm_2 : STD_LOGIC_VECTOR (6 downto 0) := "0000100";
    constant ap_ST_st4_fsm_3 : STD_LOGIC_VECTOR (6 downto 0) := "0001000";
    constant ap_ST_pp1_stg0_fsm_4 : STD_LOGIC_VECTOR (6 downto 0) := "0010000";
    constant ap_ST_st7_fsm_5 : STD_LOGIC_VECTOR (6 downto 0) := "0100000";
    constant ap_ST_st8_fsm_6 : STD_LOGIC_VECTOR (6 downto 0) := "1000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv12_0 : STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
    constant ap_const_lv12_1 : STD_LOGIC_VECTOR (11 downto 0) := "000000000001";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_true : BOOLEAN := true;

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm_0 : STD_LOGIC;
    signal ap_sig_bdd_26 : BOOLEAN;
    signal eol_1_reg_169 : STD_LOGIC_VECTOR (0 downto 0);
    signal axi_data_V_1_reg_180 : STD_LOGIC_VECTOR (15 downto 0);
    signal p_3_reg_191 : STD_LOGIC_VECTOR (11 downto 0);
    signal eol_reg_202 : STD_LOGIC_VECTOR (0 downto 0);
    signal axi_last_V_2_reg_214 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_Val2_s_reg_226 : STD_LOGIC_VECTOR (15 downto 0);
    signal eol_2_reg_238 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_bdd_71 : BOOLEAN;
    signal tmp_data_V_reg_377 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_sig_cseq_ST_st2_fsm_1 : STD_LOGIC;
    signal ap_sig_bdd_83 : BOOLEAN;
    signal tmp_last_V_reg_385 : STD_LOGIC_VECTOR (0 downto 0);
    signal exitcond1_fu_304_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_cseq_ST_st4_fsm_3 : STD_LOGIC;
    signal ap_sig_bdd_97 : BOOLEAN;
    signal i_V_fu_309_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal i_V_reg_401 : STD_LOGIC_VECTOR (11 downto 0);
    signal exitcond2_fu_315_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal exitcond2_reg_406 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_cseq_ST_pp1_stg0_fsm_4 : STD_LOGIC;
    signal ap_sig_bdd_108 : BOOLEAN;
    signal brmerge_fu_329_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_bdd_116 : BOOLEAN;
    signal ap_reg_ppiten_pp1_it0 : STD_LOGIC := '0';
    signal ap_sig_bdd_126 : BOOLEAN;
    signal ap_reg_ppiten_pp1_it1 : STD_LOGIC := '0';
    signal j_V_fu_320_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_4_fu_348_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_4_reg_419 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_5_reg_424 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_sig_cseq_ST_st7_fsm_5 : STD_LOGIC;
    signal ap_sig_bdd_149 : BOOLEAN;
    signal ap_sig_bdd_154 : BOOLEAN;
    signal axi_last_V_3_reg_249 : STD_LOGIC_VECTOR (0 downto 0);
    signal axi_last_V1_reg_138 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_cseq_ST_st8_fsm_6 : STD_LOGIC;
    signal ap_sig_bdd_172 : BOOLEAN;
    signal ap_sig_cseq_ST_st3_fsm_2 : STD_LOGIC;
    signal ap_sig_bdd_179 : BOOLEAN;
    signal axi_data_V_3_reg_261 : STD_LOGIC_VECTOR (15 downto 0);
    signal axi_data_V1_reg_148 : STD_LOGIC_VECTOR (15 downto 0);
    signal p_s_reg_158 : STD_LOGIC_VECTOR (11 downto 0);
    signal eol_1_phi_fu_172_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal axi_data_V_1_phi_fu_183_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal eol_phi_fu_206_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_reg_phiprechg_axi_last_V_2_reg_214pp1_it0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_reg_phiprechg_p_Val2_s_reg_226pp1_it0 : STD_LOGIC_VECTOR (15 downto 0);
    signal p_Val2_s_phi_fu_230_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_reg_phiprechg_eol_2_reg_238pp1_it0 : STD_LOGIC_VECTOR (0 downto 0);
    signal axi_last_V_1_mux_fu_341_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal eol_3_reg_273 : STD_LOGIC_VECTOR (0 downto 0);
    signal sof_1_fu_90 : STD_LOGIC_VECTOR (0 downto 0);
    signal not_sof_2_fu_335_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_user_V_fu_295_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_sig_bdd_115 : BOOLEAN;
    signal ap_sig_bdd_202 : BOOLEAN;
    signal ap_sig_bdd_137 : BOOLEAN;
    signal ap_sig_bdd_219 : BOOLEAN;


begin




    -- the current state (ap_CS_fsm) of the state machine. --
    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_st1_fsm_0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    -- ap_done_reg assign process. --
    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_continue)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3) and not((exitcond1_fu_304_p2 = ap_const_lv1_0)))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    -- ap_reg_ppiten_pp1_it0 assign process. --
    ap_reg_ppiten_pp1_it0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ppiten_pp1_it0 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_4) and not(((ap_sig_bdd_116 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0)) or (ap_sig_bdd_126 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1)))) and not((exitcond2_fu_315_p2 = ap_const_lv1_0)))) then 
                    ap_reg_ppiten_pp1_it0 <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3) and (exitcond1_fu_304_p2 = ap_const_lv1_0))) then 
                    ap_reg_ppiten_pp1_it0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    -- ap_reg_ppiten_pp1_it1 assign process. --
    ap_reg_ppiten_pp1_it1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ppiten_pp1_it1 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_4) and (exitcond2_fu_315_p2 = ap_const_lv1_0) and not(((ap_sig_bdd_116 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0)) or (ap_sig_bdd_126 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1)))))) then 
                    ap_reg_ppiten_pp1_it1 <= ap_const_logic_1;
                elsif ((((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3) and (exitcond1_fu_304_p2 = ap_const_lv1_0)) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_4) and not(((ap_sig_bdd_116 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0)) or (ap_sig_bdd_126 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1)))) and not((exitcond2_fu_315_p2 = ap_const_lv1_0))))) then 
                    ap_reg_ppiten_pp1_it1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    -- axi_data_V1_reg_148 assign process. --
    axi_data_V1_reg_148_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm_2)) then 
                axi_data_V1_reg_148 <= tmp_data_V_reg_377;
            elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st8_fsm_6)) then 
                axi_data_V1_reg_148 <= axi_data_V_3_reg_261;
            end if; 
        end if;
    end process;

    -- axi_data_V_1_reg_180 assign process. --
    axi_data_V_1_reg_180_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_4) and (exitcond2_reg_406 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not(((ap_sig_bdd_116 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0)) or (ap_sig_bdd_126 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1)))))) then 
                axi_data_V_1_reg_180 <= p_Val2_s_reg_226;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3) and (exitcond1_fu_304_p2 = ap_const_lv1_0))) then 
                axi_data_V_1_reg_180 <= axi_data_V1_reg_148;
            end if; 
        end if;
    end process;

    -- axi_data_V_3_reg_261 assign process. --
    axi_data_V_3_reg_261_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_4) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not(((ap_sig_bdd_116 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0)) or (ap_sig_bdd_126 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1)))) and not((exitcond2_fu_315_p2 = ap_const_lv1_0)))) then 
                axi_data_V_3_reg_261 <= axi_data_V_1_phi_fu_183_p4;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st7_fsm_5) and (ap_const_lv1_0 = eol_3_reg_273) and not(ap_sig_bdd_154))) then 
                axi_data_V_3_reg_261 <= video_in_TDATA;
            end if; 
        end if;
    end process;

    -- axi_last_V1_reg_138 assign process. --
    axi_last_V1_reg_138_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm_2)) then 
                axi_last_V1_reg_138 <= tmp_last_V_reg_385;
            elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st8_fsm_6)) then 
                axi_last_V1_reg_138 <= axi_last_V_3_reg_249;
            end if; 
        end if;
    end process;

    -- axi_last_V_2_reg_214 assign process. --
    axi_last_V_2_reg_214_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (ap_sig_bdd_137) then
                if (ap_sig_bdd_202) then 
                    axi_last_V_2_reg_214 <= eol_1_phi_fu_172_p4;
                elsif (ap_sig_bdd_115) then 
                    axi_last_V_2_reg_214 <= video_in_TLAST;
                elsif ((ap_true = ap_true)) then 
                    axi_last_V_2_reg_214 <= ap_reg_phiprechg_axi_last_V_2_reg_214pp1_it0;
                end if;
            end if; 
        end if;
    end process;

    -- axi_last_V_3_reg_249 assign process. --
    axi_last_V_3_reg_249_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_4) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not(((ap_sig_bdd_116 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0)) or (ap_sig_bdd_126 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1)))) and not((exitcond2_fu_315_p2 = ap_const_lv1_0)))) then 
                axi_last_V_3_reg_249 <= eol_1_phi_fu_172_p4;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st7_fsm_5) and (ap_const_lv1_0 = eol_3_reg_273) and not(ap_sig_bdd_154))) then 
                axi_last_V_3_reg_249 <= video_in_TLAST;
            end if; 
        end if;
    end process;

    -- eol_1_reg_169 assign process. --
    eol_1_reg_169_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_4) and (exitcond2_reg_406 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not(((ap_sig_bdd_116 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0)) or (ap_sig_bdd_126 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1)))))) then 
                eol_1_reg_169 <= axi_last_V_2_reg_214;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3) and (exitcond1_fu_304_p2 = ap_const_lv1_0))) then 
                eol_1_reg_169 <= axi_last_V1_reg_138;
            end if; 
        end if;
    end process;

    -- eol_2_reg_238 assign process. --
    eol_2_reg_238_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (ap_sig_bdd_137) then
                if (ap_sig_bdd_202) then 
                    eol_2_reg_238 <= axi_last_V_1_mux_fu_341_p2;
                elsif (ap_sig_bdd_115) then 
                    eol_2_reg_238 <= video_in_TLAST;
                elsif ((ap_true = ap_true)) then 
                    eol_2_reg_238 <= ap_reg_phiprechg_eol_2_reg_238pp1_it0;
                end if;
            end if; 
        end if;
    end process;

    -- eol_3_reg_273 assign process. --
    eol_3_reg_273_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_4) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not(((ap_sig_bdd_116 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0)) or (ap_sig_bdd_126 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1)))) and not((exitcond2_fu_315_p2 = ap_const_lv1_0)))) then 
                eol_3_reg_273 <= eol_phi_fu_206_p4;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st7_fsm_5) and (ap_const_lv1_0 = eol_3_reg_273) and not(ap_sig_bdd_154))) then 
                eol_3_reg_273 <= video_in_TLAST;
            end if; 
        end if;
    end process;

    -- eol_reg_202 assign process. --
    eol_reg_202_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_4) and (exitcond2_reg_406 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not(((ap_sig_bdd_116 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0)) or (ap_sig_bdd_126 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1)))))) then 
                eol_reg_202 <= eol_2_reg_238;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3) and (exitcond1_fu_304_p2 = ap_const_lv1_0))) then 
                eol_reg_202 <= ap_const_lv1_0;
            end if; 
        end if;
    end process;

    -- p_3_reg_191 assign process. --
    p_3_reg_191_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_4) and (exitcond2_fu_315_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not(((ap_sig_bdd_116 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0)) or (ap_sig_bdd_126 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1)))))) then 
                p_3_reg_191 <= j_V_fu_320_p2;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3) and (exitcond1_fu_304_p2 = ap_const_lv1_0))) then 
                p_3_reg_191 <= ap_const_lv12_0;
            end if; 
        end if;
    end process;

    -- p_Val2_s_reg_226 assign process. --
    p_Val2_s_reg_226_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (ap_sig_bdd_137) then
                if (ap_sig_bdd_202) then 
                    p_Val2_s_reg_226 <= axi_data_V_1_phi_fu_183_p4;
                elsif (ap_sig_bdd_115) then 
                    p_Val2_s_reg_226 <= video_in_TDATA;
                elsif ((ap_true = ap_true)) then 
                    p_Val2_s_reg_226 <= ap_reg_phiprechg_p_Val2_s_reg_226pp1_it0;
                end if;
            end if; 
        end if;
    end process;

    -- p_s_reg_158 assign process. --
    p_s_reg_158_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm_2)) then 
                p_s_reg_158 <= ap_const_lv12_0;
            elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st8_fsm_6)) then 
                p_s_reg_158 <= i_V_reg_401;
            end if; 
        end if;
    end process;

    -- sof_1_fu_90 assign process. --
    sof_1_fu_90_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_4) and (exitcond2_fu_315_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not(((ap_sig_bdd_116 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0)) or (ap_sig_bdd_126 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1)))))) then 
                sof_1_fu_90 <= ap_const_lv1_0;
            elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm_2)) then 
                sof_1_fu_90 <= ap_const_lv1_1;
            end if; 
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_4) and not(((ap_sig_bdd_116 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0)) or (ap_sig_bdd_126 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1)))))) then
                exitcond2_reg_406 <= exitcond2_fu_315_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3)) then
                i_V_reg_401 <= i_V_fu_309_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_4) and (exitcond2_fu_315_p2 = ap_const_lv1_0) and not(((ap_sig_bdd_116 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0)) or (ap_sig_bdd_126 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1)))))) then
                tmp_4_reg_419 <= tmp_4_fu_348_p1;
                tmp_5_reg_424 <= p_Val2_s_phi_fu_230_p4(15 downto 8);
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((video_in_TVALID = ap_const_logic_0)))) then
                tmp_data_V_reg_377 <= video_in_TDATA;
                tmp_last_V_reg_385 <= video_in_TLAST;
            end if;
        end if;
    end process;

    -- the next state (ap_NS_fsm) of the state machine. --
    ap_NS_fsm_assign_proc : process (ap_CS_fsm, video_in_TVALID, ap_sig_bdd_71, exitcond1_fu_304_p2, exitcond2_fu_315_p2, ap_sig_bdd_116, ap_reg_ppiten_pp1_it0, ap_sig_bdd_126, ap_reg_ppiten_pp1_it1, ap_sig_bdd_154, eol_3_reg_273, tmp_user_V_fu_295_p1)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not(ap_sig_bdd_71)) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_st2_fsm_1 => 
                if ((not((video_in_TVALID = ap_const_logic_0)) and (ap_const_lv1_0 = tmp_user_V_fu_295_p1))) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                elsif ((not((video_in_TVALID = ap_const_logic_0)) and not((ap_const_lv1_0 = tmp_user_V_fu_295_p1)))) then
                    ap_NS_fsm <= ap_ST_st3_fsm_2;
                else
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                end if;
            when ap_ST_st3_fsm_2 => 
                ap_NS_fsm <= ap_ST_st4_fsm_3;
            when ap_ST_st4_fsm_3 => 
                if (not((exitcond1_fu_304_p2 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                else
                    ap_NS_fsm <= ap_ST_pp1_stg0_fsm_4;
                end if;
            when ap_ST_pp1_stg0_fsm_4 => 
                if (not(((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not(((ap_sig_bdd_116 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0)) or (ap_sig_bdd_126 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1)))) and not((exitcond2_fu_315_p2 = ap_const_lv1_0))))) then
                    ap_NS_fsm <= ap_ST_pp1_stg0_fsm_4;
                elsif (((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not(((ap_sig_bdd_116 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0)) or (ap_sig_bdd_126 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1)))) and not((exitcond2_fu_315_p2 = ap_const_lv1_0)))) then
                    ap_NS_fsm <= ap_ST_st7_fsm_5;
                else
                    ap_NS_fsm <= ap_ST_pp1_stg0_fsm_4;
                end if;
            when ap_ST_st7_fsm_5 => 
                if (((ap_const_lv1_0 = eol_3_reg_273) and not(ap_sig_bdd_154))) then
                    ap_NS_fsm <= ap_ST_st7_fsm_5;
                elsif ((not(ap_sig_bdd_154) and not((ap_const_lv1_0 = eol_3_reg_273)))) then
                    ap_NS_fsm <= ap_ST_st8_fsm_6;
                else
                    ap_NS_fsm <= ap_ST_st7_fsm_5;
                end if;
            when ap_ST_st8_fsm_6 => 
                ap_NS_fsm <= ap_ST_st4_fsm_3;
            when others =>  
                ap_NS_fsm <= "XXXXXXX";
        end case;
    end process;

    -- ap_done assign process. --
    ap_done_assign_proc : process(ap_done_reg, exitcond1_fu_304_p2, ap_sig_cseq_ST_st4_fsm_3)
    begin
        if (((ap_const_logic_1 = ap_done_reg) or ((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3) and not((exitcond1_fu_304_p2 = ap_const_lv1_0))))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_idle assign process. --
    ap_idle_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm_0)
    begin
        if ((not((ap_const_logic_1 = ap_start)) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_ready assign process. --
    ap_ready_assign_proc : process(exitcond1_fu_304_p2, ap_sig_cseq_ST_st4_fsm_3)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3) and not((exitcond1_fu_304_p2 = ap_const_lv1_0)))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    ap_reg_phiprechg_axi_last_V_2_reg_214pp1_it0 <= "X";
    ap_reg_phiprechg_eol_2_reg_238pp1_it0 <= "X";
    ap_reg_phiprechg_p_Val2_s_reg_226pp1_it0 <= "XXXXXXXXXXXXXXXX";

    -- ap_sig_bdd_108 assign process. --
    ap_sig_bdd_108_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_108 <= (ap_const_lv1_1 = ap_CS_fsm(4 downto 4));
    end process;


    -- ap_sig_bdd_115 assign process. --
    ap_sig_bdd_115_assign_proc : process(exitcond2_fu_315_p2, brmerge_fu_329_p2)
    begin
                ap_sig_bdd_115 <= ((exitcond2_fu_315_p2 = ap_const_lv1_0) and (ap_const_lv1_0 = brmerge_fu_329_p2));
    end process;


    -- ap_sig_bdd_116 assign process. --
    ap_sig_bdd_116_assign_proc : process(video_in_TVALID, exitcond2_fu_315_p2, brmerge_fu_329_p2)
    begin
                ap_sig_bdd_116 <= ((video_in_TVALID = ap_const_logic_0) and (exitcond2_fu_315_p2 = ap_const_lv1_0) and (ap_const_lv1_0 = brmerge_fu_329_p2));
    end process;


    -- ap_sig_bdd_126 assign process. --
    ap_sig_bdd_126_assign_proc : process(img_data_stream_0_V_full_n, img_data_stream_1_V_full_n, exitcond2_reg_406)
    begin
                ap_sig_bdd_126 <= (((img_data_stream_0_V_full_n = ap_const_logic_0) and (exitcond2_reg_406 = ap_const_lv1_0)) or ((exitcond2_reg_406 = ap_const_lv1_0) and (img_data_stream_1_V_full_n = ap_const_logic_0)));
    end process;


    -- ap_sig_bdd_137 assign process. --
    ap_sig_bdd_137_assign_proc : process(ap_sig_cseq_ST_pp1_stg0_fsm_4, ap_sig_bdd_116, ap_reg_ppiten_pp1_it0, ap_sig_bdd_126, ap_reg_ppiten_pp1_it1)
    begin
                ap_sig_bdd_137 <= ((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_4) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not(((ap_sig_bdd_116 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0)) or (ap_sig_bdd_126 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1)))));
    end process;


    -- ap_sig_bdd_149 assign process. --
    ap_sig_bdd_149_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_149 <= (ap_const_lv1_1 = ap_CS_fsm(5 downto 5));
    end process;


    -- ap_sig_bdd_154 assign process. --
    ap_sig_bdd_154_assign_proc : process(video_in_TVALID, eol_3_reg_273)
    begin
                ap_sig_bdd_154 <= ((video_in_TVALID = ap_const_logic_0) and (ap_const_lv1_0 = eol_3_reg_273));
    end process;


    -- ap_sig_bdd_172 assign process. --
    ap_sig_bdd_172_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_172 <= (ap_const_lv1_1 = ap_CS_fsm(6 downto 6));
    end process;


    -- ap_sig_bdd_179 assign process. --
    ap_sig_bdd_179_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_179 <= (ap_const_lv1_1 = ap_CS_fsm(2 downto 2));
    end process;


    -- ap_sig_bdd_202 assign process. --
    ap_sig_bdd_202_assign_proc : process(exitcond2_fu_315_p2, brmerge_fu_329_p2)
    begin
                ap_sig_bdd_202 <= ((exitcond2_fu_315_p2 = ap_const_lv1_0) and not((ap_const_lv1_0 = brmerge_fu_329_p2)));
    end process;


    -- ap_sig_bdd_219 assign process. --
    ap_sig_bdd_219_assign_proc : process(exitcond2_fu_315_p2, ap_sig_cseq_ST_pp1_stg0_fsm_4, ap_reg_ppiten_pp1_it0)
    begin
                ap_sig_bdd_219 <= ((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_4) and (exitcond2_fu_315_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0));
    end process;


    -- ap_sig_bdd_26 assign process. --
    ap_sig_bdd_26_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_26 <= (ap_CS_fsm(0 downto 0) = ap_const_lv1_1);
    end process;


    -- ap_sig_bdd_71 assign process. --
    ap_sig_bdd_71_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_sig_bdd_71 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    -- ap_sig_bdd_83 assign process. --
    ap_sig_bdd_83_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_83 <= (ap_const_lv1_1 = ap_CS_fsm(1 downto 1));
    end process;


    -- ap_sig_bdd_97 assign process. --
    ap_sig_bdd_97_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_97 <= (ap_const_lv1_1 = ap_CS_fsm(3 downto 3));
    end process;


    -- ap_sig_cseq_ST_pp1_stg0_fsm_4 assign process. --
    ap_sig_cseq_ST_pp1_stg0_fsm_4_assign_proc : process(ap_sig_bdd_108)
    begin
        if (ap_sig_bdd_108) then 
            ap_sig_cseq_ST_pp1_stg0_fsm_4 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_pp1_stg0_fsm_4 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st1_fsm_0 assign process. --
    ap_sig_cseq_ST_st1_fsm_0_assign_proc : process(ap_sig_bdd_26)
    begin
        if (ap_sig_bdd_26) then 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st2_fsm_1 assign process. --
    ap_sig_cseq_ST_st2_fsm_1_assign_proc : process(ap_sig_bdd_83)
    begin
        if (ap_sig_bdd_83) then 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st3_fsm_2 assign process. --
    ap_sig_cseq_ST_st3_fsm_2_assign_proc : process(ap_sig_bdd_179)
    begin
        if (ap_sig_bdd_179) then 
            ap_sig_cseq_ST_st3_fsm_2 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st3_fsm_2 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st4_fsm_3 assign process. --
    ap_sig_cseq_ST_st4_fsm_3_assign_proc : process(ap_sig_bdd_97)
    begin
        if (ap_sig_bdd_97) then 
            ap_sig_cseq_ST_st4_fsm_3 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st4_fsm_3 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st7_fsm_5 assign process. --
    ap_sig_cseq_ST_st7_fsm_5_assign_proc : process(ap_sig_bdd_149)
    begin
        if (ap_sig_bdd_149) then 
            ap_sig_cseq_ST_st7_fsm_5 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st7_fsm_5 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st8_fsm_6 assign process. --
    ap_sig_cseq_ST_st8_fsm_6_assign_proc : process(ap_sig_bdd_172)
    begin
        if (ap_sig_bdd_172) then 
            ap_sig_cseq_ST_st8_fsm_6 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st8_fsm_6 <= ap_const_logic_0;
        end if; 
    end process;


    -- axi_data_V_1_phi_fu_183_p4 assign process. --
    axi_data_V_1_phi_fu_183_p4_assign_proc : process(axi_data_V_1_reg_180, p_Val2_s_reg_226, exitcond2_reg_406, ap_sig_cseq_ST_pp1_stg0_fsm_4, ap_reg_ppiten_pp1_it1)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_4) and (exitcond2_reg_406 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1))) then 
            axi_data_V_1_phi_fu_183_p4 <= p_Val2_s_reg_226;
        else 
            axi_data_V_1_phi_fu_183_p4 <= axi_data_V_1_reg_180;
        end if; 
    end process;

    axi_last_V_1_mux_fu_341_p2 <= (eol_1_phi_fu_172_p4 or not_sof_2_fu_335_p2);
    brmerge_fu_329_p2 <= (sof_1_fu_90 or eol_phi_fu_206_p4);

    -- eol_1_phi_fu_172_p4 assign process. --
    eol_1_phi_fu_172_p4_assign_proc : process(eol_1_reg_169, axi_last_V_2_reg_214, exitcond2_reg_406, ap_sig_cseq_ST_pp1_stg0_fsm_4, ap_reg_ppiten_pp1_it1)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_4) and (exitcond2_reg_406 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1))) then 
            eol_1_phi_fu_172_p4 <= axi_last_V_2_reg_214;
        else 
            eol_1_phi_fu_172_p4 <= eol_1_reg_169;
        end if; 
    end process;


    -- eol_phi_fu_206_p4 assign process. --
    eol_phi_fu_206_p4_assign_proc : process(eol_reg_202, eol_2_reg_238, exitcond2_reg_406, ap_sig_cseq_ST_pp1_stg0_fsm_4, ap_reg_ppiten_pp1_it1)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_4) and (exitcond2_reg_406 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1))) then 
            eol_phi_fu_206_p4 <= eol_2_reg_238;
        else 
            eol_phi_fu_206_p4 <= eol_reg_202;
        end if; 
    end process;

    exitcond1_fu_304_p2 <= "1" when (p_s_reg_158 = img_rows_V_read) else "0";
    exitcond2_fu_315_p2 <= "1" when (p_3_reg_191 = img_cols_V_read) else "0";
    i_V_fu_309_p2 <= std_logic_vector(unsigned(p_s_reg_158) + unsigned(ap_const_lv12_1));
    img_data_stream_0_V_din <= tmp_4_reg_419;

    -- img_data_stream_0_V_write assign process. --
    img_data_stream_0_V_write_assign_proc : process(exitcond2_reg_406, ap_sig_cseq_ST_pp1_stg0_fsm_4, ap_sig_bdd_116, ap_reg_ppiten_pp1_it0, ap_sig_bdd_126, ap_reg_ppiten_pp1_it1)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_4) and (exitcond2_reg_406 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not(((ap_sig_bdd_116 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0)) or (ap_sig_bdd_126 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1)))))) then 
            img_data_stream_0_V_write <= ap_const_logic_1;
        else 
            img_data_stream_0_V_write <= ap_const_logic_0;
        end if; 
    end process;

    img_data_stream_1_V_din <= tmp_5_reg_424;

    -- img_data_stream_1_V_write assign process. --
    img_data_stream_1_V_write_assign_proc : process(exitcond2_reg_406, ap_sig_cseq_ST_pp1_stg0_fsm_4, ap_sig_bdd_116, ap_reg_ppiten_pp1_it0, ap_sig_bdd_126, ap_reg_ppiten_pp1_it1)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_4) and (exitcond2_reg_406 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not(((ap_sig_bdd_116 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0)) or (ap_sig_bdd_126 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1)))))) then 
            img_data_stream_1_V_write <= ap_const_logic_1;
        else 
            img_data_stream_1_V_write <= ap_const_logic_0;
        end if; 
    end process;

    j_V_fu_320_p2 <= std_logic_vector(unsigned(p_3_reg_191) + unsigned(ap_const_lv12_1));
    not_sof_2_fu_335_p2 <= (sof_1_fu_90 xor ap_const_lv1_1);

    -- p_Val2_s_phi_fu_230_p4 assign process. --
    p_Val2_s_phi_fu_230_p4_assign_proc : process(video_in_TDATA, brmerge_fu_329_p2, axi_data_V_1_phi_fu_183_p4, ap_reg_phiprechg_p_Val2_s_reg_226pp1_it0, ap_sig_bdd_219)
    begin
        if (ap_sig_bdd_219) then
            if (not((ap_const_lv1_0 = brmerge_fu_329_p2))) then 
                p_Val2_s_phi_fu_230_p4 <= axi_data_V_1_phi_fu_183_p4;
            elsif ((ap_const_lv1_0 = brmerge_fu_329_p2)) then 
                p_Val2_s_phi_fu_230_p4 <= video_in_TDATA;
            else 
                p_Val2_s_phi_fu_230_p4 <= ap_reg_phiprechg_p_Val2_s_reg_226pp1_it0;
            end if;
        else 
            p_Val2_s_phi_fu_230_p4 <= ap_reg_phiprechg_p_Val2_s_reg_226pp1_it0;
        end if; 
    end process;

    tmp_4_fu_348_p1 <= p_Val2_s_phi_fu_230_p4(8 - 1 downto 0);
    tmp_user_V_fu_295_p1 <= video_in_TUSER;

    -- video_in_TREADY assign process. --
    video_in_TREADY_assign_proc : process(video_in_TVALID, ap_sig_cseq_ST_st2_fsm_1, exitcond2_fu_315_p2, ap_sig_cseq_ST_pp1_stg0_fsm_4, brmerge_fu_329_p2, ap_sig_bdd_116, ap_reg_ppiten_pp1_it0, ap_sig_bdd_126, ap_reg_ppiten_pp1_it1, ap_sig_cseq_ST_st7_fsm_5, ap_sig_bdd_154, eol_3_reg_273)
    begin
        if ((((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((video_in_TVALID = ap_const_logic_0))) or ((ap_const_logic_1 = ap_sig_cseq_ST_st7_fsm_5) and (ap_const_lv1_0 = eol_3_reg_273) and not(ap_sig_bdd_154)) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_4) and (exitcond2_fu_315_p2 = ap_const_lv1_0) and (ap_const_lv1_0 = brmerge_fu_329_p2) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not(((ap_sig_bdd_116 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0)) or (ap_sig_bdd_126 and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1))))))) then 
            video_in_TREADY <= ap_const_logic_1;
        else 
            video_in_TREADY <= ap_const_logic_0;
        end if; 
    end process;

end behav;