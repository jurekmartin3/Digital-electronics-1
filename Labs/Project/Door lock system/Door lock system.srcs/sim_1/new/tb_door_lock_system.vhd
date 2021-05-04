----------------------------------------------------------------------------------
-- Company: 
-- Engeer: 
-- 
-- Create Date: 14.04.2021 15:52:49
-- Design Name: 
-- Module Name: tb_door_lock_system - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the followg library declaration if usg
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the followg library declaration if stantiatg
-- any Xilx leaf cells  this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_door_lock_system is
--  Port ( );
end tb_door_lock_system;

architecture testbench of tb_door_lock_system is
    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;
    signal s_clk_100MHz : std_logic;
    signal s_button_0 :  STD_LOGIC;
    signal s_button_1 :  STD_LOGIC;
    signal s_button_2 :  STD_LOGIC;
    signal s_button_3 :  STD_LOGIC;
    signal s_button_4 :  STD_LOGIC;
    signal s_button_5 :  STD_LOGIC;
    signal s_button_6 :  STD_LOGIC;
    signal s_button_7 :  STD_LOGIC;
    signal s_button_8 :  STD_LOGIC;
    signal s_button_9 :  STD_LOGIC;
    signal s_button_reset :  STD_LOGIC;
    signal s_button_set :  STD_LOGIC;         
    signal s_relay_o :  STD_LOGIC;
    signal s_seg_o :  std_logic_vector(7 - 1 downto 0);
    signal s_seg_2_o :  std_logic_vector(7 - 1 downto 0);
    signal s_seg_3_o :  std_logic_vector(7 - 1 downto 0);
    signal s_seg_4_o :  std_logic_vector(7 - 1 downto 0);

begin
	uut_display_control : entity work.door_lock_system
        port map(
            clk     => s_clk_100MHz,
            button_0_i	=>	s_button_0,
            button_1_i	=>	s_button_1,
            button_2_i	=>  s_button_2,
            button_3_i	=>	s_button_3,
            button_4_i	=>	s_button_4,
            button_5_i	=>	s_button_5,
            button_6_i	=>	s_button_6,
            button_7_i	=>	s_button_7,
            button_8_i	=>	s_button_8,
            button_9_i	=>	s_button_9,
            button_reset_i	=>	s_button_reset,
            button_set_i	=>	s_button_set,
            seg_o	=>	s_seg_o,
            seg_2_o	=>	s_seg_2_o,
            seg_3_o	=>	s_seg_3_o,
            seg_4_o	=>	s_seg_4_o,
            relay_o=> s_relay_o
            );
           
