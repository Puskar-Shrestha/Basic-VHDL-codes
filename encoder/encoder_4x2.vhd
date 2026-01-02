library ieee;
use ieee.std_logic_1164.all;

entity encoder_4x2 is
    port(
        s: in std_logic_vector(3 downto 0);
        y: out std_logic_vector(1 downto 0)
    );
end entity;

architecture beh of encoder_4x2 is
begin
    process(s)
    begin
        case s is
            when "0001" => y <= "00";
            when "0010" => y <= "01";
            when "0100" => y <= "10";
            when "1000" => y <= "11";
            when others => y <= "00";
        end case;
    end process;
end architecture;