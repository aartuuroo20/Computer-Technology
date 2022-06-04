----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.12.2020 19:44:42
-- Design Name: 
-- Module Name: codigo - Structural
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

 

entity codigo is
Port (
        CLK: in std_logic;
        RST: in std_logic;
        COIN_IN: inout integer;
        COIN_OUT: out integer
        );
end codigo;

architecture Behavioral of codigo is
    constant CLK_FREQ : integer := 100000000;
    type statetype is (S0, S1, S2);
    signal currentState, nextState : statetype;
begin
    process(CLK) begin
        if (rising_edge(CLK)) then
        if(RST = '1') then
        currentState <= S0;
        else
        currentState <= nextState;
        end if;
        end if;
    end process;
    process(currentState, COIN_IN)
        variable COIN_IN_2 : integer:=0;
    begin
        case currentState is
        when S0 => if(COIN_IN = 2 and COIN_IN = 5) then
                        nextState <= S2;
                   elsif (COIN_IN = 1) then
                        nextState <= S1;
                   end if;
        when S1 => 
            --value_coin := COIN_IN +1;
            COIN_IN_2 := COIN_IN +1;
            COIN_IN <= COIN_IN_2;
            nextState <= S2;
        when S2 =>
            --LATA <= 2;
            if(COIN_IN = 2 and COIN_IN = 5 and COIN_IN = 3 and COIN_IN = 6) then
                COIN_OUT <= COIN_IN - 2;
            end if;
        end case;
    end process;    
end Behavioral;
