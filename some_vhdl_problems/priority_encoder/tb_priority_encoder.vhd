library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_priority_encoder is
end tb_priority_encoder;

architecture Behavioral of tb_priority_encoder is
    -- Signals to connect to the encoder
    signal I_sig     : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal Y_sig     : STD_LOGIC_VECTOR(2 downto 0);
    signal Valid_sig : STD_LOGIC;
begin
    -- Direct entity instantiation (no component needed)
    uut: entity work.priority_encoder_8to3
        port map (
            I     => I_sig,
            Y     => Y_sig,
            Valid => Valid_sig
        );

    -- Test process
    stim_proc: process
    begin
        I_sig <= "00000000"; wait for 10 ns;
        I_sig <= "00000001"; wait for 10 ns;
        I_sig <= "00001000"; wait for 10 ns;
        I_sig <= "10101000"; wait for 10 ns;
        I_sig <= "01000000"; wait for 10 ns;

        wait; -- end simulation
    end process;

end Behavioral;
