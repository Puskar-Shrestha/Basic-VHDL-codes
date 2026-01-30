library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4x1 is
    Port (
        I0 : in  STD_LOGIC;
        I1 : in  STD_LOGIC;
        I2 : in  STD_LOGIC;
        I3 : in  STD_LOGIC;
        S0 : in  STD_LOGIC;
        S1 : in  STD_LOGIC;
        Y  : out STD_LOGIC
    );
end mux4x1;

architecture structural of mux4x1 is

    signal nS0, nS1 : STD_LOGIC;
    signal a0, a1, a2, a3 : STD_LOGIC;

begin

    -- NOT gates
    nS0 <= not S0;
    nS1 <= not S1;

    -- AND gates
    a0 <= I0 and nS1 and nS0;
    a1 <= I1 and nS1 and S0;
    a2 <= I2 and S1  and nS0;
    a3 <= I3 and S1  and S0;

    -- OR gate
    Y <= a0 or a1 or a2 or a3;

end structural;
