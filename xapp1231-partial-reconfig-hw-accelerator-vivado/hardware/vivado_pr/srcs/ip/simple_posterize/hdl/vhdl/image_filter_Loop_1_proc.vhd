-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2014.4
-- Copyright (C) 2014 Xilinx Inc. All rights reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity image_filter_Loop_1_proc is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    rows_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    rows_empty_n : IN STD_LOGIC;
    rows_read : OUT STD_LOGIC;
    cols_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    cols_empty_n : IN STD_LOGIC;
    cols_read : OUT STD_LOGIC;
    img_0_data_stream_0_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    img_0_data_stream_0_V_empty_n : IN STD_LOGIC;
    img_0_data_stream_0_V_read : OUT STD_LOGIC;
    img_0_data_stream_1_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    img_0_data_stream_1_V_empty_n : IN STD_LOGIC;
    img_0_data_stream_1_V_read : OUT STD_LOGIC;
    img_1_data_stream_0_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    img_1_data_stream_0_V_full_n : IN STD_LOGIC;
    img_1_data_stream_0_V_write : OUT STD_LOGIC;
    img_1_data_stream_1_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    img_1_data_stream_1_V_full_n : IN STD_LOGIC;
    img_1_data_stream_1_V_write : OUT STD_LOGIC );
end;


