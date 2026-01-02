library ieee;
use ieee.std_logic_1164.all;

entity tb_demux_1x8 is
end entity;

architecture sil of tb_demux_1x8 is
    signal i : std_logic;
    signal s : std_logic_vector(2 downto 0) := (others => '0'); -- other part assigns 0 to the bits
    signal y : std_logic_vector(7 downto 0);

begin
    uut: entity work.demux_1x8
        port map (
            i => i,
            s => s,
            y => y
        );

    process
    begin
        i <= '1';  -- Example data

        s <= "000"; wait for 50 fs;
        s <= "001"; wait for 50 fs;
        s <= "010"; wait for 50 fs;
        s <= "011"; wait for 50 fs;
        s <= "100"; wait for 50 fs;
        s <= "101"; wait for 50 fs;
        s <= "110"; wait for 50 fs;
        s <= "111"; wait for 50 fs;
        wait;
    end process;
end architecture;