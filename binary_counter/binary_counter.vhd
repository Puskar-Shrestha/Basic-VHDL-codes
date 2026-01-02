library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binary_counter is
    port(
        clk   : in  std_logic;
        count : out std_logic_vector(3 downto 0)
    );
end entity;

architecture beh of binary_counter is
    signal cnt : unsigned(3 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
            cnt <= cnt + 1;
        end if;
    end process;

    count <= std_logic_vector(cnt);
end architecture;
