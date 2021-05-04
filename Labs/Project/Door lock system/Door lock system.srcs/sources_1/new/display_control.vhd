----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.04.2021 12:48:14
-- Design Name: 
-- Module Name: display_control - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display_control is
    Port ( button_0_i : in STD_LOGIC;
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
           display_1_o : out std_logic_vector(4 - 1 downto 0);
           display_2_o : out std_logic_vector(4 - 1 downto 0);
           display_3_o : out std_logic_vector(4 - 1 downto 0);
           display_4_o : out std_logic_vector(4 - 1 downto 0);
           passcode_1_o   : out std_logic_vector(4 - 1 downto 0);
           passcode_2_o   : out std_logic_vector(4 - 1 downto 0);
           passcode_3_o   : out std_logic_vector(4 - 1 downto 0);
           passcode_4_o   : out std_logic_vector(4 - 1 downto 0);
           relay_o      : out STD_LOGIC;
           seg_o : out std_logic_vector(7 - 1 downto 0);
           seg_2_o : out std_logic_vector(7 - 1 downto 0);
           seg_3_o : out std_logic_vector(7 - 1 downto 0);
           seg_4_o : out std_logic_vector(7 - 1 downto 0);
           clk   : in  std_logic);
end display_control;

architecture Behavioral of display_control is
    -- Pomocný vektor tlaèítka
    signal s_buttons  : std_logic_vector(12 - 1 downto 0);
    -- 
    signal s_internal_display_1_o : std_logic_vector(4 - 1 downto 0);
    signal s_internal_display_2_o : std_logic_vector(4 - 1 downto 0);
    signal s_internal_display_3_o : std_logic_vector(4 - 1 downto 0);
    signal s_internal_display_4_o : std_logic_vector(4 - 1 downto 0);
    signal s_internal_passcode_1_o   : std_logic_vector(4 - 1 downto 0);
    signal s_internal_passcode_2_o   : std_logic_vector(4 - 1 downto 0);
    signal s_internal_passcode_3_o   : std_logic_vector(4 - 1 downto 0);
    signal s_internal_passcode_4_o   : std_logic_vector(4 - 1 downto 0);
        signal s_internal2_display_1_o : std_logic_vector(4 - 1 downto 0);
    signal s_internal2_display_2_o : std_logic_vector(4 - 1 downto 0);
    signal s_internal2_display_3_o : std_logic_vector(4 - 1 downto 0);
    signal s_internal2_display_4_o : std_logic_vector(4 - 1 downto 0);
    signal s_internal2_passcode_1_o   : std_logic_vector(4 - 1 downto 0);
    signal s_internal2_passcode_2_o   : std_logic_vector(4 - 1 downto 0);
    signal s_internal2_passcode_3_o   : std_logic_vector(4 - 1 downto 0);
    signal s_internal2_passcode_4_o   : std_logic_vector(4 - 1 downto 0);
    signal s_cnt : natural;
    signal s_reset_cnt:std_logic;
    signal s_reset_disp:std_logic;
    signal s_set_disp:std_logic;
    signal s_set_password : boolean;
    signal s_display_time : natural;
