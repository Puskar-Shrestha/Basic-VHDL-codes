library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_full_adder is
-- Testbench has no ports
end tb_full_adder;

architecture behavior of tb_full_adder is

    -- Signals to connect to DUT
    signal A, B, Cin : std_logic := '0';
    signal Sum, Cout : std_logic;

begin

    -- Instantiate the Full Adder (DUT)
    DUT: entity work.full_adder
        port map (
            A    => A,
            B    => B,
            Cin  => Cin,
            Sum  => Sum,
            Cout => Cout
        );

    -- Stimulus process with selected cases
    stim_proc: process
    begin
        -- Case 1: 0 + 0 + 0
        A <= '0'; B <= '0'; Cin <= '0';
        wait for 10 ns;

        -- Case 2: 1 + 0 + 0
        A <= '1'; B <= '0'; Cin <= '0';
        wait for 10 ns;

        -- Case 3: 1 + 1 + 0
        A <= '1'; B <= '1'; Cin <= '0';
        wait for 10 ns;

        -- Case 4: 1 + 1 + 1
        A <= '1'; B <= '1'; Cin <= '1';
        wait for 10 ns;

        -- Finish simulation
        wait;
    end process;

end behavior;
