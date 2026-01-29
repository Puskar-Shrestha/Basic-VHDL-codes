library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_octal_to_binary_encoder is
end tb_octal_to_binary_encoder;

architecture Behavioral of tb_octal_to_binary_encoder is

    -- Testbench signals
    signal D_tb : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal B_tb : STD_LOGIC_VECTOR(2 downto 0);

begin

    -- Direct entity instantiation (no component)
    DUT : entity work.octal_to_binary_encoder
        port map (
            D => D_tb,
            B => B_tb
        );

    -- Stimulus process
    stim_proc : process
    begin
        D_tb <= "00000001"; wait for 10 ns; -- 0
        D_tb <= "00000010"; wait for 10 ns; -- 1
        D_tb <= "00000100"; wait for 10 ns; -- 2
        D_tb <= "00001000"; wait for 10 ns; -- 3
        D_tb <= "00010000"; wait for 10 ns; -- 4
        D_tb <= "00100000"; wait for 10 ns; -- 5
        D_tb <= "01000000"; wait for 10 ns; -- 6
        D_tb <= "10000000"; wait for 10 ns; -- 7

        -- Invalid / idle case
        D_tb <= "00000000"; wait for 10 ns;

        wait; -- stop simulation
    end process;

end Behavioral;
