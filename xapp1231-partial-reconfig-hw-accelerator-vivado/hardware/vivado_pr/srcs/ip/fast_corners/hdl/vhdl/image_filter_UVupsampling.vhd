-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2014.4
-- Copyright (C) 2014 Xilinx Inc. All rights reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity image_filter_UVupsampling is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    yuv422_rows_V_read : IN STD_LOGIC_VECTOR (11 downto 0);
    yuv422_cols_V_read : IN STD_LOGIC_VECTOR (11 downto 0);
    yuv422_data_stream_0_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    yuv422_data_stream_0_V_empty_n : IN STD_LOGIC;
    yuv422_data_stream_0_V_read : OUT STD_LOGIC;
    yuv422_data_stream_1_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    yuv422_data_stream_1_V_empty_n : IN STD_LOGIC;
    yuv422_data_stream_1_V_read : OUT STD_LOGIC;
    yuv444_data_stream_0_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    yuv444_data_stream_0_V_full_n : IN STD_LOGIC;
    yuv444_data_stream_0_V_write : OUT STD_LOGIC;
    yuv444_data_stream_1_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    yuv444_data_stream_1_V_full_n : IN STD_LOGIC;
    yuv444_data_stream_1_V_write : OUT STD_LOGIC;
    yuv444_data_stream_2_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    yuv444_data_stream_2_V_full_n : IN STD_LOGIC;
    yuv444_data_stream_2_V_write : OUT STD_LOGIC );
end;


