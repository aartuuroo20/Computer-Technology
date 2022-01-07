library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Complete_Design is
end tb_Complete_Design;

architecture Behavioral of tb_Complete_Design is
    component Complete_Design is
        Port ( CLK, RST, W, C : in std_logic;
          DATA     : in std_logic_vector(7 downto 0);
          OK       : out std_logic;
          BOMB     : out std_logic
          );
    end component;
    signal CLK, RST, W, C, OK,BOMB : std_logic;
    signal DATA  : std_logic_vector(7 downto 0);
begin
    CompleteDesign: Complete_Design port map(CLK=>CLK, RST=>RST, W=>W,
                              C=>C, DATA=>DATA, OK=>OK,BOMB=>BOMB);
   process begin
        CLK <= '1'; wait for 10 ns;
        CLK <= '0'; wait for 10 ns;
    end process;
    process begin
        RST <= '0'; wait;
    end process;
    process begin
        C <= '1'; wait;

    end process;
    process begin
        W <= '0'; wait;
    end process;
    process begin
        DATA <= X"AA"; wait for 100ns;
        DATA <= X"EE"; wait for 100 ns;
        DATA <= X"BB"; wait;
    end process; 
end Behavioral;