architecture behav of image_filter_Loop_1_proc is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_st2_fsm_1 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_pp0_stg0_fsm_2 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_st5_fsm_3 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv11_0 : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    constant ap_const_lv12_0 : STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
    constant ap_const_lv11_1 : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
    constant ap_const_lv12_1 : STD_LOGIC_VECTOR (11 downto 0) := "000000000001";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm_0 : STD_LOGIC;
    signal ap_sig_bdd_23 : BOOLEAN;
    signal col_i_reg_139 : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_fu_151_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_reg_223 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_sig_bdd_65 : BOOLEAN;
    signal tmp_5_fu_155_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_5_reg_228 : STD_LOGIC_VECTOR (11 downto 0);
    signal exitcond1_i_fu_163_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_cseq_ST_st2_fsm_1 : STD_LOGIC;
    signal ap_sig_bdd_77 : BOOLEAN;
    signal row_fu_168_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal row_reg_237 : STD_LOGIC_VECTOR (10 downto 0);
    signal exitcond_i_fu_174_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal exitcond_i_reg_242 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_cseq_ST_pp0_stg0_fsm_2 : STD_LOGIC;
    signal ap_sig_bdd_88 : BOOLEAN;
    signal ap_reg_ppiten_pp0_it0 : STD_LOGIC := '0';
    signal ap_sig_bdd_105 : BOOLEAN;
    signal ap_reg_ppiten_pp0_it1 : STD_LOGIC := '0';
    signal col_fu_179_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal row_i_reg_128 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_sig_cseq_ST_st5_fsm_3 : STD_LOGIC;
    signal ap_sig_bdd_129 : BOOLEAN;
    signal row_cast_i_fu_159_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_7_fu_185_p4 : STD_LOGIC_VECTOR (2 downto 0);
    signal tmp_8_fu_204_p4 : STD_LOGIC_VECTOR (2 downto 0);
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
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((exitcond1_i_fu_163_p2 = ap_const_lv1_0)))) then 
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
                if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not((ap_sig_bdd_105 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))) and not((exitcond_i_fu_174_p2 = ap_const_lv1_0)))) then 
                    ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (exitcond1_i_fu_163_p2 = ap_const_lv1_0))) then 
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
                if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not((ap_sig_bdd_105 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))) and (exitcond_i_fu_174_p2 = ap_const_lv1_0))) then 
                    ap_reg_ppiten_pp0_it1 <= ap_const_logic_1;
                elsif ((((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (exitcond1_i_fu_163_p2 = ap_const_lv1_0)) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not((ap_sig_bdd_105 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))) and not((exitcond_i_fu_174_p2 = ap_const_lv1_0))))) then 
                    ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    -- col_i_reg_139 assign process. --
    col_i_reg_139_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_105 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))) and (exitcond_i_fu_174_p2 = ap_const_lv1_0))) then 
                col_i_reg_139 <= col_fu_179_p2;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (exitcond1_i_fu_163_p2 = ap_const_lv1_0))) then 
                col_i_reg_139 <= ap_const_lv12_0;
            end if; 
        end if;
    end process;

    -- row_i_reg_128 assign process. --
    row_i_reg_128_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(ap_sig_bdd_65))) then 
                row_i_reg_128 <= ap_const_lv11_0;
            elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st5_fsm_3)) then 
                row_i_reg_128 <= row_reg_237;
            end if; 
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not((ap_sig_bdd_105 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))) then
                exitcond_i_reg_242 <= exitcond_i_fu_174_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then
                row_reg_237 <= row_fu_168_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(ap_sig_bdd_65))) then
                tmp_5_reg_228 <= tmp_5_fu_155_p1;
                tmp_reg_223 <= tmp_fu_151_p1;
            end if;
        end if;
    end process;

    -- the next state (ap_NS_fsm) of the state machine. --
    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_sig_bdd_65, exitcond1_i_fu_163_p2, exitcond_i_fu_174_p2, ap_reg_ppiten_pp0_it0, ap_sig_bdd_105, ap_reg_ppiten_pp0_it1)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not(ap_sig_bdd_65)) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_st2_fsm_1 => 
                if (not((exitcond1_i_fu_163_p2 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                else
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_2;
                end if;
            when ap_ST_pp0_stg0_fsm_2 => 
                if (not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_105 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))) and not((exitcond_i_fu_174_p2 = ap_const_lv1_0))))) then
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_2;
                elsif (((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_105 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))) and not((exitcond_i_fu_174_p2 = ap_const_lv1_0)))) then
                    ap_NS_fsm <= ap_ST_st5_fsm_3;
                else
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_2;
                end if;
            when ap_ST_st5_fsm_3 => 
                ap_NS_fsm <= ap_ST_st2_fsm_1;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;

    -- ap_done assign process. --
    ap_done_assign_proc : process(ap_done_reg, exitcond1_i_fu_163_p2, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if (((ap_const_logic_1 = ap_done_reg) or ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((exitcond1_i_fu_163_p2 = ap_const_lv1_0))))) then 
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
    ap_ready_assign_proc : process(exitcond1_i_fu_163_p2, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((exitcond1_i_fu_163_p2 = ap_const_lv1_0)))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_bdd_105 assign process. --
    ap_sig_bdd_105_assign_proc : process(img_0_data_stream_0_V_empty_n, img_0_data_stream_1_V_empty_n, img_1_data_stream_0_V_full_n, img_1_data_stream_1_V_full_n, exitcond_i_reg_242)
    begin
                ap_sig_bdd_105 <= (((img_0_data_stream_0_V_empty_n = ap_const_logic_0) and (exitcond_i_reg_242 = ap_const_lv1_0)) or ((exitcond_i_reg_242 = ap_const_lv1_0) and (img_0_data_stream_1_V_empty_n = ap_const_logic_0)) or ((exitcond_i_reg_242 = ap_const_lv1_0) and (img_1_data_stream_0_V_full_n = ap_const_logic_0)) or ((exitcond_i_reg_242 = ap_const_lv1_0) and (img_1_data_stream_1_V_full_n = ap_const_logic_0)));
    end process;


    -- ap_sig_bdd_129 assign process. --
    ap_sig_bdd_129_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_129 <= (ap_const_lv1_1 = ap_CS_fsm(3 downto 3));
    end process;


    -- ap_sig_bdd_23 assign process. --
    ap_sig_bdd_23_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_23 <= (ap_CS_fsm(0 downto 0) = ap_const_lv1_1);
    end process;


    -- ap_sig_bdd_65 assign process. --
    ap_sig_bdd_65_assign_proc : process(ap_start, ap_done_reg, rows_empty_n, cols_empty_n)
    begin
                ap_sig_bdd_65 <= ((cols_empty_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    -- ap_sig_bdd_77 assign process. --
    ap_sig_bdd_77_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_77 <= (ap_const_lv1_1 = ap_CS_fsm(1 downto 1));
    end process;


    -- ap_sig_bdd_88 assign process. --
    ap_sig_bdd_88_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_88 <= (ap_const_lv1_1 = ap_CS_fsm(2 downto 2));
    end process;


    -- ap_sig_cseq_ST_pp0_stg0_fsm_2 assign process. --
    ap_sig_cseq_ST_pp0_stg0_fsm_2_assign_proc : process(ap_sig_bdd_88)
    begin
        if (ap_sig_bdd_88) then 
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
    ap_sig_cseq_ST_st2_fsm_1_assign_proc : process(ap_sig_bdd_77)
    begin
        if (ap_sig_bdd_77) then 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st5_fsm_3 assign process. --
    ap_sig_cseq_ST_st5_fsm_3_assign_proc : process(ap_sig_bdd_129)
    begin
        if (ap_sig_bdd_129) then 
            ap_sig_cseq_ST_st5_fsm_3 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st5_fsm_3 <= ap_const_logic_0;
        end if; 
    end process;

    col_fu_179_p2 <= std_logic_vector(unsigned(col_i_reg_139) + unsigned(ap_const_lv12_1));

    -- cols_read assign process. --
    cols_read_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, ap_sig_bdd_65)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(ap_sig_bdd_65))) then 
            cols_read <= ap_const_logic_1;
        else 
            cols_read <= ap_const_logic_0;
        end if; 
    end process;

    exitcond1_i_fu_163_p2 <= "1" when (row_cast_i_fu_159_p1 = tmp_reg_223) else "0";
    exitcond_i_fu_174_p2 <= "1" when (col_i_reg_139 = tmp_5_reg_228) else "0";

    -- img_0_data_stream_0_V_read assign process. --
    img_0_data_stream_0_V_read_assign_proc : process(exitcond_i_reg_242, ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_sig_bdd_105, ap_reg_ppiten_pp0_it1)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (exitcond_i_reg_242 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not((ap_sig_bdd_105 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))) then 
            img_0_data_stream_0_V_read <= ap_const_logic_1;
        else 
            img_0_data_stream_0_V_read <= ap_const_logic_0;
        end if; 
    end process;


    -- img_0_data_stream_1_V_read assign process. --
    img_0_data_stream_1_V_read_assign_proc : process(exitcond_i_reg_242, ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_sig_bdd_105, ap_reg_ppiten_pp0_it1)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (exitcond_i_reg_242 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not((ap_sig_bdd_105 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))) then 
            img_0_data_stream_1_V_read <= ap_const_logic_1;
        else 
            img_0_data_stream_1_V_read <= ap_const_logic_0;
        end if; 
    end process;

    img_1_data_stream_0_V_din <= (tmp_7_fu_185_p4 & ap_const_lv5_0);

    -- img_1_data_stream_0_V_write assign process. --
    img_1_data_stream_0_V_write_assign_proc : process(exitcond_i_reg_242, ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_sig_bdd_105, ap_reg_ppiten_pp0_it1)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (exitcond_i_reg_242 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not((ap_sig_bdd_105 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))) then 
            img_1_data_stream_0_V_write <= ap_const_logic_1;
        else 
            img_1_data_stream_0_V_write <= ap_const_logic_0;
        end if; 
    end process;

    img_1_data_stream_1_V_din <= (tmp_8_fu_204_p4 & ap_const_lv5_0);

    -- img_1_data_stream_1_V_write assign process. --
    img_1_data_stream_1_V_write_assign_proc : process(exitcond_i_reg_242, ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_sig_bdd_105, ap_reg_ppiten_pp0_it1)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (exitcond_i_reg_242 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not((ap_sig_bdd_105 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))) then 
            img_1_data_stream_1_V_write <= ap_const_logic_1;
        else 
            img_1_data_stream_1_V_write <= ap_const_logic_0;
        end if; 
    end process;

    row_cast_i_fu_159_p1 <= std_logic_vector(resize(unsigned(row_i_reg_128),12));
    row_fu_168_p2 <= std_logic_vector(unsigned(row_i_reg_128) + unsigned(ap_const_lv11_1));

    -- rows_read assign process. --
    rows_read_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, ap_sig_bdd_65)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(ap_sig_bdd_65))) then 
            rows_read <= ap_const_logic_1;
        else 
            rows_read <= ap_const_logic_0;
        end if; 
    end process;

    tmp_5_fu_155_p1 <= cols_dout(12 - 1 downto 0);
    tmp_7_fu_185_p4 <= img_0_data_stream_0_V_dout(7 downto 5);
    tmp_8_fu_204_p4 <= img_0_data_stream_1_V_dout(7 downto 5);
    tmp_fu_151_p1 <= rows_dout(12 - 1 downto 0);
end behav;