architecture behav of image_filter_UVupsampling is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_st2_fsm_1 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_pp0_stg0_fsm_2 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_pp0_stg1_fsm_3 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv12_0 : STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
    constant ap_const_lv12_1 : STD_LOGIC_VECTOR (11 downto 0) := "000000000001";
    constant ap_const_lv12_2 : STD_LOGIC_VECTOR (11 downto 0) := "000000000010";

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm_0 : STD_LOGIC;
    signal ap_sig_bdd_23 : BOOLEAN;
    signal p_1_reg_127 : STD_LOGIC_VECTOR (11 downto 0);
    signal reg_139 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_sig_cseq_ST_pp0_stg1_fsm_3 : STD_LOGIC;
    signal ap_sig_bdd_61 : BOOLEAN;
    signal tmp_reg_185 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_bdd_72 : BOOLEAN;
    signal ap_reg_ppiten_pp0_it0 : STD_LOGIC := '0';
    signal ap_reg_ppstg_tmp_reg_185_pp0_it1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_bdd_87 : BOOLEAN;
    signal ap_reg_ppiten_pp0_it1 : STD_LOGIC := '0';
    signal ap_sig_cseq_ST_pp0_stg0_fsm_2 : STD_LOGIC;
    signal ap_sig_bdd_100 : BOOLEAN;
    signal ap_sig_bdd_108 : BOOLEAN;
    signal ap_sig_bdd_119 : BOOLEAN;
    signal exitcond_fu_144_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_cseq_ST_st2_fsm_1 : STD_LOGIC;
    signal ap_sig_bdd_131 : BOOLEAN;
    signal i_V_fu_149_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal i_V_reg_180 : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_fu_155_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal j_V_fu_160_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal j_V_reg_189 : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_11_reg_194 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_13_reg_199 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_s_reg_116 : STD_LOGIC_VECTOR (11 downto 0);
    signal p_1_phi_fu_131_p4 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_sig_bdd_113 : BOOLEAN;
    signal ap_sig_bdd_222 : BOOLEAN;


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
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((ap_const_lv1_0 = exitcond_fu_144_p2)))) then 
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
                if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_bdd_108)) and (ap_const_lv1_0 = tmp_fu_155_p2))) then 
                    ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (ap_const_lv1_0 = exitcond_fu_144_p2))) then 
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
                if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg1_fsm_3) and not((tmp_reg_185 = ap_const_lv1_0)) and not(((ap_sig_bdd_72 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)) or (ap_sig_bdd_87 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))))) then 
                    ap_reg_ppiten_pp0_it1 <= ap_const_logic_1;
                elsif ((((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (ap_const_lv1_0 = exitcond_fu_144_p2)) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg1_fsm_3) and (tmp_reg_185 = ap_const_lv1_0) and not(((ap_sig_bdd_72 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)) or (ap_sig_bdd_87 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))))) then 
                    ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    -- p_1_reg_127 assign process. --
    p_1_reg_127_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (ap_const_lv1_0 = exitcond_fu_144_p2))) then 
                p_1_reg_127 <= ap_const_lv12_0;
            elsif ((not((tmp_reg_185 = ap_const_lv1_0)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and (ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_bdd_108)))) then 
                p_1_reg_127 <= j_V_reg_189;
            end if; 
        end if;
    end process;

    -- p_s_reg_116 assign process. --
    p_s_reg_116_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and (ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_bdd_108)) and (ap_const_lv1_0 = tmp_fu_155_p2))) then 
                p_s_reg_116 <= i_V_reg_180;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(ap_sig_bdd_119))) then 
                p_s_reg_116 <= ap_const_lv12_0;
            end if; 
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_bdd_108)))) then
                ap_reg_ppstg_tmp_reg_185_pp0_it1 <= tmp_reg_185;
                tmp_reg_185 <= tmp_fu_155_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then
                i_V_reg_180 <= i_V_fu_149_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and (ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_bdd_108)) and not((ap_const_lv1_0 = tmp_fu_155_p2)))) then
                j_V_reg_189 <= j_V_fu_160_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg1_fsm_3) and not((tmp_reg_185 = ap_const_lv1_0)) and not(((ap_sig_bdd_72 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)) or (ap_sig_bdd_87 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))) or (not((tmp_reg_185 = ap_const_lv1_0)) and (ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_bdd_108))))) then
                reg_139 <= yuv422_data_stream_0_V_dout;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg1_fsm_3) and not((tmp_reg_185 = ap_const_lv1_0)) and not(((ap_sig_bdd_72 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)) or (ap_sig_bdd_87 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))))) then
                tmp_11_reg_194 <= yuv422_data_stream_1_V_dout;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not((tmp_reg_185 = ap_const_lv1_0)) and (ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_bdd_108)))) then
                tmp_13_reg_199 <= yuv422_data_stream_1_V_dout;
            end if;
        end if;
    end process;

    -- the next state (ap_NS_fsm) of the state machine. --
    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_sig_cseq_ST_pp0_stg1_fsm_3, ap_sig_bdd_72, ap_reg_ppiten_pp0_it0, ap_sig_bdd_87, ap_reg_ppiten_pp0_it1, ap_sig_bdd_108, ap_sig_bdd_119, exitcond_fu_144_p2, tmp_fu_155_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not(ap_sig_bdd_119)) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_st2_fsm_1 => 
                if (not((ap_const_lv1_0 = exitcond_fu_144_p2))) then
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                else
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_2;
                end if;
            when ap_ST_pp0_stg0_fsm_2 => 
                if ((not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_bdd_108)) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_bdd_108)) and (ap_const_lv1_0 = tmp_fu_155_p2) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))))) then
                    ap_NS_fsm <= ap_ST_pp0_stg1_fsm_3;
                elsif (((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_bdd_108)) and (ap_const_lv1_0 = tmp_fu_155_p2) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_2;
                end if;
            when ap_ST_pp0_stg1_fsm_3 => 
                if ((not(((ap_sig_bdd_72 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)) or (ap_sig_bdd_87 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))) and not(((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg1_fsm_3) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not(((ap_sig_bdd_72 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)) or (ap_sig_bdd_87 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it0)))))) then
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_2;
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg1_fsm_3) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not(((ap_sig_bdd_72 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)) or (ap_sig_bdd_87 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it0)))) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_pp0_stg1_fsm_3;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;

    -- ap_done assign process. --
    ap_done_assign_proc : process(ap_done_reg, exitcond_fu_144_p2, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if (((ap_const_logic_1 = ap_done_reg) or ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((ap_const_lv1_0 = exitcond_fu_144_p2))))) then 
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
    ap_ready_assign_proc : process(exitcond_fu_144_p2, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((ap_const_lv1_0 = exitcond_fu_144_p2)))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_bdd_100 assign process. --
    ap_sig_bdd_100_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_100 <= (ap_const_lv1_1 = ap_CS_fsm(2 downto 2));
    end process;


    -- ap_sig_bdd_108 assign process. --
    ap_sig_bdd_108_assign_proc : process(yuv422_data_stream_0_V_empty_n, yuv422_data_stream_1_V_empty_n, yuv444_data_stream_0_V_full_n, yuv444_data_stream_1_V_full_n, yuv444_data_stream_2_V_full_n, tmp_reg_185)
    begin
                ap_sig_bdd_108 <= (((yuv422_data_stream_0_V_empty_n = ap_const_logic_0) and not((tmp_reg_185 = ap_const_lv1_0))) or (not((tmp_reg_185 = ap_const_lv1_0)) and (yuv422_data_stream_1_V_empty_n = ap_const_logic_0)) or (not((tmp_reg_185 = ap_const_lv1_0)) and (yuv444_data_stream_0_V_full_n = ap_const_logic_0)) or (not((tmp_reg_185 = ap_const_lv1_0)) and (yuv444_data_stream_1_V_full_n = ap_const_logic_0)) or (not((tmp_reg_185 = ap_const_lv1_0)) and (yuv444_data_stream_2_V_full_n = ap_const_logic_0)));
    end process;


    -- ap_sig_bdd_113 assign process. --
    ap_sig_bdd_113_assign_proc : process(tmp_reg_185, ap_reg_ppiten_pp0_it1, ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_sig_bdd_108)
    begin
                ap_sig_bdd_113 <= (not((tmp_reg_185 = ap_const_lv1_0)) and (ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_bdd_108)));
    end process;


    -- ap_sig_bdd_119 assign process. --
    ap_sig_bdd_119_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_sig_bdd_119 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    -- ap_sig_bdd_131 assign process. --
    ap_sig_bdd_131_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_131 <= (ap_const_lv1_1 = ap_CS_fsm(1 downto 1));
    end process;


    -- ap_sig_bdd_222 assign process. --
    ap_sig_bdd_222_assign_proc : process(ap_sig_cseq_ST_pp0_stg1_fsm_3, ap_sig_bdd_72, ap_reg_ppiten_pp0_it0, ap_reg_ppstg_tmp_reg_185_pp0_it1, ap_sig_bdd_87, ap_reg_ppiten_pp0_it1)
    begin
                ap_sig_bdd_222 <= ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg1_fsm_3) and not((ap_const_lv1_0 = ap_reg_ppstg_tmp_reg_185_pp0_it1)) and not(((ap_sig_bdd_72 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)) or (ap_sig_bdd_87 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))));
    end process;


    -- ap_sig_bdd_23 assign process. --
    ap_sig_bdd_23_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_23 <= (ap_CS_fsm(0 downto 0) = ap_const_lv1_1);
    end process;


    -- ap_sig_bdd_61 assign process. --
    ap_sig_bdd_61_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_61 <= (ap_const_lv1_1 = ap_CS_fsm(3 downto 3));
    end process;


    -- ap_sig_bdd_72 assign process. --
    ap_sig_bdd_72_assign_proc : process(yuv422_data_stream_0_V_empty_n, yuv422_data_stream_1_V_empty_n, tmp_reg_185)
    begin
                ap_sig_bdd_72 <= (((yuv422_data_stream_0_V_empty_n = ap_const_logic_0) and not((tmp_reg_185 = ap_const_lv1_0))) or (not((tmp_reg_185 = ap_const_lv1_0)) and (yuv422_data_stream_1_V_empty_n = ap_const_logic_0)));
    end process;


    -- ap_sig_bdd_87 assign process. --
    ap_sig_bdd_87_assign_proc : process(yuv444_data_stream_0_V_full_n, yuv444_data_stream_1_V_full_n, yuv444_data_stream_2_V_full_n, ap_reg_ppstg_tmp_reg_185_pp0_it1)
    begin
                ap_sig_bdd_87 <= (((yuv444_data_stream_0_V_full_n = ap_const_logic_0) and not((ap_const_lv1_0 = ap_reg_ppstg_tmp_reg_185_pp0_it1))) or (not((ap_const_lv1_0 = ap_reg_ppstg_tmp_reg_185_pp0_it1)) and (yuv444_data_stream_1_V_full_n = ap_const_logic_0)) or (not((ap_const_lv1_0 = ap_reg_ppstg_tmp_reg_185_pp0_it1)) and (yuv444_data_stream_2_V_full_n = ap_const_logic_0)));
    end process;


    -- ap_sig_cseq_ST_pp0_stg0_fsm_2 assign process. --
    ap_sig_cseq_ST_pp0_stg0_fsm_2_assign_proc : process(ap_sig_bdd_100)
    begin
        if (ap_sig_bdd_100) then 
            ap_sig_cseq_ST_pp0_stg0_fsm_2 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_pp0_stg0_fsm_2 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_pp0_stg1_fsm_3 assign process. --
    ap_sig_cseq_ST_pp0_stg1_fsm_3_assign_proc : process(ap_sig_bdd_61)
    begin
        if (ap_sig_bdd_61) then 
            ap_sig_cseq_ST_pp0_stg1_fsm_3 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_pp0_stg1_fsm_3 <= ap_const_logic_0;
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
    ap_sig_cseq_ST_st2_fsm_1_assign_proc : process(ap_sig_bdd_131)
    begin
        if (ap_sig_bdd_131) then 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_0;
        end if; 
    end process;

    exitcond_fu_144_p2 <= "1" when (p_s_reg_116 = yuv422_rows_V_read) else "0";
    i_V_fu_149_p2 <= std_logic_vector(unsigned(p_s_reg_116) + unsigned(ap_const_lv12_1));
    j_V_fu_160_p2 <= std_logic_vector(unsigned(p_1_phi_fu_131_p4) + unsigned(ap_const_lv12_2));

    -- p_1_phi_fu_131_p4 assign process. --
    p_1_phi_fu_131_p4_assign_proc : process(p_1_reg_127, tmp_reg_185, ap_reg_ppiten_pp0_it1, ap_sig_cseq_ST_pp0_stg0_fsm_2, j_V_reg_189)
    begin
        if ((not((tmp_reg_185 = ap_const_lv1_0)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and (ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2))) then 
            p_1_phi_fu_131_p4 <= j_V_reg_189;
        else 
            p_1_phi_fu_131_p4 <= p_1_reg_127;
        end if; 
    end process;

    tmp_fu_155_p2 <= "1" when (unsigned(p_1_phi_fu_131_p4) < unsigned(yuv422_cols_V_read)) else "0";

    -- yuv422_data_stream_0_V_read assign process. --
    yuv422_data_stream_0_V_read_assign_proc : process(ap_sig_cseq_ST_pp0_stg1_fsm_3, tmp_reg_185, ap_sig_bdd_72, ap_reg_ppiten_pp0_it0, ap_sig_bdd_87, ap_reg_ppiten_pp0_it1, ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_sig_bdd_108)
    begin
        if (((not((tmp_reg_185 = ap_const_lv1_0)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and (ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_bdd_108))) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg1_fsm_3) and not((tmp_reg_185 = ap_const_lv1_0)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not(((ap_sig_bdd_72 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)) or (ap_sig_bdd_87 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))))) then 
            yuv422_data_stream_0_V_read <= ap_const_logic_1;
        else 
            yuv422_data_stream_0_V_read <= ap_const_logic_0;
        end if; 
    end process;


    -- yuv422_data_stream_1_V_read assign process. --
    yuv422_data_stream_1_V_read_assign_proc : process(ap_sig_cseq_ST_pp0_stg1_fsm_3, tmp_reg_185, ap_sig_bdd_72, ap_reg_ppiten_pp0_it0, ap_sig_bdd_87, ap_reg_ppiten_pp0_it1, ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_sig_bdd_108)
    begin
        if (((not((tmp_reg_185 = ap_const_lv1_0)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and (ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_bdd_108))) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg1_fsm_3) and not((tmp_reg_185 = ap_const_lv1_0)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not(((ap_sig_bdd_72 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)) or (ap_sig_bdd_87 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))))) then 
            yuv422_data_stream_1_V_read <= ap_const_logic_1;
        else 
            yuv422_data_stream_1_V_read <= ap_const_logic_0;
        end if; 
    end process;

    yuv444_data_stream_0_V_din <= reg_139;

    -- yuv444_data_stream_0_V_write assign process. --
    yuv444_data_stream_0_V_write_assign_proc : process(ap_sig_cseq_ST_pp0_stg1_fsm_3, tmp_reg_185, ap_sig_bdd_72, ap_reg_ppiten_pp0_it0, ap_reg_ppstg_tmp_reg_185_pp0_it1, ap_sig_bdd_87, ap_reg_ppiten_pp0_it1, ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_sig_bdd_108)
    begin
        if (((not((tmp_reg_185 = ap_const_lv1_0)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and (ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_bdd_108))) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg1_fsm_3) and not((ap_const_lv1_0 = ap_reg_ppstg_tmp_reg_185_pp0_it1)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not(((ap_sig_bdd_72 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)) or (ap_sig_bdd_87 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))))) then 
            yuv444_data_stream_0_V_write <= ap_const_logic_1;
        else 
            yuv444_data_stream_0_V_write <= ap_const_logic_0;
        end if; 
    end process;

    yuv444_data_stream_1_V_din <= tmp_11_reg_194;

    -- yuv444_data_stream_1_V_write assign process. --
    yuv444_data_stream_1_V_write_assign_proc : process(ap_sig_cseq_ST_pp0_stg1_fsm_3, tmp_reg_185, ap_sig_bdd_72, ap_reg_ppiten_pp0_it0, ap_reg_ppstg_tmp_reg_185_pp0_it1, ap_sig_bdd_87, ap_reg_ppiten_pp0_it1, ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_sig_bdd_108)
    begin
        if (((not((tmp_reg_185 = ap_const_lv1_0)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and (ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_bdd_108))) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg1_fsm_3) and not((ap_const_lv1_0 = ap_reg_ppstg_tmp_reg_185_pp0_it1)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not(((ap_sig_bdd_72 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)) or (ap_sig_bdd_87 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))))) then 
            yuv444_data_stream_1_V_write <= ap_const_logic_1;
        else 
            yuv444_data_stream_1_V_write <= ap_const_logic_0;
        end if; 
    end process;


    -- yuv444_data_stream_2_V_din assign process. --
    yuv444_data_stream_2_V_din_assign_proc : process(yuv422_data_stream_1_V_dout, ap_reg_ppiten_pp0_it1, tmp_13_reg_199, ap_sig_bdd_113, ap_sig_bdd_222)
    begin
        if ((ap_const_logic_1 = ap_reg_ppiten_pp0_it1)) then
            if (ap_sig_bdd_222) then 
                yuv444_data_stream_2_V_din <= tmp_13_reg_199;
            elsif (ap_sig_bdd_113) then 
                yuv444_data_stream_2_V_din <= yuv422_data_stream_1_V_dout;
            else 
                yuv444_data_stream_2_V_din <= "XXXXXXXX";
            end if;
        else 
            yuv444_data_stream_2_V_din <= "XXXXXXXX";
        end if; 
    end process;


    -- yuv444_data_stream_2_V_write assign process. --
    yuv444_data_stream_2_V_write_assign_proc : process(ap_sig_cseq_ST_pp0_stg1_fsm_3, tmp_reg_185, ap_sig_bdd_72, ap_reg_ppiten_pp0_it0, ap_reg_ppstg_tmp_reg_185_pp0_it1, ap_sig_bdd_87, ap_reg_ppiten_pp0_it1, ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_sig_bdd_108)
    begin
        if (((not((tmp_reg_185 = ap_const_lv1_0)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and (ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_bdd_108))) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg1_fsm_3) and not((ap_const_lv1_0 = ap_reg_ppstg_tmp_reg_185_pp0_it1)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not(((ap_sig_bdd_72 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0)) or (ap_sig_bdd_87 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))))) then 
            yuv444_data_stream_2_V_write <= ap_const_logic_1;
        else 
            yuv444_data_stream_2_V_write <= ap_const_logic_0;
        end if; 
    end process;

end behav;
