----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2021 14:26:20
-- Design Name: 
-- Module Name: tb_jk_ff_rst - Behavioral
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

entity tb_jk_ff_rst is
--  Port ( );
end tb_jk_ff_rst;

architecture Behavioral of tb_jk_ff_rst is
     constant c_CLK_100MHZ_PERIOD : time := 10 ns;
     
     signal s_clk  :std_logic; 
     signal s_rst  :std_logic; 
     signal s_d     :std_logic; 
     signal s_q     :std_logic; 
     signal s_q_bar :std_logic; 

begin
 uut_jk_ff_rst : entity work.jk_ff_rst
        port map(
            clk => s_clk100MHZ,
            rst => s_rst,
            d => s_d,
            q => s_q,
            q_bar => s_q_bar
        );


end Behavioral;
