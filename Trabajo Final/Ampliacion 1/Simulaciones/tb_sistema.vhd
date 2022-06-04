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
       OK: inout std_logic);
end component;
signal CLK,RST,CHECK,OK: std_logic;
signal USER_IN: std_logic_vector(7 downto 0);
begin

DUT: sistema port map(CLK => CLK,RST => RST,USER_IN => USER_IN,CHECK => CHECK,OK => OK);

process
begin 
CLK<='0'; wait for 5ns;
CLK<='1'; wait for 5ns;
end process;

process begin
  CHECK <= '0'; wait for 10ns;
  RST <= '0'; wait for 10ns;
  user_in <= "11111111"; wait for 10ns;
    check <= '1'; wait for 10ns;
  check <= '0'; wait for 10ns;-- si check no cambia no se vuelve a entrar en el process(check)
    user_in <= "11111110"; wait for 10ns;
  check <= '1'; wait for 10ns;
  check <= '0'; wait for 10ns;
  user_in <= "10101111"; wait for 10ns;
  check <= '1'; wait for 10ns;
  check <= '0'; wait for 10ns;
  user_in <= "11101110"; wait for 10ns;
  check <= '1'; wait for 10ns;
  check <= '0'; wait for 10ns;
  RST <= '1'; wait for 10ns;--reseteamos y probamos de nuevo a ver si cambia ok
    RST <= '0'; wait for 10ns;-- 10 ns es el tiempo predeterminado del rising edge si lo bajamos hay problemas
end process;

end Behavioral;
