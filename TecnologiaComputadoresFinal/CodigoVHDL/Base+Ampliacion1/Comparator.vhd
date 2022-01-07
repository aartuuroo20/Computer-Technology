library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--Componente que va a comparar lo que le entra de data externa con lo que hay contenido dentro de la ROM
entity Comparator is
    Port ( Exin : in std_logic_vector(7 downto 0);--Entrada externa de datos(Lo que va a introducir el usuario)
           ROMin : in std_logic_vector(7 downto 0);--Lo que hay almacenado en la ROM
           Checker : out std_logic;--Salida final que indicara cuando coinciden la contraseña guardada y la data introducida
           CLK, RST : in std_logic--Reloj y reset
    );
end Comparator;

architecture Behavioral of Comparator is

begin
    process(CLK) begin
        if(rising_edge(CLK)) then
            if(RST = '1') then--Si estamos reseteando la salida no se activará
                Checker <= '0';
            else
                if(Exin = ROMin) then--Si coincide la data introducida con la data almacenada
                    if (Exin = "ZZZZZZZZ" or ROMin = "ZZZZZZZZ") then--Si alguna de la data es ZZZZZZ quiere decir que o estamos reseteando
                        Checker <= '0';--Entonces la salida tendrá que ser 0
                    else
                        Checker <= '1';--Si Las entradas coinciden y ninguna es ZZZZZZZ quiere decir que tenemos una coincidencia 
                                       --Por lo que la salida se activará
                    end if;
                else
                    Checker <= '0';--En cualquier otro caso(Si hay algun error) la salida será desactivada
                end if;
            end if;
        end if;
    end process;
end Behavioral;
