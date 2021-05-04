----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.04.2021 18:15:58
-- Design Name: 
-- Module Name: relay_control - Behavioral
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

entity relay_control is
    Port (     
           passcode_1_i   : in std_logic_vector(4 - 1 downto 0);
           passcode_2_i   : in std_logic_vector(4 - 1 downto 0);
           passcode_3_i   : in std_logic_vector(4 - 1 downto 0);
           passcode_4_i   : in std_logic_vector(4 - 1 downto 0);
           display_1_i    : in std_logic_vector(4 - 1 downto 0);
           display_2_i    : in std_logic_vector(4 - 1 downto 0);
           display_3_i    : in std_logic_vector(4 - 1 downto 0);
           display_4_i    : in std_logic_vector(4 - 1 downto 0);
           relay_o      : out STD_LOGIC
         );
end relay_control;

architecture Behavioral of relay_control is

begin
    --Activates the relay if displayed numbers on numbers = PASSCODE
    p_relay_control : process(passcode_1_i,passcode_2_i,passcode_3_i,passcode_4_i,display_1_i,display_2_i,display_3_i,display_4_i)
        begin
            if (display_1_i = passcode_1_i and display_2_i = passcode_2_i and display_3_i = passcode_3_i and display_4_i = passcode_4_i) then
                relay_o <= '1';
            else
                relay_o <= '0';
            end if;
    end process p_relay_control;

end Behavioral;
