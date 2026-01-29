library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_binary_to_bcd is
end tb_binary_to_bcd;

architecture Behavioral of tb_binary_to_bcd is

    -- DUT signals
    signal bin  : std_logic_vector(7 downto 0);
    signal bcd  : std_logic_vector(11 downto 0);

begin

    -- Instantiate the Device Under Test (DUT)
    DUT: entity work.bin_to_bcd
        port map (
            bin => bin,
            bcd => bcd
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test 0
        bin <= "00000000";  -- 0
        wait for 10 ns;

        -- Test 5
        bin <= "00000101";  -- 5
        wait for 10 ns;

        -- Test 12
        bin <= "00001100";  -- 12
        wait for 10 ns;

        -- Test 42
        bin <= "00101010";  -- 42
        wait for 10 ns;

        -- Test 99
        bin <= "01100011";  -- 99
        wait for 10 ns;

        -- Test 156
        bin <= "10011100";  -- 156
        wait for 10 ns;

        -- Test 255
        bin <= "11111111";  -- 255
        wait for 10 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;