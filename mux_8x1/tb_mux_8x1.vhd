library ieee;
use ieee.std_logic_1164.all;

entity tb_mux_8x1 is
end entity;

architecture sil of tb_mux_8x1 is
    signal i : std_logic_vector(7 downto 0) := (others => '0'); -- other part assigns 0 to the bits
    signal s : std_logic_vector(2 downto 0) := (others => '0'); -- other part assigns 0 to the bits
    signal y : std_logic;

begin
    uut: entity work.mux_8x1
        port map (
            i => i,
            s => s,
            y => y
        );
    
    process
    begin
        i <= "00110101";  -- Example data

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

-- while testing in gtkwave, 000 will select i(0) so the first selected value will be 1 so the result of the test will be "10101100"