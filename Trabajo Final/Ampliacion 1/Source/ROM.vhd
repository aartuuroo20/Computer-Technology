
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ROM is
Port(CLK   : in  std_logic;                    	-- Clock
     Read  : in  std_logic;                    	-- Read
  	 D_out : out std_logic_vector(7 downto 0) 	-- Data Out (8 bits)
);
end ROM;

architecture Behavioral of ROM is
type ROM_Array is array (0 to 0) of std_logic_vector(7 downto 0);
constant ROM_content : ROM_Array := (
    	0=> "11101110",
    	others=>"00000000");
begin
process(CLK)
	begin
    	if (rising_edge(CLK)) then
               	if (Read = '1') then
            		D_out <= ROM_content(0);
        		else
            		D_out <= "ZZZZZZZZ";
        		end if;
    	end if;

end process;
end Behavioral;
