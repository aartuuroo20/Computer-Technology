library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Complete_Design is
    Port ( CLK, RST, C : in std_logic;
          DATA     : in std_logic_vector(7 downto 0);
          OK       : out std_logic;
          BOMB     : out std_logic
          );
end Complete_Design;

architecture Structural of Complete_Design is
-- Define components
    component FSM is
       port( CLK, RST, Comp : in  std_logic;--Reloj,Reset,Comprobar contraseña,Escritura de nueva contraseña
         OK: in std_logic;--Comprobación de que la contraseña coincide con la entrada, viene del comparator
         BLOQUEO : out std_logic;--Señal que bloquea la entrada de datos si se han cometido 3 errores
         DATA: in std_logic_vector(7 downto 0);--Data introducida por el usuario
         DataROM: out std_logic_vector(7 downto 0);--Data que irá al comparador para comprobar la contraseña
         LectROM : out std_logic--Flags que indicarán el comportamiento del banco de memoria
        );
    end component;
        component BancoMemorias is
            port( CLK, RST, R_ROM : in  std_logic;
              DATA_IN: in std_logic_vector(7 downto 0);
              OK: out std_logic
        );
    end component;
     -- Define signals
     signal CHECK_OUT, R_ROM,OK_AUX : std_logic;
     signal DATA_IN : std_logic_vector(7 downto 0); 
begin
   Banco_Memorias : BancoMemorias port map(CLK=>CLK, RST=>RST,
                              R_ROM => R_ROM,
                              DATA_IN=>DATA_IN, OK=>OK_AUX
                              );
   MaquinEst   : FSM    port map(CLK=>CLK, RST=>RST, Comp=>C,
                              OK=>OK_AUX, BLOQUEO=>BOMB, DATA=>DATA, 
                              DataROM => DATA_IN,
                              LectROM => R_ROM );
   
   OK <= OK_AUX;
end Structural;
