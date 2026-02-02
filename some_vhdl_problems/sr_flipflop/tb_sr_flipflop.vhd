library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_sr_flipflop is
end tb_sr_flipflop;

architecture Behavioral of tb_sr_flipflop is

    -- Testbench signals
    signal clk : std_logic := '0';
    signal S   : std_logic := '0';
    signal R   : std_logic := '0';
    signal Q   : std_logic;

    constant clk_period : time := 10 ns;

begin

    -- Direct entity instantiation (VHDL-2008 style)
    DUT : entity work.sr_flipflop
        port map (
            clk => clk,
            S   => S,
            R   => R,
            Q   => Q
        );

    -- Clock generation
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Stimulus process
    stim_process : process
    begin
        -- Hold
        S <= '0'; R <= '0';
        wait for clk_period;

        -- Set
        S <= '1'; R <= '0';
        wait for clk_period;

        -- Hold
        S <= '0'; R <= '0';
        wait for clk_period;

        -- Reset
        S <= '0'; R <= '1';
        wait for clk_period;

        -- Hold
        S <= '0'; R <= '0';
        wait for clk_period;

        -- Invalid case
        S <= '1'; R <= '1';
        wait for clk_period;

        -- Back to hold
        S <= '0'; R <= '0';
        wait for clk_period;

        -- Stop simulation
        wait;
    end process;

end Behavioral;
