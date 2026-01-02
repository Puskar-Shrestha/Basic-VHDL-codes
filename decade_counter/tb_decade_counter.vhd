library ieee;
use ieee.std_logic_1164.all;

entity tb_decade_counter is
end entity;

architecture beh of tb_decade_counter is
    signal clk   : std_logic;
    signal count : std_logic_vector(3 downto 0);
    constant clk_period : time := 10 ns;
begin
    uut: entity work.decade_counter
        port map(
            clk   => clk,
            count => count
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
        wait for 200 ns;
        wait;
    end process;
end architecture;
