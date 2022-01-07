library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

    entity Complete_Design is
    Port ( CLK, RST, W, C : in std_logic;
          DATA     : in std_logic_vector(7 downto 0);
          OK       : out std_logic;
          BOMB     : out std_logic
          );
end Complete_Design;

architecture Structural of Complete_Design is
-- Define components
    component FSM is
        port( CLK, RST, Comp, Esc : in  std_logic;
              OK: in std_logic;
              BLOQUEO: out std_logic;
              DATA: in std_logic_vector(7 downto 0);
              DataRAM: out std_logic_vector(7 downto 0);
               LectROM, LectRAM, EscRAM : out std_logic
        );
    end component;
        component BancoMemorias is
            port( CLK, RST, R_ROM, R_RAM, W_RAM,SE : in  std_logic;
              DATA_IN: in std_logic_vector(7 downto 0);
              OK: out std_logic
        );
    end component;
     -- Define signals
     signal CHECK_OUT, readRom, R_RAM, W_RAM, OK_AUX : std_logic;
     signal DATA_IN : std_logic_vector(7 downto 0); 
begin
   Banco_Memorias : BancoMemorias port map(CLK=>CLK, RST=>RST,
                              R_ROM => readRom, R_RAM=>R_RAM, W_RAM=>W_RAM,
                              DATA_IN=>DATA_IN, OK=>OK_AUX,SE=>W
                              );
   MaquinaEst   : FSM    port map(CLK=>CLK, RST=>RST, Comp=>C,
                              Esc=>W, OK=>OK_AUX, BLOQUEO=>BOMB, DATA=>DATA, 
                              DataRAM => DATA_IN,
                              LectROM => readRom, LectRAM=>R_RAM, EscRAM=>W_RAM);
   
   OK <= OK_AUX;
end Structural;
