library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_sistema is
end tb_sistema;

architecture Behavioral of tb_sistema is
component sistema is 
    Port(CLK: in std_logic;
       RST: in std_logic;
 	   USER_IN: in std_logic_vector(7 downto 0);
       CHECK: in std_logic;
       OK: out std_logic);
end component;
signal CLK,RST,CHECK,OK: std_logic;
signal USER_IN: std_logic_vector(7 downto 0);
begin
DUT: sistema port map(CLK,RST,USER_IN,CHECK,OK);

process
begin 
CLK<='0'; wait for 5ns;
CLK<='1'; wait for 5ns;
end process;

process begin
CHECK<='0'; wait for 10 ns;
USER_IN<="11111111"; wait for 10 ns;
CHECK<='1'; wait for 10 ns;
CHECK<='0'; wait for 10 ns;
USER_IN<="11101110"; wait for 10 ns;
CHECK<='1'; wait for 10 ns;
end process;

process begin
RST<='0'; wait for 10 ns;
RST<='1'; wait for 10 ns;
RST<='0'; wait;
end process;

end Behavioral;
