library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sistema is
Port (CLK: in std_logic;
       RST: in std_logic;
 	   USER_IN: in std_logic_vector(7 downto 0);
       CHECK: in std_logic;
       OK: out std_logic
       );
end sistema;

architecture Behavioral of sistema is
	component ROM is
    		port(CLK   : in  std_logic;                     -- Clock
          		Read  : in  std_logic;                    	-- Read
           		D_out : out std_logic_vector(7 downto 0)  	-- Data Out (8 bits)
    		);
	end component;
	
    component contador is
        Port ( CLK : in std_logic;
        RST : in std_logic;
        CHECK: in std_logic;
        OK: in std_logic;
        Y : out std_logic );
    end component;

    
signal D_aux, user_in_aux : std_logic_vector(7 downto 0);
signal Y_aux, OK_aux, Read_aux: std_logic;

begin
	ROM1 : ROM  port map(
    	CLK   => CLK,
    	Read  => Read_aux,
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
Read_aux <= '1'; --Encendemos la ROM
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
    OK <='Z'; --Sistema bloqueado
end if;
end process;
end Behavioral;

