-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2014.4
-- Copyright (C) 2014 Xilinx Inc. All rights reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity image_filter_PaintMask_32_0_1080_1920_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    p_src_rows_V_read : IN STD_LOGIC_VECTOR (11 downto 0);
    p_src_cols_V_read : IN STD_LOGIC_VECTOR (11 downto 0);
    p_src_data_stream_0_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    p_src_data_stream_0_V_empty_n : IN STD_LOGIC;
    p_src_data_stream_0_V_read : OUT STD_LOGIC;
    p_src_data_stream_1_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    p_src_data_stream_1_V_empty_n : IN STD_LOGIC;
    p_src_data_stream_1_V_read : OUT STD_LOGIC;
    p_src_data_stream_2_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    p_src_data_stream_2_V_empty_n : IN STD_LOGIC;
    p_src_data_stream_2_V_read : OUT STD_LOGIC;
    p_mask_rows_V_read : IN STD_LOGIC_VECTOR (11 downto 0);
    p_mask_cols_V_read : IN STD_LOGIC_VECTOR (11 downto 0);
    p_mask_data_stream_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    p_mask_data_stream_V_empty_n : IN STD_LOGIC;
    p_mask_data_stream_V_read : OUT STD_LOGIC;
    p_dst_rows_V_read : IN STD_LOGIC_VECTOR (11 downto 0);
    p_dst_cols_V_read : IN STD_LOGIC_VECTOR (11 downto 0);
    p_dst_data_stream_0_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    p_dst_data_stream_0_V_full_n : IN STD_LOGIC;
    p_dst_data_stream_0_V_write : OUT STD_LOGIC;
    p_dst_data_stream_1_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    p_dst_data_stream_1_V_full_n : IN STD_LOGIC;
    p_dst_data_stream_1_V_write : OUT STD_LOGIC;
    p_dst_data_stream_2_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    p_dst_data_stream_2_V_full_n : IN STD_LOGIC;
    p_dst_data_stream_2_V_write : OUT STD_LOGIC );
end;


