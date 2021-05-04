----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.04.2021 18:51:40
-- Design Name: 
-- Module Name: tb_relay_control - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_relay_control is
--  Port ( );
end tb_relay_control;

architecture testbench of tb_relay_control is
    signal s_passcode_1 :  std_logic_vector(4 - 1 downto 0);
    signal s_passcode_2 :  std_logic_vector(4 - 1 downto 0);
    signal s_passcode_3 :  std_logic_vector(4 - 1 downto 0);
    signal s_passcode_4 :  std_logic_vector(4 - 1 downto 0);
    signal s_display_1  :  std_logic_vector(4 - 1 downto 0);
    signal s_display_2  :  std_logic_vector(4 - 1 downto 0);
    signal s_display_3  :  std_logic_vector(4 - 1 downto 0);
    signal s_display_4  :  std_logic_vector(4 - 1 downto 0);
    signal s_relay_o    :  STD_LOGIC;

begin
    uut_relay_control : entity work.relay_control
        port map(
           display_1_i	=>	s_display_1,
           display_2_i	=>	s_display_2,
           display_3_i	=>	s_display_3,
           display_4_i	=>	s_display_4,
           passcode_1_i   =>  s_passcode_1,
           passcode_2_i   =>  s_passcode_2,
           passcode_3_i   =>  s_passcode_3,
           passcode_4_i   =>  s_passcode_4,
           relay_o      =>  s_relay_o
           );
           
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
            s_passcode_1 <= "0001";
            s_passcode_2 <= "0010";
            s_passcode_3 <= "0011";
            s_passcode_4 <= "0100";
            
            s_display_1 <= "0001";
            s_display_2 <= "0110";
            s_display_3 <= "0011";
            s_display_4 <= "0110";
            wait for 20ns;
            
            s_display_1 <= "0001";
            s_display_2 <= "0010";
            s_display_3 <= "0011";
            s_display_4 <= "0100";
            wait for 20ns;
            
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
end testbench;