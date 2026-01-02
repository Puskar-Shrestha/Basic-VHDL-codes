library ieee;
use ieee.std_logic_1164.all;

entity tb_decoder_2x4 is
end entity;

architecture sim of tb_decoder_2x4 is
    signal s : std_logic_vector(1 downto 0);
    signal y : std_logic_vector(3 downto 0);
begin
    uut: entity work.decoder_2x4
        port map(
            s => s,
            y => y
        );

    process
    begin
        s <= "00"; wait for 100 fs;
        s <= "01"; wait for 100 fs;
        s <= "10"; wait for 100 fs;
        s <= "11"; wait for 100 fs;
        wait;
    end process;
end architecture;
