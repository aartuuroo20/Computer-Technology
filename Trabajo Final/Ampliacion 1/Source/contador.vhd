library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador is
Port ( CLK : in std_logic;
RST : in std_logic;
CHECK: in std_logic;
OK: in std_logic;
Y : out std_logic );
end contador;

architecture Behavioral of contador is
signal cuenta : integer range 0 to 3; --Cuenta hasta 3
begin
process (CLK) begin
if (rising_edge(CLK)) then
    if (RST = '1') then --Se reinicia la cuenta al llegar reset a 1
        cuenta <= 0;
        Y <= '0';
    else
        if(OK = '1')then
            cuenta <= 0; --Se reinicia la cuenta al introducir la contraseña correcta
        else
            if (cuenta < 3) then
                if(CHECK = '1')then
                    cuenta <= cuenta + 1;
                    Y <= '0';
                end if;
            else
                Y <= '1';
            end if;
        end if;
    end if;
end if;
end process;

end Behavioral;