--------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 7500 ns loop         -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;
	p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        s_button_1 <= '0';
        wait for 10ns;
        s_button_1 <= '1';
        s_button_0 <= '0';
        s_button_2 <= '0';
        s_button_3 <= '0';
        s_button_4 <= '0';
        s_button_5 <= '0';
        s_button_6 <= '0';
        s_button_7 <= '0';
        s_button_8 <= '0';
        s_button_9 <= '0';
        s_button_reset <= '0';
        s_button_set <= '0';
		wait for 50ns;
		s_button_1 <= '0';
		wait for 50ns;
		s_button_1 <= '1';
		wait for 50ns;
		s_button_1 <= '0';
		wait for 10ns;
		
		s_button_9 <= '1';
		wait for 50ns;
		s_button_9 <= '0';
		wait for 10ns;
		
		s_button_6 <= '1';
		wait for 50ns;
		s_button_6 <= '0';
		wait for 10ns;
		
		
		s_button_reset <= '1';
		wait for 50ns;
		s_button_reset <= '0';
		wait for 100ns;
		
		s_button_4 <= '1';
		wait for 50ns;
		s_button_4 <= '0';
		wait for 10ns;
		
		s_button_5 <= '1';
		wait for 50ns;
		s_button_5 <= '0';
		wait for 10ns;
		
		s_button_8 <= '1';
		wait for 50ns;
		s_button_8 <= '0';
		wait for 10ns;
		
		s_button_3 <= '1';
		wait for 50ns;
		s_button_3 <= '0';
		wait for 10ns;
		
		s_button_set <='1';
		wait for 50ns;
		s_button_set <='0';
		wait for 10ns;
		
		s_button_reset <= '1';
		wait for 50ns;
		s_button_reset <= '0';
		wait for 10ns;
		
		s_button_4 <= '1';
		wait for 50ns;
		s_button_4 <= '0';
		wait for 10ns;
		
		s_button_5 <= '1';
		wait for 50ns;
		s_button_5 <= '0';
		wait for 10ns;
		
		s_button_8 <= '1';
		wait for 50ns;
		s_button_8 <= '0';
		wait for 10ns;
		
		s_button_3 <= '1';
		wait for 50ns;
		s_button_3 <= '0';
		wait for 10ns;
		
		s_button_set <='1';
		wait for 50ns;
		s_button_set <='0';
		wait for 10ns;
		
		s_button_9 <= '1';
		wait for 50ns;
		s_button_9 <= '0';
		wait for 10ns;
		
		s_button_6 <= '1';
		wait for 50ns;
		s_button_6 <= '0';
		wait for 10ns;
		
		s_button_9 <= '1';
		wait for 50ns;
		s_button_9 <= '0';
		wait for 50ns;
		
		s_button_6 <= '1';
		wait for 50ns;
		s_button_6 <= '0';
		wait for 10ns;
		
		s_button_set <='1';
		wait for 50ns;
		s_button_set <='0';
		wait for 10ns;
		
		s_button_reset <= '1';
		wait for 50ns;
		s_button_reset <= '0';
		wait for 10ns;
		
		s_button_9 <= '1';
		wait for 50ns;
		s_button_9 <= '0';
		wait for 10ns;
		
		s_button_6 <= '1';
		wait for 50ns;
		s_button_6 <= '0';
		wait for 10ns;
		
		s_button_9 <= '1';
		wait for 50ns;
		s_button_9 <= '0';
		wait for 50ns;
		
		s_button_5 <= '1';
		wait for 50ns;
		s_button_5 <= '0';
		wait for 10ns;
		
		s_button_set <='1';
		wait for 50ns;
		s_button_set <='0';
		wait for 10ns;
		
		s_button_reset <= '1';
		wait for 50ns;
		s_button_reset <= '0';
		wait for 10ns;
		
		s_button_9 <= '1';
		wait for 50ns;
		s_button_9 <= '0';
		wait for 10ns;
		
		s_button_6 <= '1';
		wait for 50ns;
		s_button_6 <= '0';
		wait for 10ns;
		
		s_button_9 <= '1';
		wait for 50ns;
		s_button_9 <= '0';
		wait for 50ns;
		
		s_button_6 <= '1';
		wait for 50ns;
		s_button_6 <= '0';
		wait for 10ns;
		
		s_button_set <='1';
		wait for 50ns;
		s_button_set <='0';
		wait for 10ns;
		
		s_button_reset <= '1';
		wait for 50ns;
		s_button_reset <= '0';
		wait for 10ns;
		
		s_button_1 <= '1';
		wait for 50ns;
		s_button_1 <= '0';
		wait for 10ns;
		
		s_button_2 <= '1';
		wait for 50ns;
		s_button_2 <= '0';
		wait for 10ns;
		
		s_button_3 <= '1';
		wait for 50ns;
		s_button_3 <= '0';
		wait for 50ns;
		
		s_button_4 <= '1';
		wait for 50ns;
		s_button_4 <= '0';
		wait for 10ns;
		
		s_button_set <='1';
		wait for 50ns;
		s_button_set <='0';
		wait for 10ns;
		
		s_button_reset <= '1';
		wait for 50ns;
		s_button_reset <= '0';
		wait for 10ns;
		
		s_button_1 <= '1';
		wait for 50ns;
		s_button_1 <= '0';
		wait for 10ns;
		
		s_button_2 <= '1';
		wait for 50ns;
		s_button_2 <= '0';
		wait for 10ns;
		
		s_button_3 <= '1';
		wait for 50ns;
		s_button_3 <= '0';
		wait for 50ns;
		
		s_button_4 <= '1';
		wait for 50ns;
		s_button_4 <= '0';
		wait for 10ns;
		
		--s_button_set <='1';
		--wait for 50ns;
		--s_button_set <='0';
		--wait for 10ns;
		
		
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
end testbench;
