library ieee;
use ieee.std_logic_1164.all;

entity t_flipflop is
    port(
        clk : in std_logic;
        d : in std_logic;
        q : out std_logic
    );
end entity;

architecture beh of t_flipflop is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            q<= not d;
        end if;
    end process;
end architecture;