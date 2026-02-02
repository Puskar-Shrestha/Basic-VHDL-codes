library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_binary_to_bcd is
end tb_binary_to_bcd;

architecture Behavioral of tb_binary_to_bcd is

    -- DUT signals
    signal bin : STD_LOGIC_VECTOR(7 downto 0);
    signal bcd : STD_LOGIC_VECTOR(11 downto 0);

begin

    -- ===============================
    -- DUT instantiation (NO component)
    -- ===============================
    DUT : entity work.bin_to_bcd
        port map (
            bin => bin,
            bcd => bcd
        );

    -- ===============================
    -- Stimulus process
    -- ===============================
    stim_proc : process
    begin

        -- 0
        bin <= "00000000";
        wait for 10 ns;

        -- 1
        bin <= "00000001";
        wait for 10 ns;

        -- 9
        bin <= "00001001";
        wait for 10 ns;

        -- 10
        bin <= "00001010";
        wait for 10 ns;

        -- 42
        bin <= "00101010";
        wait for 10 ns;

        -- 99
        bin <= "01100011";
        wait for 10 ns;

        -- 100
        bin <= "01100100";
        wait for 10 ns;

        -- 128
        bin <= "10000000";
        wait for 10 ns;

        -- 200
        bin <= "11001000";
        wait for 10 ns;

        -- 255
        bin <= "11111111";
        wait for 10 ns;

        wait;
    end process;


end Behavioral;
