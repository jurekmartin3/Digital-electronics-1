----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.04.2021 20:11:48
-- Design Name: 
-- Module Name: door_lock_system - Behavioral
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

entity door_lock_system is
    Port ( clk     : in  std_logic;
           button_0_i : in STD_LOGIC;
           button_1_i : in STD_LOGIC;
           button_2_i : in STD_LOGIC;
           button_3_i : in STD_LOGIC;
           button_4_i : in STD_LOGIC;
           button_5_i : in STD_LOGIC;
           button_6_i : in STD_LOGIC;
           button_7_i : in STD_LOGIC;
           button_8_i : in STD_LOGIC;
           button_9_i : in STD_LOGIC;
           button_reset_i : in STD_LOGIC;
           button_set_i : in STD_LOGIC;
           relay_o      : out STD_LOGIC;
           seg_o : out std_logic_vector(7 - 1 downto 0);
           seg_2_o : out std_logic_vector(7 - 1 downto 0);
           seg_3_o : out std_logic_vector(7 - 1 downto 0);
           seg_4_o : out std_logic_vector(7 - 1 downto 0)
    );
end door_lock_system;

architecture Behavioral of door_lock_system is
    signal s_internal_display_1 : std_logic_vector(4 - 1 downto 0);
    signal s_internal_display_2 : std_logic_vector(4 - 1 downto 0);
    signal s_internal_display_3 : std_logic_vector(4 - 1 downto 0);
    signal s_internal_display_4 : std_logic_vector(4 - 1 downto 0);
    
    signal s_internal_passcode_1   : std_logic_vector(4 - 1 downto 0);
    signal s_internal_passcode_2   : std_logic_vector(4 - 1 downto 0);
    signal s_internal_passcode_3   : std_logic_vector(4 - 1 downto 0);
    signal s_internal_passcode_4   : std_logic_vector(4 - 1 downto 0);
begin
        disp_cnt: entity work.display_control
        port map (
            button_0_i=>button_0_i,
            button_1_i=>button_1_i,
            button_2_i=>button_2_i,
            button_3_i=>button_3_i,
            button_4_i=>button_4_i,
            button_5_i=>button_5_i,
            button_6_i=>button_6_i,
            button_7_i=>button_7_i,
            button_8_i=>button_8_i,
            button_9_i=>button_9_i,
            button_reset_i=>button_reset_i,
            button_set_i=>button_set_i,        
           display_1_o=>s_internal_display_1,
           display_2_o=>s_internal_display_2,
           display_3_o=>s_internal_display_3,
           display_4_o=>s_internal_display_4,
           passcode_1_o=>s_internal_passcode_1,
           passcode_2_o=>s_internal_passcode_2,
           passcode_3_o=>s_internal_passcode_3,
           passcode_4_o=>s_internal_passcode_4,
           relay_o=>relay_o,
           seg_o=>seg_o,
           seg_2_o=>seg_2_o,
           seg_3_o=>seg_3_o,
           seg_4_o=>seg_4_o,
           clk=>clk
        );
        
        --relay_cnt: entity work.relay_control
            --port map (
                --passcode_1=>s_internal_passcode_1,
                --passcode_2=>s_internal_passcode_2,
                --passcode_3=>s_internal_passcode_3,
                --passcode_4=>s_internal_passcode_4,
                --display_1=>internal2_display_1,
                --display_2=>internal2_display_2,
                --display_3=>internal2_display_3,
                --display_4=>internal2_display_4,
                --relay_o=>relay_o
           -- ); 
        
        --hex_7seg: entity work.hex_7seg
          --  port map(
            --    hex_i=>internal3_display_1,
              --  hex_2_i=>internal3_display_2,
              --  hex_3_i=>internal3_display_3,
               -- hex_4_i=>internal3_display_4,
               -- seg_o=>seg_o,
               -- seg_2_o=>seg_2_o,
               -- seg_3_o=>seg_3_o,
               -- seg_4_o=>seg_4_o
           -- );    
    
end Behavioral;
