library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_contador is
end tb_contador;

architecture Behavioral of tb_contador is
component contador is
port ( CLK : in std_logic;
RST : in std_logic;
CHECK: in std_logic;
OK_in: in std_logic;
Y : out std_logic
);
end component;
signal CLK, RST, CHECK, Y, OK_in : std_logic;
begin
DUT : contador port map(CLK, RST,CHECK,OK_in, Y);
process begin
CLK <= '0'; wait for 50 ns;
CLK <= '1'; wait for 50 ns;
end process;

process begin
--RST <= '0'; wait for 10 ns;
RST <= '1'; wait for 70 ns;
RST <= '0'; wait;
end process;

process begin
CHECK <= '0'; wait for 50 ns;
CHECK <= '1'; wait for 50 ns;
end process;

process begin
OK_in <= '0'; wait for 100 ns;
OK_in <= '1'; wait for 50 ns;

end process;

end Behavioral;
