library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_sequence_detector is
end tb_sequence_detector;

architecture Behavioral of tb_sequence_detector is

    -- Signals
    signal clk   : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal x     : STD_LOGIC := '0';
    signal z     : STD_LOGIC;

    constant clk_period : time := 10 ns;

begin

    ------------------------------------------------------------------
    -- Instantiate Unit Under Test (UUT)
    ------------------------------------------------------------------
    uut: entity work.seq_1011_mealy
        port map (
            clk   => clk,
            reset => reset,
            x     => x,
            z     => z
        );

    ------------------------------------------------------------------
    -- Clock generation
    ------------------------------------------------------------------
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    ------------------------------------------------------------------
    -- Stimulus process
    ------------------------------------------------------------------
    stim_proc : process
    begin
        -- Apply reset
        -- reset <= '1';
        -- wait for 20 ns;
        -- reset <= '0';

        -- Input sequence: 1 0 1 1 0 1 0 1 1
        -- Expected z:      0 0 0 1 0 0 0 0 1

        x <= '1'; wait for clk_period;
        x <= '0'; wait for clk_period;

        x <= '1'; wait for clk_period;
        x <= '1'; wait for clk_period; -- z = 1 (1011)

        x <= '0'; wait for clk_period;
        x <= '1'; wait for clk_period;
        x <= '0'; wait for clk_period;
        x <= '1'; wait for clk_period;
        x <= '1'; wait for clk_period; -- z = 1 (overlapping)

        -- End simulation
        wait;
    end process;

end Behavioral;
