
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity RAM is
    port( CLK    : in  std_logic;-- Reloj
          RST    : in  std_logic;-- Reset
          Read   : in  std_logic;-- Leer la data de la RAM
          Write  : in  std_logic;--Flag para sobreescribir la data de la RAM
      	  Addr   : in  std_logic_vector(0 downto 0);--Parametro de entrada para acceder a la posicion de memoria deseada, en este caso solo hay 1
      	  D_in   : in  std_logic_vector(7 downto 0);--Entrada para la escritura de datos de la RAM vendrá del selector
      	  D_out  : out std_logic_vector(7 downto 0)--Salida de datos de la RAM
    );
end RAM;

architecture Behavior of RAM is
    type RAM_Array is array (0 to 0) of std_logic_vector(7 downto 0);-- Array de direcciones de memoria de la RAM en este caso solo hay una
    signal RAM_content : RAM_Array;
begin
    process(CLK)
    begin
        if (rising_edge(CLK)) then
            if(RST = '1') then
                D_out <= "ZZZZZZZZ";--Si estamos reseteando la RAM va a devolver ZZZZZZZZZ
            else
                if (Write = '1') then--Si estamos escribiendo pero no estamos leyendo 
                    RAM_content(conv_integer(Addr)) <= D_in;--Actualizamos lo que hay guardado en la única dirección de la RAM con lo que nos llega del Selector
                    D_out <= "ZZZZZZZZ";--Mientras estamos sobreescribiendo la RAM devolvemos ZZZZZZZ
                elsif (Read = '1') then--Si estamos leyendo de la RAM y no escribiendo
                    D_out <= RAM_content(conv_integer(Addr));--Devolvemos lo que hay en nuestra unica direccion de memoria
                else
                    D_out <= "ZZZZZZZZ";--Si hay algún error y se activan las dos flags a la vez, o no se activa ninguna devolvemos ZZZZZZ
                end if;
           end if;
        end if;
    end process;
end Behavior;
