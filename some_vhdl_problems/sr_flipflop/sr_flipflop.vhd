library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sr_flipflop is
    Port (
        clk : in  std_logic;
        S   : in  std_logic;
        R   : in  std_logic;
        Q   : out std_logic
    );
end sr_flipflop;

architecture Behavioral of sr_flipflop is
    signal q_reg : std_logic := '0';
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if (S = '1' and R = '0') then
                q_reg <= '1';
            elsif (S = '0' and R = '1') then
                q_reg <= '0';
            elsif (S = '0' and R = '0') then
                q_reg <= q_reg;  -- hold state
            else
                q_reg <= 'X';    -- invalid S = R = 1
            end if;
        end if;
    end process;

    Q <= q_reg;

end Behavioral;
