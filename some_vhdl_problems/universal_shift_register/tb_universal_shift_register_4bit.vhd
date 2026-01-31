library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_universal_shift_register_4bit is
end tb_universal_shift_register_4bit;

architecture behavior of tb_universal_shift_register_4bit is

    -- DUT signals
    signal clk       : STD_LOGIC := '0';
    signal reset     : STD_LOGIC := '0';
    signal S    : STD_LOGIC_VECTOR(1 downto 0);
    signal serial_in : STD_LOGIC;
    signal P         : STD_LOGIC_VECTOR(3 downto 0);
    signal Q         : STD_LOGIC_VECTOR(3 downto 0);

    constant clk_period : time := 10 ns;

begin

    -- ===============================
    -- DUT instantiation (work.entity)
    -- ===============================
    DUT : entity work.universal_shift_register_4bit
        port map (
            clk       => clk,
            reset     => reset,
            S        => S,
            serial_in => serial_in,
            P         => P,
            Q         => Q
        );

    -- ===============================
    -- Clock generation
    -- ===============================
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- ===============================
    -- Stimulus process
    -- ===============================
    stim_proc : process
    begin
        -- Reset
        reset <= '1';
        S <= "00";
        
        serial_in <= '0';
        P <= "0000";
        wait for clk_period;

        reset <= '0';
        wait for clk_period;

        -- Parallel load: load 1011
        S <= "11";
        P  <= "1011";
        wait for clk_period;

        -- Hold
        S <= "00";
        wait for clk_period;

        -- Shift right (insert 0)
        S <= "01";
        serial_in <= '0';
        wait for clk_period;

        -- Shift right (insert 1)
        serial_in <= '1';
        wait for clk_period;

        -- Shift left (insert 1)
        S <= "10";
        serial_in <= '1';
        wait for clk_period;

        -- Shift left (insert 0)
        serial_in <= '0';
        wait for clk_period;

        -- End simulation
        wait;
    end process;

end behavior;
