library ieee;
use ieee.std_logic_1164.all;

entity tb_8_bit_comparator is
end entity;

architecture sim of tb_8_bit_comparator is
    signal a,b : std_logic_vector(7 downto 0);
    signal equal, greater, less : std_logic := '0';
begin
    uut:entity work.eight_bit_comparator
        port map(
            a => a,
            b => b,
            equal => equal,
            greater => greater,
            less => less
        );

    process
    begin
        a <= "00010001"; b <= "00010001"; wait for 10 ns;
        a <= "10110101"; b <= "10101101"; wait for 10 ns;
        a <= "11011010"; b <= "10101111"; wait for 10 ns;
        a <= "00101011"; b <= "01111111"; wait for 10 ns;
        wait;
    end process;
end architecture;