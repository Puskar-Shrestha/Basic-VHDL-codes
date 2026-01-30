library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux4x1_structural is
end tb_mux4x1_structural;

architecture behavior of tb_mux4x1_structural is

    component mux4x1
        Port (
            I0 : in  STD_LOGIC;
            I1 : in  STD_LOGIC;
            I2 : in  STD_LOGIC;
            I3 : in  STD_LOGIC;
            S0 : in  STD_LOGIC;
            S1 : in  STD_LOGIC;
            Y  : out STD_LOGIC
        );
    end component;

    signal I0, I1, I2, I3 : STD_LOGIC := '0';
    signal S0, S1         : STD_LOGIC := '0';
    signal Y              : STD_LOGIC;

begin

    UUT: mux4x1
        port map (
            I0 => I0,
            I1 => I1,
            I2 => I2,
            I3 => I3,
            S0 => S0,
            S1 => S1,
            Y  => Y
        );

    stimulus: process
    begin
        -- Apply inputs
        I0 <= '1'; I1 <= '0'; I2 <= '0'; I3 <= '1';

        -- Select lines cycling
        S1 <= '0'; S0 <= '0'; wait for 10 ns;
        S1 <= '0'; S0 <= '1'; wait for 10 ns;
        S1 <= '1'; S0 <= '0'; wait for 10 ns;
        S1 <= '1'; S0 <= '1'; wait for 10 ns;

        wait;
    end process;

end behavior;
