----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.01.2022 13:25:03
-- Design Name: 
-- Module Name: RAM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
    Port( CLK   : in  std_logic;                    -- Clock
      w_r_en : in  std_logic;                        -- Write
      D_in  : in  std_logic_vector(7 downto 0); 
      --addr: in std_logic_vector(1 downto 0); 
      D_out : out std_logic_vector(7 downto 0)      -- Data Out (8 bits)
    );
end RAM;

architecture Behavioral of RAM is
 type RAM_Array is array (0 to 1) of std_logic_vector(7 downto 0);
    signal RAM_content : RAM_Array:=(
        0=>"11101110",
        others=>"00000000"
        );

begin
    process(CLK)
    begin
        if(rising_edge(CLK))then
            if(w_r_en = '1')then
                RAM_CONTENT(0) <= D_in;
                --RAM_CONTENT(to_integer(unsigned(addr))) <= D_in;
                D_out <= "ZZZZZZZZ";
            end if;
            D_out <= RAM_CONTENT(0);
            --D_out <= RAM_CONTENT(to_integer(unsigned(addr)));
         end if;
    end process;
end Behavioral;
