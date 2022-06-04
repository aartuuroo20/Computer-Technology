----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.01.2022 13:26:52
-- Design Name: 
-- Module Name: Sistema - Behavioral
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

entity Sistema is
Port (CLK: in std_logic;
       RST: in std_logic;
 	   USER_IN: in std_logic_vector(7 downto 0);
       CHECK: in std_logic;
       Change_password: in std_logic;
       New_password: out std_logic_vector(7 downto 0);
       OK: out std_logic
       );
end Sistema;

architecture Behavioral of Sistema is
	component RAM is
    		Port( CLK   : in  std_logic;                    -- Clock
                w_r_en : in  std_logic;                        -- Write
                D_in  : in  std_logic_vector(7 downto 0);     -- Data In (8 bits)
                D_out : out std_logic_vector(7 downto 0)      -- Data Out (8 bits)
                );
	end component;
	
    component contador is
        Port ( CLK : in std_logic;
        RST : in std_logic;
        CHECK: in std_logic;
        OK: in std_logic;
        Y : out std_logic );
    end component;
    
signal D_aux, user_in_aux, New_password_aux : std_logic_vector(7 downto 0);
signal Y_aux, OK_aux, E_aux, Read_aux, Write_aux: std_logic;

begin
	RAM1 : RAM  port map(
    	CLK   => CLK,
    	w_r_en => Write_aux,
    	D_in => New_password_aux,
        D_out => D_aux
	);
	
	CONTADOR1: contador port map(
	CLK=>CLK,
	RST=>RST,
	CHECK=>CHECK,
	OK=>OK_aux,
	Y=>Y_aux
	);
	

	
process(CLK)begin
	if(rising_edge(CLK))then
		if(RST = '1')then
			user_in_aux <= "ZZZZZZZZ";
		else
			user_in_aux <= user_in;
		end if;
	end if;
end process;

process(CHECK) begin
if(y_aux /= '1')then
    if(Change_password = '0')then
        Write_aux <= '0';
        if(CHECK = '1')then
		  if(user_in_aux = D_aux)then
			OK <= '1';
			OK_aux <= '1';
		else
			OK <= '0';
		end if;
	else
		OK<= 'U'; --Salida sin definir
	end if;
	else
	Write_aux <= '1';
	   if(Write_aux <= '1')then --Se activa la señal de escritura
	       New_password_aux <= user_in_aux; 
	       New_password <= New_password_aux;
	   else
	       New_password <= "ZZZZZZZZ";
	   end if;
 end if;
end if;
end process;
end Behavioral;
