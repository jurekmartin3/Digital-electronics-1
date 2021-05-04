----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.04.2021 19:11:45
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( --CLK
           CLK100MHZ : in STD_LOGIC;
            --Displays
           ja :out std_logic_vector(7 - 1 downto 0);
           jb :out std_logic_vector(7 - 1 downto 0);
           jc :out std_logic_vector(7 - 1 downto 0);
           jd : out std_logic_vector(7 - 1 downto 0);
           --Buttons
           ck_io0:in std_logic;
           ck_io1:in std_logic; 
           ck_io2:in std_logic; 
           ck_io3:in std_logic; 
           ck_io4:in std_logic; 
           ck_io5:in std_logic; 
           ck_io6:in std_logic; 
           ck_io7:in std_logic; 
           ck_io8:in std_logic; 
           ck_io9:in std_logic; 
           ck_io10:in std_logic; 
           ck_io11:in std_logic;
           --Relay  
           ck_io12:out std_logic     
           
    );
end top;

architecture Behavioral of top is

begin
    door_lock_system: entity work.door_lock_system
    port map(
        clk =>CLK100MHZ,
        button_0_i =>ck_io0,
        button_1_i =>ck_io1,
        button_2_i =>ck_io2,
        button_3_i =>ck_io3,
        button_4_i =>ck_io4,
        button_5_i =>ck_io5,
        button_6_i =>ck_io6,
        button_7_i =>ck_io7,
        button_8_i =>ck_io8,
        button_9_i =>ck_io9,
        button_reset_i =>ck_io10,
        button_set_i =>ck_io11,
        relay_o =>ck_io12,
        seg_o(0) =>ja(0),
        seg_o(1) =>ja(1),
        seg_o(2) =>ja(2),
        seg_o(3) =>ja(3),
        seg_o(4) =>ja(4),
        seg_o(5) =>ja(5),
        seg_o(6) =>ja(6),
        seg_2_o(0) =>jb(0),
        seg_2_o(1) =>jb(1),
        seg_2_o(2) =>jb(2),
        seg_2_o(3) =>jb(3),
        seg_2_o(4) =>jb(4),
        seg_2_o(5) =>jb(5),
        seg_2_o(6) =>jb(6),
        seg_3_o(0) =>jc(0),
        seg_3_o(1) =>jc(1),
        seg_3_o(2) =>jc(2),
        seg_3_o(3) =>jc(3),
        seg_3_o(4) =>jc(4),
        seg_3_o(5) =>jc(5),
        seg_3_o(6) =>jc(6),
        seg_4_o(0) =>jd(0),
        seg_4_o(1) =>jd(1),
        seg_4_o(2) =>jd(2),
        seg_4_o(3) =>jd(3),
        seg_4_o(4) =>jd(4),
        seg_4_o(5) =>jd(5),
        seg_4_o(6) =>jd(6)
    );

end Behavioral;
