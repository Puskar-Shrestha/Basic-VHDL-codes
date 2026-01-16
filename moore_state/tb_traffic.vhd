library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_traffic is
end tb_traffic;

architecture Behavioral of tb_traffic is

    -- Testbench signals
    signal clk    : STD_LOGIC := '0';
    signal reset  : STD_LOGIC := '0';
    signal red    : STD_LOGIC;
    signal yellow : STD_LOGIC;
    signal green  : STD_LOGIC;

    constant clk_period : time := 10 ns;

begin

    ------------------------------------------------------------------
    -- Instantiate the Unit Under Test (UUT)
    ------------------------------------------------------------------
    uut:entity work.traffic_light_moore
        port map (
            clk    => clk,
            reset  => reset,
            red    => red,
            yellow => yellow,
            green  => green
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
    stim_proc: process
    begin
        -- Apply reset
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        -- Run simulation long enough to see all states
        wait for 400 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;
