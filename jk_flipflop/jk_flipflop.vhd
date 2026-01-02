library ieee;
use ieee.std_logic_1164.all;

entity jk_flipflop is
    port(
        clk,j,k : in std_logic;
        q : out std_logic
    );
end entity;

architecture beh of jk_flipflop is
    signal q_prev : std_logic;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if j = '0' and k = '0' then
                q_prev <= q_prev;
            elsif j = '0' and k = '1' then
                q_prev <= '0';
            elsif j = '1' and k = '0' then
                q_prev <= '1';
            elsif j = '1' and k = '1' then
                q_prev <= not q_prev;
            end if;
        end if;
    end process;
    q <= q_prev;
end architecture;