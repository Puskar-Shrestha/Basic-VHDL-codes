library ieee;
use ieee.std_logic_1164.all;

entity tb_encoder_4x2 is
end entity;

architecture sim of tb_encoder_4x2 is
    signal s : std_logic_vector(3 downto 0);
    signal y : std_logic_vector(1 downto 0);
begin
    uut: entity work.encoder_4x2
        port map(
            s => s,
            y => y
        );
    
    process
    begin
        s <= "0001"; wait for 100 fs;
        s <= "0010"; wait for 100 fs;
        s <= "0100"; wait for 100 fs;
        s <= "1000"; wait for 100 fs;
        wait;
    end process;
end architecture;