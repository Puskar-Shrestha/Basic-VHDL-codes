library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux4x1_structural is
end tb_mux4x1_structural;

architecture behavior of tb_mux4x1_structural is

    signal I  : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal S0 : STD_LOGIC := '0';
    signal S1 : STD_LOGIC := '0';
    signal Y  : STD_LOGIC;

begin

    -- Direct entity instantiation
    UUT : entity work.mux4x1(structural)
        port map (
            I  => I,
            S0 => S0,
            S1 => S1,
            Y  => Y
        );

    stimulus : process
    begin
        -- Set inputs: I(0)=I0, I(1)=I1, I(2)=I2, I(3)=I3
        I <= "1010";  -- I3 I2 I1 I0 = 1 0 1 0

        S1 <= '0'; S0 <= '0'; wait for 10 ns; -- expect Y = I(0)
        S1 <= '0'; S0 <= '1'; wait for 10 ns; -- expect Y = I(1)
        S1 <= '1'; S0 <= '0'; wait for 10 ns; -- expect Y = I(2)
        S1 <= '1'; S0 <= '1'; wait for 10 ns; -- expect Y = I(3)

        wait;
    end process;

end behavior;