begin
p_display_control: process(clk,button_0_i,button_1_i,button_2_i,button_3_i,button_4_i,button_5_i,button_6_i,button_7_i,button_8_i,button_9_i,button_reset_i,button_set_i,s_cnt,s_buttons,s_display_time,s_reset_cnt)
begin 
    --Transform inputs of buttons to 1 vector
    s_buttons(0) <= button_0_i;
    s_buttons(1) <= button_1_i;
    s_buttons(2) <= button_2_i;
    s_buttons(3) <= button_3_i;
    s_buttons(4) <= button_4_i;
    s_buttons(5) <= button_5_i;
    s_buttons(6) <= button_6_i;
    s_buttons(7) <= button_7_i;
    s_buttons(8) <= button_8_i;
    s_buttons(9) <= button_9_i;
    s_buttons(10) <= button_reset_i;
    s_buttons(11) <= button_set_i;
    --When button gets pushed s_cnt tells us which display is going to be set
    --If s_cnt =1 => First display will be set, s_cnt=2 => second display is going to be set
    if (rising_edge(button_0_i) or rising_edge(button_1_i)or rising_edge(button_2_i)or rising_edge(button_3_i)or rising_edge(button_4_i)or rising_edge(button_5_i)or rising_edge(button_6_i)or rising_edge(button_7_i)or rising_edge(button_8_i)or rising_edge(button_9_i)) then
        if s_cnt<4 then
        s_cnt <=s_cnt+1;
        end if;
    end if;
    --Button SET is used for PASSWORD CHANGE
    if(rising_edge(button_set_i)) then
            --if password is undefined. Password is set from current values on display
            if (s_internal_passcode_1_o ="UUUU") then
             
                s_internal_passcode_1_o <= s_internal_display_1_o;
                s_internal_passcode_2_o <= s_internal_display_2_o;
                s_internal_passcode_3_o <= s_internal_display_3_o;
                s_internal_passcode_4_o <= s_internal_display_4_o;
                s_set_disp<='1';
            else
            --Password is already set on some value. Check if password = display value. If yes display gets cleared and we can set new password
            --s_set_password is used to identify state when we are setting new password.
            if (s_internal_display_1_o = s_internal_passcode_1_o and s_internal_display_2_o = s_internal_passcode_2_o and s_internal_display_3_o = s_internal_passcode_3_o and s_internal_display_4_o = s_internal_passcode_4_o) then
                --Clear display
               
                s_internal_display_1_o<="0000";
                s_internal_display_2_o<="0000";
                s_internal_display_3_o<="0000";
                s_internal_display_4_o<="0000";
                
                s_reset_cnt<='1';
                s_reset_disp<='1';

                s_set_password<=true;
            else
            --if s_set_password is active we set password on new value from current value on display
            if (s_set_password=true) then
               
                s_internal_passcode_1_o <= s_internal_display_1_o;
                s_internal_passcode_2_o <= s_internal_display_2_o;
                s_internal_passcode_3_o <= s_internal_display_3_o;
                s_internal_passcode_4_o <= s_internal_display_4_o;
                
                s_set_disp<='1';
                s_set_password<=false;
            end if;
            end if;
            end if;
            end if;
    --RESET of display position counter        
    if(s_reset_cnt='1') then
    s_cnt<=0;
    s_reset_cnt<='0';
    end if;
    --RESET of display
    if(s_reset_disp='1') then
        s_internal2_display_1_o<="0000";
        s_internal2_display_2_o<="0000";
        s_internal2_display_3_o<="0000";
        s_internal2_display_4_o<="0000";
    s_reset_disp<='0';
    end if; 
    --SET of the new password
    if(s_set_disp='1') then
        s_internal2_passcode_1_o <= s_internal2_display_1_o;
        s_internal2_passcode_2_o <= s_internal2_display_2_o;
        s_internal2_passcode_3_o <= s_internal2_display_3_o;
        s_internal2_passcode_4_o <= s_internal2_display_4_o;
    s_set_disp<='0';
    end if; 
    --Case for setting values on displays. It uses s_cnt to identify which display is going to be set
    case s_buttons is
        when "000000000001" =>  --0
            case s_cnt is
                when 1 =>
                   -- display_1_o<="0000";
                    s_internal_display_1_o<="0000";
                    s_internal2_display_1_o<="0000";
                when 2 =>
                   -- display_2_o<="0000";
                    s_internal_display_2_o<="0000";
                    s_internal2_display_2_o<="0000";
                when 3 =>
                   -- display_3_o<="0000";
                    s_internal_display_3_o<="0000";
                    s_internal2_display_3_o<="0000";
                when 4 =>
                   -- display_4_o<="0000";
                    s_internal_display_4_o<="0000";
                    s_internal2_display_4_o<="0000";
                when others =>    
            end case;
        when "000000000010" => --1
            case s_cnt is
                when 1 =>
                   -- display_1_o<="0001";
                    s_internal_display_1_o<="0001";
                    s_internal2_display_1_o<="0001";
                when 2 =>
                   -- display_2_o<="0001";
                    s_internal_display_2_o<="0001";
                    s_internal2_display_2_o<="0001";
                when 3 =>
                   -- display_3_o<="0001";
                    s_internal_display_3_o<="0001";
                    s_internal2_display_3_o<="0001";
                when 4 =>
                   -- display_4_o<="0001";
                    s_internal_display_4_o<="0001";
                    s_internal2_display_4_o<="0001";
                    when others =>   
            end case;   
        when "000000000100" =>
            case s_cnt is
                when 1 =>
                   -- display_1_o<="0010";
                    s_internal_display_1_o<="0010";
                    s_internal2_display_1_o<="0010";
                when 2 =>
                   -- display_2_o<="0010";
                    s_internal_display_2_o<="0010";
                    s_internal2_display_2_o<="0010";
                when 3 =>
                   -- display_3_o<="0010";
                    s_internal_display_3_o<="0010";
                    s_internal2_display_3_o<="0010";
                when 4 =>
                   -- display_4_o<="0010";
                    s_internal_display_4_o<="0010";
                    s_internal2_display_4_o<="0010";
                    when others =>   
            end case;   
        when "000000001000" =>
            case s_cnt is
                when 1 =>
                   -- display_1_o<="0011";
                    s_internal_display_1_o<="0011";
                    s_internal2_display_1_o<="0011";
                when 2 =>
                   -- display_2_o<="0011";
                    s_internal_display_2_o<="0011";
                    s_internal2_display_2_o<="0011";
                when 3 =>
                   -- display_3_o<="0011";
                    s_internal_display_3_o<="0011";
                    s_internal2_display_3_o<="0011";
                when 4 =>
                   -- display_4_o<="0011";
                    s_internal_display_4_o<="0011";
                    s_internal2_display_4_o<="0011";
                    when others =>   
            end case;   
        when "000000010000" =>
            case s_cnt is
                when 1 =>
                   -- display_1_o<="0100";
                    s_internal_display_1_o<="0100";
                    s_internal2_display_1_o<="0100";
                when 2 =>
                   -- display_2_o<="0100";
                    s_internal_display_2_o<="0100";
                    s_internal2_display_2_o<="0100";
                when 3 =>
                   -- display_3_o<="0100";
                    s_internal_display_3_o<="0100";
                    s_internal2_display_3_o<="0100";
                when 4 =>
                   -- display_4_o<="0100";
                    s_internal_display_4_o<="0100";
                    s_internal2_display_4_o<="0100";
                    when others =>   
            end case;   
        when "000000100000" =>
            case s_cnt is
                when 1 =>
                   -- display_1_o<="0101";
                    s_internal_display_1_o<="0101";
                    s_internal2_display_1_o<="0101";
                when 2 =>
                   -- display_2_o<="0101";
                    s_internal_display_2_o<="0101";
                    s_internal2_display_2_o<="0101";
                when 3 =>
                   -- display_3_o<="0101";
                    s_internal_display_3_o<="0101";
                    s_internal2_display_3_o<="0101";
                when 4 =>
                   -- display_4_o<="0101";
                    s_internal_display_4_o<="0101";
                    s_internal2_display_4_o<="0101";
                    when others =>   
            end case;   
        when "000001000000" =>
            case s_cnt is
                when 1 =>
                   -- display_1_o<="0110";
                    s_internal_display_1_o<="0110";
                    s_internal2_display_1_o<="0110";
                when 2 =>
                   -- display_2_o<="0110";
                    s_internal_display_2_o<="0110";
                    s_internal2_display_2_o<="0110";
                when 3 =>
                   -- display_3_o<="0110";
                    s_internal_display_3_o<="0110";
                    s_internal2_display_3_o<="0110";
                when 4 =>
                   -- display_4_o<="0110";
                    s_internal_display_4_o<="0110";
                    s_internal2_display_4_o<="0110";
                    when others =>   
            end case;   
        when "000010000000" =>
            case s_cnt is
                when 1 =>
                   -- display_1_o<="0111";
                    s_internal_display_1_o<="0111";
                    s_internal2_display_1_o<="0111";
                when 2 =>
                   -- display_2_o<="0111";
                    s_internal_display_2_o<="0111";
                    s_internal2_display_2_o<="0111";
                when 3 =>
                   -- display_3_o<="0111";
                    s_internal_display_3_o<="0111";
                    s_internal2_display_3_o<="0111";
                when 4 =>
                   -- display_4_o<="0111";
                    s_internal_display_4_o<="0111";
                    s_internal2_display_4_o<="0111";
                    when others =>   
            end case;   
        when "000100000000" =>
            case s_cnt is
                when 1 =>
                   -- display_1_o<="1000";
                    s_internal_display_1_o<="1000";
                    s_internal2_display_1_o<="1000";
                when 2 =>
                   -- display_2_o<="1000";
                    s_internal_display_2_o<="1000";
                    s_internal2_display_2_o<="1000";
                when 3 =>
                   -- display_3_o<="1000";
                    s_internal_display_3_o<="1000";
                    s_internal2_display_3_o<="1000";
                when 4 =>
                   -- display_4_o<="1000";
                    s_internal_display_4_o<="1000";
                    s_internal2_display_4_o<="1000";
                    when others =>   
            end case;   
        when "001000000000" =>
            case s_cnt is
                when 1 =>
                   -- display_1_o<="1001";
                    s_internal_display_1_o<="1001";
                    s_internal2_display_1_o<="1001";
                when 2 =>
                   -- display_2_o<="1001";
                    s_internal_display_2_o<="1001";
                    s_internal2_display_2_o<="1001";
                when 3 =>
                   -- display_3_o<="1001";
                    s_internal_display_3_o<="1001";
                    s_internal2_display_3_o<="1001";
                when 4 =>
                   -- display_4_o<="1001";
                    s_internal_display_4_o<="1001";
                    s_internal2_display_4_o<="1001";
                    when others =>   
            end case;   
        when "010000000000" =>      --RESET
           -- display_1_o<="0000";
           -- display_2_o<="0000";
           -- display_3_o<="0000";
           -- display_4_o<="0000";
            s_internal_display_1_o<="0000";
            s_internal_display_2_o<="0000";
            s_internal_display_3_o<="0000";
            s_internal_display_4_o<="0000";
            s_internal2_display_1_o<="0000";
            s_internal2_display_2_o<="0000";
            s_internal2_display_3_o<="0000";
            s_internal2_display_4_o<="0000";
            s_cnt<=0;
            
        when others =>   
        
    end case;
    if (rising_edge(clk) and s_cnt>0) then
        s_display_time <=s_display_time+10;
    end if;
    
    if(s_cnt=0) then
        s_display_time <=0;
    end if;
    if(s_display_time>500) then
       -- display_1_o<="0000";
       -- display_2_o<="0000";
       -- display_3_o<="0000";
       -- display_4_o<="0000";
        s_internal_display_1_o<="0000";
        s_internal_display_2_o<="0000";
        s_internal_display_3_o<="0000";
        s_internal_display_4_o<="0000";
        s_cnt<=0;
        s_reset_disp<='1';
        s_display_time<=0;
    end if;   

    --Relay Control
    --Activates the relay if displayed numbers on numbers = PASSCODE
    if (s_internal2_display_1_o = s_internal2_passcode_1_o and s_internal2_display_2_o = s_internal2_passcode_2_o and s_internal2_display_3_o = s_internal2_passcode_3_o and s_internal2_display_4_o = s_internal2_passcode_4_o) then
               relay_o <= '1';
            else
                relay_o <= '0';
            end if;     
            
   --HEX7SEQ     
  -- Translates binary signal (0000 = number 0) to input for 7segment display                                                                                                  
   case s_internal2_display_1_o is
            when "0000" =>
                seg_o <= "0000001";     --0
            when "0001" =>
                seg_o <= "1001111";     --1
            when "0010" =>
                seg_o <= "0010010";     --2  
            when "0011" =>
                seg_o <= "0000110";     --3
            when "0100" =>
                seg_o <= "1001100";     --4
            when "0101" =>
                seg_o <= "0100100";     --5
            when "0110" =>
                seg_o <= "0100000";     --6
            when "0111" =>
                seg_o <= "0001111";     --7
            when "1000" =>
                seg_o <= "0000000";     --8
            when "1001" =>
                seg_o <= "0000100";     --9
            when "1010" =>
                seg_o <= "0001000";     --A
            when "1011" =>
                seg_o <= "1100000";     --B
            when "1100" =>
                seg_o <= "0110001";     --C
            when "1101" =>
                seg_o <= "1000010";     --D   
            when "1110" =>
                seg_o <= "0110000";     --E
            when others =>
                seg_o <= "0111000";     --F
        end case;
        
        case s_internal2_display_2_o is
            when "0000" =>
                seg_2_o <= "0000001";     --0
            when "0001" =>
                seg_2_o <= "1001111";     --1
            when "0010" =>
                seg_2_o <= "0010010";     --2  
            when "0011" =>
                seg_2_o <= "0000110";     --3
            when "0100" =>
                seg_2_o <= "1001100";     --4
            when "0101" =>
                seg_2_o <= "0100100";     --5
            when "0110" =>
                seg_2_o <= "0100000";     --6
            when "0111" =>
                seg_2_o <= "0001111";     --7
            when "1000" =>
                seg_2_o <= "0000000";     --8
            when "1001" =>
                seg_2_o <= "0000100";     --9
            when "1010" =>
                seg_2_o <= "0001000";     --A
            when "1011" =>
                seg_2_o <= "1100000";     --B
            when "1100" =>
                seg_2_o <= "0110001";     --C
            when "1101" =>
                seg_2_o <= "1000010";     --D   
            when "1110" =>
                seg_2_o <= "0110000";     --E
            when others =>
                seg_2_o <= "0111000";     --F
        end case;
        
        case s_internal2_display_3_o is
            when "0000" =>
                seg_3_o <= "0000001";     --0
            when "0001" =>
                seg_3_o <= "1001111";     --1
            when "0010" =>
                seg_3_o <= "0010010";     --2  
            when "0011" =>
                seg_3_o <= "0000110";     --3
            when "0100" =>
                seg_3_o <= "1001100";     --4
            when "0101" =>
                seg_3_o <= "0100100";     --5
            when "0110" =>
                seg_3_o <= "0100000";     --6
            when "0111" =>
                seg_3_o <= "0001111";     --7
            when "1000" =>
                seg_3_o <= "0000000";     --8
            when "1001" =>
                seg_3_o <= "0000100";     --9
            when "1010" =>
                seg_3_o <= "0001000";     --A
            when "1011" =>
                seg_3_o <= "1100000";     --B
            when "1100" =>
                seg_3_o <= "0110001";     --C
            when "1101" =>
                seg_3_o <= "1000010";     --D   
            when "1110" =>
                seg_3_o <= "0110000";     --E
            when others =>
                seg_3_o <= "0111000";     --F
        end case;
        
        case s_internal2_display_4_o is
            when "0000" =>
                seg_4_o <= "0000001";     --0
            when "0001" =>
                seg_4_o <= "1001111";     --1
            when "0010" =>
                seg_4_o <= "0010010";     --2  
            when "0011" =>
                seg_4_o <= "0000110";     --3
            when "0100" =>
                seg_4_o <= "1001100";     --4
            when "0101" =>
                seg_4_o <= "0100100";     --5
            when "0110" =>
                seg_4_o <= "0100000";     --6
            when "0111" =>
                seg_4_o <= "0001111";     --7
            when "1000" =>
                seg_4_o <= "0000000";     --8
            when "1001" =>
                seg_4_o <= "0000100";     --9
            when "1010" =>
                seg_4_o <= "0001000";     --A
            when "1011" =>
                seg_4_o <= "1100000";     --B
            when "1100" =>
                seg_4_o <= "0110001";     --C
            when "1101" =>
                seg_4_o <= "1000010";     --D   
            when "1110" =>
                seg_4_o <= "0110000";     --E
            when others =>
                seg_4_o <= "0111000";     --F
        end case;
end process p_display_control;
end Behavioral;
