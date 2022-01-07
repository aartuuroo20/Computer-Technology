library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BancoMemorias is
    port( CLK, RST, R_ROM, R_RAM, W_RAM,SE : in  std_logic;
          DATA_IN: in std_logic_vector(7 downto 0);
          OK: out std_logic
    );
end BancoMemorias;

architecture Structural of BancoMemorias is
    -- Define components
    component RAM is
        port( CLK    : in  std_logic;                        -- Clock
          RST    : in  std_logic;                        -- Reset
          Read   : in  std_logic;                        -- Read
          Write  : in  std_logic;                        -- Write
      	  Addr   : in  std_logic_vector(0 downto 0);     -- Address (1 bits)
      	  D_in   : in  std_logic_vector(7 downto 0);     -- Data In (8 bits)
      	  D_out  : out std_logic_vector(7 downto 0)      -- Data Out (8 bits)
    );
    end component;
    
    component ROM is 
        port( CLK, RST   : in  std_logic;                        -- Clock
          Read  : in  std_logic;                        -- Read
      	  Addr  : in  std_logic_vector(0 downto 0);     -- Address (2 bits)
      	  D_out : out std_logic_vector(7 downto 0)      -- Data Out (8 bits)
        );
    end component;
    component Selector is
        Port ( Rin        : in std_logic_vector(7 downto 0);
               Exin         : in std_logic_vector(7 downto 0);
               OutRAM         : out std_logic_vector(7 downto 0);
               CLK, RST,WOR  : in std_logic
        );
    end component;


    component Comparator is
        Port (Exin, RAMin : in std_logic_vector(7 downto 0);
              Checker : out std_logic;
              CLK, RST: in std_logic
        );
    end component;
    -- Define FSM States
    type state_type is (S0, S1, S2, S3, S4, S5);
    signal currentState, nextState : state_type;   
    -- Define intern signals
    constant addr : std_logic_vector(0 downto 0) := (0 => '0'); --In this case, we just have one address so it's constant.
    signal data_aux, data_selected, dram_out : std_logic_vector(7 downto 0);
    
begin
    -- Instantiate the components
    ROM1 : ROM port map(CLK => CLK,RST => RST, Read => R_ROM, Addr => addr, D_out =>data_aux);
    Sel : Selector   port map(Rin=>data_aux, Exin=>data_in, OutRAM=> data_selected, CLK=> CLK, RST => RST,WOR=>SE);
    RAM1 : RAM port map(CLK => CLK, RST=>RST,Read =>R_RAM, Write => W_RAM,Addr => addr, D_in => data_selected, D_out => dram_out);
    Comp: Comparator port map(Exin=>DATA_IN, RAMin=>dram_out, Checker=>OK, CLK=>CLK,RST => RST);
    
    
end Structural;
