library ieee;
use ieee.std_logic_1164.all;

entity tb_t_flipflop is
end entity;

architecture beh of tb_t_flipflop is
    signal d, clk, q : std_logic;
    constant clk_period :time := 10 ns;
begin
    uut: entity work.t_flipflop
        port map(
            d => d,
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
        d <= '0'; wait for 20 ns;
        d <='1'; wait for 20 ns;
        d <='0'; wait for 20 ns;
        d <='1'; wait for 20 ns;
        wait;
    end process;
end architecture;