architecture behav of image_filter_PaintMask_32_0_1080_1920_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_st2_fsm_1 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_pp0_stg0_fsm_2 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_st6_fsm_3 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv11_0 : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    constant ap_const_lv11_1 : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv8_4C : STD_LOGIC_VECTOR (7 downto 0) := "01001100";
    constant ap_const_lv8_54 : STD_LOGIC_VECTOR (7 downto 0) := "01010100";
    constant ap_const_lv8_FF : STD_LOGIC_VECTOR (7 downto 0) := "11111111";

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm_0 : STD_LOGIC;
    signal ap_sig_bdd_23 : BOOLEAN;
    signal p_8_reg_198 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_sig_bdd_71 : BOOLEAN;
    signal exitcond6_fu_214_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_cseq_ST_st2_fsm_1 : STD_LOGIC;
    signal ap_sig_bdd_83 : BOOLEAN;
    signal i_V_fu_219_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal i_V_reg_284 : STD_LOGIC_VECTOR (10 downto 0);
    signal exitcond_fu_229_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal exitcond_reg_289 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_cseq_ST_pp0_stg0_fsm_2 : STD_LOGIC;
    signal ap_sig_bdd_94 : BOOLEAN;
    signal ap_reg_ppiten_pp0_it0 : STD_LOGIC := '0';
    signal ap_sig_bdd_111 : BOOLEAN;
    signal ap_reg_ppiten_pp0_it1 : STD_LOGIC := '0';
    signal ap_reg_ppstg_exitcond_reg_289_pp0_it1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_bdd_125 : BOOLEAN;
    signal ap_reg_ppiten_pp0_it2 : STD_LOGIC := '0';
    signal j_V_fu_234_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal tmp_78_fu_246_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_78_reg_298 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_80_fu_254_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_80_reg_303 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_81_fu_262_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_81_reg_308 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_s_reg_187 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_sig_cseq_ST_st6_fsm_3 : STD_LOGIC;
    signal ap_sig_bdd_158 : BOOLEAN;
    signal p_cast_fu_210_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal p_8_cast_fu_225_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_37_fu_240_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);


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
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((exitcond6_fu_214_p2 = ap_const_lv1_0)))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    -- ap_reg_ppiten_pp0_it0 assign process. --
    ap_reg_ppiten_pp0_it0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_sig_bdd_111 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)) or (ap_sig_bdd_125 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2)))) and not((exitcond_fu_229_p2 = ap_const_lv1_0)))) then 
                    ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (exitcond6_fu_214_p2 = ap_const_lv1_0))) then 
                    ap_reg_ppiten_pp0_it0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    -- ap_reg_ppiten_pp0_it1 assign process. --
    ap_reg_ppiten_pp0_it1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_sig_bdd_111 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)) or (ap_sig_bdd_125 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2)))) and (exitcond_fu_229_p2 = ap_const_lv1_0))) then 
                    ap_reg_ppiten_pp0_it1 <= ap_const_logic_1;
                elsif ((((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (exitcond6_fu_214_p2 = ap_const_lv1_0)) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_sig_bdd_111 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)) or (ap_sig_bdd_125 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2)))) and not((exitcond_fu_229_p2 = ap_const_lv1_0))))) then 
                    ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    -- ap_reg_ppiten_pp0_it2 assign process. --
    ap_reg_ppiten_pp0_it2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ppiten_pp0_it2 <= ap_const_logic_0;
            else
                if (not(((ap_sig_bdd_111 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)) or (ap_sig_bdd_125 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2))))) then 
                    ap_reg_ppiten_pp0_it2 <= ap_reg_ppiten_pp0_it1;
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (exitcond6_fu_214_p2 = ap_const_lv1_0))) then 
                    ap_reg_ppiten_pp0_it2 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    -- p_8_reg_198 assign process. --
    p_8_reg_198_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not(((ap_sig_bdd_111 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)) or (ap_sig_bdd_125 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2)))) and (exitcond_fu_229_p2 = ap_const_lv1_0))) then 
                p_8_reg_198 <= j_V_fu_234_p2;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (exitcond6_fu_214_p2 = ap_const_lv1_0))) then 
                p_8_reg_198 <= ap_const_lv11_0;
            end if; 
        end if;
    end process;

    -- p_s_reg_187 assign process. --
    p_s_reg_187_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(ap_sig_bdd_71))) then 
                p_s_reg_187 <= ap_const_lv11_0;
            elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st6_fsm_3)) then 
                p_s_reg_187 <= i_V_reg_284;
            end if; 
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_sig_bdd_111 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)) or (ap_sig_bdd_125 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2)))))) then
                ap_reg_ppstg_exitcond_reg_289_pp0_it1 <= exitcond_reg_289;
                exitcond_reg_289 <= exitcond_fu_229_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then
                i_V_reg_284 <= i_V_fu_219_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (exitcond_reg_289 = ap_const_lv1_0) and not(((ap_sig_bdd_111 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)) or (ap_sig_bdd_125 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2)))))) then
                tmp_78_reg_298 <= tmp_78_fu_246_p3;
                tmp_80_reg_303 <= tmp_80_fu_254_p3;
                tmp_81_reg_308 <= tmp_81_fu_262_p3;
            end if;
        end if;
    end process;

    -- the next state (ap_NS_fsm) of the state machine. --
    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_sig_bdd_71, exitcond6_fu_214_p2, exitcond_fu_229_p2, ap_reg_ppiten_pp0_it0, ap_sig_bdd_111, ap_reg_ppiten_pp0_it1, ap_sig_bdd_125, ap_reg_ppiten_pp0_it2)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not(ap_sig_bdd_71)) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_st2_fsm_1 => 
                if (not((exitcond6_fu_214_p2 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                else
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_2;
                end if;
            when ap_ST_pp0_stg0_fsm_2 => 
                if ((not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and not(((ap_sig_bdd_111 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)) or (ap_sig_bdd_125 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2)))) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not(((ap_sig_bdd_111 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)) or (ap_sig_bdd_125 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2)))) and not((exitcond_fu_229_p2 = ap_const_lv1_0)) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))))) then
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_2;
                elsif ((((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and not(((ap_sig_bdd_111 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)) or (ap_sig_bdd_125 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2)))) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it1))) or ((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not(((ap_sig_bdd_111 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)) or (ap_sig_bdd_125 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2)))) and not((exitcond_fu_229_p2 = ap_const_lv1_0)) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))) then
                    ap_NS_fsm <= ap_ST_st6_fsm_3;
                else
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_2;
                end if;
            when ap_ST_st6_fsm_3 => 
                ap_NS_fsm <= ap_ST_st2_fsm_1;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;

    -- ap_done assign process. --
    ap_done_assign_proc : process(ap_done_reg, exitcond6_fu_214_p2, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if (((ap_const_logic_1 = ap_done_reg) or ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((exitcond6_fu_214_p2 = ap_const_lv1_0))))) then 
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
    ap_ready_assign_proc : process(exitcond6_fu_214_p2, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((exitcond6_fu_214_p2 = ap_const_lv1_0)))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_bdd_111 assign process. --
    ap_sig_bdd_111_assign_proc : process(p_src_data_stream_0_V_empty_n, p_src_data_stream_1_V_empty_n, p_src_data_stream_2_V_empty_n, p_mask_data_stream_V_empty_n, exitcond_reg_289)
    begin
                ap_sig_bdd_111 <= (((p_src_data_stream_0_V_empty_n = ap_const_logic_0) and (exitcond_reg_289 = ap_const_lv1_0)) or ((exitcond_reg_289 = ap_const_lv1_0) and (p_src_data_stream_1_V_empty_n = ap_const_logic_0)) or ((exitcond_reg_289 = ap_const_lv1_0) and (p_src_data_stream_2_V_empty_n = ap_const_logic_0)) or ((exitcond_reg_289 = ap_const_lv1_0) and (p_mask_data_stream_V_empty_n = ap_const_logic_0)));
    end process;


    -- ap_sig_bdd_125 assign process. --
    ap_sig_bdd_125_assign_proc : process(p_dst_data_stream_0_V_full_n, p_dst_data_stream_1_V_full_n, p_dst_data_stream_2_V_full_n, ap_reg_ppstg_exitcond_reg_289_pp0_it1)
    begin
                ap_sig_bdd_125 <= (((p_dst_data_stream_0_V_full_n = ap_const_logic_0) and (ap_const_lv1_0 = ap_reg_ppstg_exitcond_reg_289_pp0_it1)) or ((ap_const_lv1_0 = ap_reg_ppstg_exitcond_reg_289_pp0_it1) and (p_dst_data_stream_1_V_full_n = ap_const_logic_0)) or ((ap_const_lv1_0 = ap_reg_ppstg_exitcond_reg_289_pp0_it1) and (p_dst_data_stream_2_V_full_n = ap_const_logic_0)));
    end process;


    -- ap_sig_bdd_158 assign process. --
    ap_sig_bdd_158_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_158 <= (ap_const_lv1_1 = ap_CS_fsm(3 downto 3));
    end process;


    -- ap_sig_bdd_23 assign process. --
    ap_sig_bdd_23_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_23 <= (ap_CS_fsm(0 downto 0) = ap_const_lv1_1);
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


    -- ap_sig_bdd_94 assign process. --
    ap_sig_bdd_94_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_94 <= (ap_const_lv1_1 = ap_CS_fsm(2 downto 2));
    end process;


    -- ap_sig_cseq_ST_pp0_stg0_fsm_2 assign process. --
    ap_sig_cseq_ST_pp0_stg0_fsm_2_assign_proc : process(ap_sig_bdd_94)
    begin
        if (ap_sig_bdd_94) then 
            ap_sig_cseq_ST_pp0_stg0_fsm_2 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_pp0_stg0_fsm_2 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st1_fsm_0 assign process. --
    ap_sig_cseq_ST_st1_fsm_0_assign_proc : process(ap_sig_bdd_23)
    begin
        if (ap_sig_bdd_23) then 
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


    -- ap_sig_cseq_ST_st6_fsm_3 assign process. --
    ap_sig_cseq_ST_st6_fsm_3_assign_proc : process(ap_sig_bdd_158)
    begin
        if (ap_sig_bdd_158) then 
            ap_sig_cseq_ST_st6_fsm_3 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st6_fsm_3 <= ap_const_logic_0;
        end if; 
    end process;

    exitcond6_fu_214_p2 <= "1" when (p_cast_fu_210_p1 = p_dst_rows_V_read) else "0";
    exitcond_fu_229_p2 <= "1" when (p_8_cast_fu_225_p1 = p_dst_cols_V_read) else "0";
    i_V_fu_219_p2 <= std_logic_vector(unsigned(p_s_reg_187) + unsigned(ap_const_lv11_1));
    j_V_fu_234_p2 <= std_logic_vector(unsigned(p_8_reg_198) + unsigned(ap_const_lv11_1));
    p_8_cast_fu_225_p1 <= std_logic_vector(resize(unsigned(p_8_reg_198),12));
    p_cast_fu_210_p1 <= std_logic_vector(resize(unsigned(p_s_reg_187),12));
    p_dst_data_stream_0_V_din <= tmp_78_reg_298;

    -- p_dst_data_stream_0_V_write assign process. --
    p_dst_data_stream_0_V_write_assign_proc : process(ap_sig_bdd_111, ap_reg_ppiten_pp0_it1, ap_reg_ppstg_exitcond_reg_289_pp0_it1, ap_sig_bdd_125, ap_reg_ppiten_pp0_it2)
    begin
        if (((ap_const_lv1_0 = ap_reg_ppstg_exitcond_reg_289_pp0_it1) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and not(((ap_sig_bdd_111 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)) or (ap_sig_bdd_125 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2)))))) then 
            p_dst_data_stream_0_V_write <= ap_const_logic_1;
        else 
            p_dst_data_stream_0_V_write <= ap_const_logic_0;
        end if; 
    end process;

    p_dst_data_stream_1_V_din <= tmp_80_reg_303;

    -- p_dst_data_stream_1_V_write assign process. --
    p_dst_data_stream_1_V_write_assign_proc : process(ap_sig_bdd_111, ap_reg_ppiten_pp0_it1, ap_reg_ppstg_exitcond_reg_289_pp0_it1, ap_sig_bdd_125, ap_reg_ppiten_pp0_it2)
    begin
        if (((ap_const_lv1_0 = ap_reg_ppstg_exitcond_reg_289_pp0_it1) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and not(((ap_sig_bdd_111 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)) or (ap_sig_bdd_125 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2)))))) then 
            p_dst_data_stream_1_V_write <= ap_const_logic_1;
        else 
            p_dst_data_stream_1_V_write <= ap_const_logic_0;
        end if; 
    end process;

    p_dst_data_stream_2_V_din <= tmp_81_reg_308;

    -- p_dst_data_stream_2_V_write assign process. --
    p_dst_data_stream_2_V_write_assign_proc : process(ap_sig_bdd_111, ap_reg_ppiten_pp0_it1, ap_reg_ppstg_exitcond_reg_289_pp0_it1, ap_sig_bdd_125, ap_reg_ppiten_pp0_it2)
    begin
        if (((ap_const_lv1_0 = ap_reg_ppstg_exitcond_reg_289_pp0_it1) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and not(((ap_sig_bdd_111 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)) or (ap_sig_bdd_125 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2)))))) then 
            p_dst_data_stream_2_V_write <= ap_const_logic_1;
        else 
            p_dst_data_stream_2_V_write <= ap_const_logic_0;
        end if; 
    end process;


    -- p_mask_data_stream_V_read assign process. --
    p_mask_data_stream_V_read_assign_proc : process(exitcond_reg_289, ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_sig_bdd_111, ap_reg_ppiten_pp0_it1, ap_sig_bdd_125, ap_reg_ppiten_pp0_it2)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (exitcond_reg_289 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not(((ap_sig_bdd_111 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)) or (ap_sig_bdd_125 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2)))))) then 
            p_mask_data_stream_V_read <= ap_const_logic_1;
        else 
            p_mask_data_stream_V_read <= ap_const_logic_0;
        end if; 
    end process;


    -- p_src_data_stream_0_V_read assign process. --
    p_src_data_stream_0_V_read_assign_proc : process(exitcond_reg_289, ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_sig_bdd_111, ap_reg_ppiten_pp0_it1, ap_sig_bdd_125, ap_reg_ppiten_pp0_it2)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (exitcond_reg_289 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not(((ap_sig_bdd_111 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)) or (ap_sig_bdd_125 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2)))))) then 
            p_src_data_stream_0_V_read <= ap_const_logic_1;
        else 
            p_src_data_stream_0_V_read <= ap_const_logic_0;
        end if; 
    end process;


    -- p_src_data_stream_1_V_read assign process. --
    p_src_data_stream_1_V_read_assign_proc : process(exitcond_reg_289, ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_sig_bdd_111, ap_reg_ppiten_pp0_it1, ap_sig_bdd_125, ap_reg_ppiten_pp0_it2)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (exitcond_reg_289 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not(((ap_sig_bdd_111 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)) or (ap_sig_bdd_125 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2)))))) then 
            p_src_data_stream_1_V_read <= ap_const_logic_1;
        else 
            p_src_data_stream_1_V_read <= ap_const_logic_0;
        end if; 
    end process;


    -- p_src_data_stream_2_V_read assign process. --
    p_src_data_stream_2_V_read_assign_proc : process(exitcond_reg_289, ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_sig_bdd_111, ap_reg_ppiten_pp0_it1, ap_sig_bdd_125, ap_reg_ppiten_pp0_it2)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (exitcond_reg_289 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not(((ap_sig_bdd_111 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)) or (ap_sig_bdd_125 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2)))))) then 
            p_src_data_stream_2_V_read <= ap_const_logic_1;
        else 
            p_src_data_stream_2_V_read <= ap_const_logic_0;
        end if; 
    end process;

    tmp_37_fu_240_p2 <= "1" when (p_mask_data_stream_V_dout = ap_const_lv8_0) else "0";
    tmp_78_fu_246_p3 <= 
        p_src_data_stream_0_V_dout when (tmp_37_fu_240_p2(0) = '1') else 
        ap_const_lv8_4C;
    tmp_80_fu_254_p3 <= 
        p_src_data_stream_1_V_dout when (tmp_37_fu_240_p2(0) = '1') else 
        ap_const_lv8_54;
    tmp_81_fu_262_p3 <= 
        p_src_data_stream_2_V_dout when (tmp_37_fu_240_p2(0) = '1') else 
        ap_const_lv8_FF;
end behav;
