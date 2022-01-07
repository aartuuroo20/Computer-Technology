
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;         

entity ROM is
    port( CLK, RST   : in  std_logic;                        --Reloj
          Read  : in  std_logic;                        -- Leer de la ROM
      	  Addr  : in  std_logic_vector(0 downto 0);     -- Direccion de donde sacar la data de la ROM en este caso sólo hay 1
      	  D_out : out std_logic_vector(7 downto 0)      -- Salida de la Data de la ROM en este caso la contraseña 0xEE
    );
end ROM;


architecture Behavior of ROM is
 
    type ROM_Array is array (0 to 0) of std_logic_vector(7 downto 0); -- Array de direcciones de memoria de la ROM en este caso solo hay una
    constant ROM_content : ROM_Array := (
        0 => X"EE",-- Contenido de la única direccion de memoria de la ROM
        others => X"00"--Contenido del resto de direcciones de memoria
    );
begin

    process(CLK)
    begin
        if (rising_edge(CLK)) then
            if(RST = '1') then
                D_out <= "ZZZZZZZZ";--Si activamos el reset la ROM devuelve ZZZZZZZZZ 
            else
                if (Read = '1') then--Si la flag de lectura de la ROM esta activada
                    D_out <= ROM_content(conv_integer(addr));--Sacamos la data que hay contenida en la direccion que le pasamos por addr
                else
                    D_out <= "ZZZZZZZZ";-- si no esta activada la flag de lectura devolvemos zzzzz
                end if;
            end if;
        end if;
    end process;
end Behavior;
