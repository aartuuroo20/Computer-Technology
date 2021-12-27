library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BancoMemorias is
    port( CLK, RST, R_ROM : in  std_logic;-- Reloj,Reset y flag de lectura de la rom
          DATA_IN: in std_logic_vector(7 downto 0);--Data que se va a comparar con lo que hay en la memoria
          OK: out std_logic--Señal de verificacion de la comparacion
    );
end BancoMemorias;

architecture Structural of BancoMemorias is
    component ROM is 
        port( CLK, RST   : in  std_logic;               --Reloj
          Read  : in  std_logic;                       --leer de la ROM (Viene desde la fsm)
      	  Addr  : in  std_logic_vector(0 downto 0);     -- Direccion de la que vamos  a leer de la ROM
      	  D_out : out std_logic_vector(7 downto 0)      -- Salida de datos de la ROM
        );
    end component;
    component Comparator is
        Port (Exin, ROMin : in std_logic_vector(7 downto 0);--Entrada de datos externa y entrada de datos de la memoria (Señales que se van a comparar)
              Checker : out std_logic;--Señal de salida, se activara cuando las entradas sean iguales
              CLK, RST: in std_logic--Reloj y reset
        );
    end component;
  constant addr : std_logic_vector(0 downto 0) := (0 => '0');  --Señal auxiliar para indicar la direccion de memoria a obtener de la ROM
signal data_aux, data_selected, d_out : std_logic_vector(7 downto 0); --Señales auxiliares
begin
    ROM1 : ROM port map(CLK => CLK,RST => RST, Read => R_ROM, Addr => addr, D_out =>data_aux);
    Comp: Comparator port map(Exin=>DATA_IN, ROMin=>data_aux, Checker=>OK, CLK=>CLK,RST => RST);
    
    
end Structural;
