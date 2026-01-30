library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4x1 is
    Port (
        I0  : in  STD_LOGIC;
        I1  : in  STD_LOGIC;
        I2  : in  STD_LOGIC;
        I3  : in  STD_LOGIC;
        S0  : in  STD_LOGIC;
        S1  : in  STD_LOGIC;
        Y   : out STD_LOGIC
    );
end mux4x1;

architecture structural of mux4x1 is

    component mux2x1
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            S : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal Y0, Y1 : STD_LOGIC;

begin

    -- First stage
    MUX1: mux2x1 port map (I0, I1, S0, Y0);
    MUX2: mux2x1 port map (I2, I3, S0, Y1);

    -- Second stage
    MUX3: mux2x1 port map (Y0, Y1, S1, Y);

end structural;
