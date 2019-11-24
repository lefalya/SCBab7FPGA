library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity ____ is
  port(clk100  : in std_logic;
       red_out   : out std_logic_vector(____ (1));
       green_out : out std_logic_vector(____ (2));
       blue_out  : out std_logic_vector(____ (3)) ;
       hs_out    : out std_logic;
       vs_out    : out std_logic);
end ____;
 
architecture Behavioral of ____ is
signal clk25              : std_logic;
signal clk50				: std_logic;
signal horizontal_counter : std_logic_vector (9 downto 0);
signal vertical_counter   : std_logic_vector (9 downto 0);
 
begin
 
-- generate a 25Mhz clock
process (clk100)
variable cnt : integer := 0;
begin  
        if clk100'event and clk100 = '1' then
                clk50 <= not clk50;
                if cnt = 0 then
                        clk25 <= not clk25;
                        cnt := 1;
                else
                        cnt := 0;
                end if;
        end if;
end process;
 
process (clk25)
begin
  if clk25'event and clk25 = '1' then
     if (horizontal_counter >= ____ (4) ) -- 144
    and (horizontal_counter < ____(5) ) -- 784
    and (vertical_counter >= ____(6) ) -- 39
    and (vertical_counter < ____(7) ) -- 519
    then
 
     --here you paint!!
      red_out <= ____(8);
      green_out <= ____(9);
      blue_out <= ____(10);
 
    else
      red_out <= ____(11);
      green_out <= ____(12);
      blue_out <= ____(13);
    end if;
    if (horizontal_counter > "0000000000" )
      and (horizontal_counter < "0001100001" ) -- 96+1
    then
      hs_out <= '0';
    else
      hs_out <= '1';
    end if;
    if (vertical_counter > "0000000000" )
      and (vertical_counter < "0000000011" ) -- 2+1
    then
      vs_out <= '0';
    else
      vs_out <= '1';
    end if;
    horizontal_counter <= horizontal_counter+"0000000001";
    if (horizontal_counter="1100100000") then
      vertical_counter <= vertical_counter+"0000000001";
      horizontal_counter <= "0000000000";
    end if;
    if (vertical_counter="1000001001") then
      vertical_counter <= "0000000000";
    end if;
  end if;
end process;
 
end Behavioral;
