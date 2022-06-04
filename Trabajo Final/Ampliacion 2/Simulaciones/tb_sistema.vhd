----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.01.2022 09:42:37
-- Design Name: 
-- Module Name: tb_sistema - Behavioral
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

entity tb_sistema is
end tb_sistema;

architecture Behavioral of tb_sistema is
component sistema is 
    Port(CLK: in std_logic;
       RST: in std_logic;
 	   USER_IN: in std_logic_vector(7 downto 0);
       CHECK: in std_logic;
       Change_password: in std_logic;
       New_password: out std_logic_vector(7 downto 0);
       OK: out std_logic);
end component;
signal CLK,RST,CHECK_aux,OK_aux, Change_password_aux: std_logic;
signal USER_IN_aux, New_password_aux: std_logic_vector(7 downto 0);
begin

DUT: sistema port map(CLK => CLK,RST => RST,USER_IN => USER_IN_aux,CHECK => CHECK_aux,Change_password => Change_password_aux,New_password => New_password_aux,OK => OK_aux);

process begin
    CLK<='0'; wait for 5ns;
    CLK<='1'; wait for 5ns;
end process;

process begin
change_password_aux <= '0'; wait for 10ns;
 CHECK_aux <= '0'; wait for 10ns;
 RST <= '0'; wait for 10ns;
 user_in_aux <= "11111100"; wait for 10ns;
 check_aux <= '1'; wait for 10ns;
end process;

end Behavioral;
