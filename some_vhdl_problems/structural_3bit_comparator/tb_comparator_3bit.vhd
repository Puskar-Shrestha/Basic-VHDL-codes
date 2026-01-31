library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_comparator_3bit is
end tb_comparator_3bit;

architecture tb of tb_comparator_3bit is

    -- DUT signals
    signal A  : STD_LOGIC_VECTOR(2 downto 0);
    signal B  : STD_LOGIC_VECTOR(2 downto 0);
    signal GT : STD_LOGIC;
    signal EQ : STD_LOGIC;
    signal LT : STD_LOGIC;

begin

    -- Device Under Test
    DUT : entity work.comparator_3bit
        port map (
            A  => A,
            B  => B,
            GT => GT,
            EQ => EQ,
            LT => LT
        );

    -- Stimulus process
    stim_proc : process
    begin

        -- Equal cases
        A <= "000"; B <= "000"; wait for 10 ns;
        A <= "011"; B <= "011"; wait for 10 ns;
        A <= "111"; B <= "111"; wait for 10 ns;

        -- A > B cases
        A <= "001"; B <= "000"; wait for 10 ns;
        A <= "100"; B <= "011"; wait for 10 ns;
        A <= "111"; B <= "110"; wait for 10 ns;

        -- A < B cases
        A <= "000"; B <= "001"; wait for 10 ns;
        A <= "010"; B <= "101"; wait for 10 ns;
        A <= "110"; B <= "111"; wait for 10 ns;

        -- Hold last value
        wait;
    end process;

end tb;
