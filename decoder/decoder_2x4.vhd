library ieee;
use ieee.std_logic_1164.all;

entity decoder_2x4 is
    port(
        s : in  std_logic_vector(1 downto 0);
        y : out std_logic_vector(3 downto 0)
    );
end entity;

architecture beh of decoder_2x4 is
begin
    process(s)
    begin
        case s is
            when "00" => y <= "0001";
            when "01" => y <= "0010";
            when "10" => y <= "0100";
            when "11" => y <= "1000";
            when others => y <= "0000";
        end case;
    end process;
end architecture;
