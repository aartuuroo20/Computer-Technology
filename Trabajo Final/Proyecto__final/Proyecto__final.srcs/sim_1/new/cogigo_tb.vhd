----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.01.2021 11:32:32
-- Design Name: 
-- Module Name: cogigo_tb - Behavioral
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
entity cogigo_tb is
end cogigo_tb;

architecture Behavioral of cogigo_tb is
    component codigo
    Port (
            CLK: in std_logic;
            RST: in std_logic;
            COIN_IN: inout integer;
            COIN_OUT: out integer
            );
    end component;
    signal CLK : std_logic;
    signal RST : std_logic;
    signal COIN_IN : integer;
    constant CLK_FREQ : integer := 100000000;
    type statetype is (S0, S1, S2);
    signal currentState, nextState : statetype;
begin
    
    DUT : port map(CLK,RST, COIN_IN);
    process 
    begin
        CLK <= '0';
        wait 10ns;
        CLK <= '1';
        wait 50ms;
    end process;
    

end Behavioral;
