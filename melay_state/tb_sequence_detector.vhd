library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_seq_1011_mealy is
end tb_seq_1011_mealy;

architecture Behavioral of tb_seq_1011_mealy is

    -- Component declaration
    component seq_1011_mealy
        Port (
            clk   : in  STD_LOGIC;
            reset : in  STD_LOGIC;
            x     : in  STD_LOGIC;
            z     : out STD_LOGIC
        );
    end component;

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
    uut: seq_1011_mealy
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
