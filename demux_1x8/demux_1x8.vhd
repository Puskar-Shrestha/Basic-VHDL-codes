library ieee;
use ieee.std_logic_1164.all;

entity demux_1x8 is
    port(
        i : in std_logic;
        s : in std_logic_vector(2 downto 0);
        y : out std_logic_vector(7 downto 0)
    );
    end entity;

architecture beh of demux_1x8 is
begin
    process(i, s)
    begin
        y <= (others => '0');
        case s is
            when "000" => y(0) <= i;
            when "001" => y(1) <= i;
            when "010" => y(2) <= i;
            when "011" => y(3) <= i;
            when "100" => y(4) <= i;
            when "101" => y(5) <= i;
            when "110" => y(6) <= i;
            when "111" => y(7) <= i;
            when others => y <= (others => '0');
        end case;
    end process;

end architecture;
