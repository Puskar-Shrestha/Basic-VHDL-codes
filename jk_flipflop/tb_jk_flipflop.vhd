library ieee;
use ieee.std_logic_1164.all;

entity tb_jk_flipflop is
end entity;

architecture beh of tb_jk_flipflop is
    signal j,k,clk,q : std_logic;
    constant clk_period :time := 10 ns;
begin
    uut: entity work.jk_flipflop
        port map(
            j => j,
            k => k,
            clk => clk,
            q => q
        );
    
    process
    begin
        while true loop
            clk <= '0';
            wait for clk_period;
            clk <= '1';
            wait for clk_period;
        end loop;
    end process;

    process
    begin
        j <= '0'; k <= '1'; wait for 20 ns;
        j <= '0'; k <= '0'; wait for 20 ns;
        j <= '1'; k <= '0'; wait for 20 ns;
        j <= '1'; k <= '1'; wait for 20 ns;
        wait;
    end process;
end architecture;