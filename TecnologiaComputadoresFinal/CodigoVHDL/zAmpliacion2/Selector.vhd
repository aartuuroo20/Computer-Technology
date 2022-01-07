library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--Componente que deja pasar lo que hay metida en la ROM si no hemos sobreescrito la contraseña o deja pasar la nueva data a la RAM si la estamos sobreescribiendo
entity Selector is
    Port ( Rin        : in std_logic_vector(7 downto 0);--Entrada de datos de la ROM
           Exin        : in std_logic_vector(7 downto 0);--Entrada de datos externa
           OutRAM        : out std_logic_vector(7 downto 0);--Salida de datos hacia la RAM
           CLK, RST,WOR : in std_logic--Reloj y Reset
    );
end Selector;

architecture Behavioral of Selector is
begin
    process(CLK) begin
        if(rising_edge(CLK)) then
            if(RST = '1') then--Si estamos reseteando le pasamos ZZZZ a la RAM
                OutRAM <= "ZZZZZZZZ";
            else
                if(WOR='1')then
                    OutRAM <= Exin;
                else
                    OutRAM <= Rin;--Si si esta definida le pasamos la data externa a la RAM par sobreescribir
                    
                end if;
            end if;
        end if;
    end process;
end Behavioral;
