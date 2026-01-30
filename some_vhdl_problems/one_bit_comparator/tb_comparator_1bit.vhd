library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_comparator_1bit is
end tb_comparator_1bit;

architecture Behavioral of tb_comparator_1bit is

    -- Signals to connect to DUT
    signal A, B : std_logic := '0';
    signal gt, eq, lt : std_logic;

begin

    -- Direct entity instantiation
    DUT: entity work.comparator_1bit
        port map (
            A  => A,
            B  => B,
            gt => gt,
            eq => eq,
            lt => lt
        );

    -- Stimulus process
    stim_proc: process
    begin
        A <= '0'; B <= '0';
        wait for 10 ns;

        A <= '0'; B <= '1';
        wait for 10 ns;

        A <= '1'; B <= '0';
        wait for 10 ns;

        A <= '1'; B <= '1';
        wait for 10 ns;

        wait;  -- stop simulation
    end process;

end Behavioral;
