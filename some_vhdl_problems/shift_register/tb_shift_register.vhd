library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_shift_register is
end tb_shift_register;

architecture Behavioral of tb_shift_register is

    -- Testbench signals
    signal clk        : std_logic := '0';
    signal reset      : std_logic := '0';
    signal serial_in  : std_logic := '0';
    signal serial_out : std_logic;

    constant clk_period : time := 10 ns;

begin

    -- Direct entity instantiation (NO component)
    DUT : entity work.shift_register_4bit
        port map (
            clk        => clk,
            reset      => reset,
            serial_in  => serial_in,
            serial_out => serial_out
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
        -- Apply reset
        reset <= '1';
        wait for clk_period;
        reset <= '0';

        -- Shift in serial data: 1 0 1 1
        serial_in <= '1';
        wait for clk_period;

        serial_in <= '0';
        wait for clk_period;

        serial_in <= '1';
        wait for clk_period;

        serial_in <= '1';
        wait for clk_period;

        -- Extra clocks to observe serial_out
        serial_in <= '0';
        wait for 4 * clk_period;

        -- End simulation
        wait;
    end process;

end Behavioral;
