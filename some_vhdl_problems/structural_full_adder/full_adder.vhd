library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port (
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC;
        Cout : out STD_LOGIC
    );
end full_adder;

architecture structural of full_adder is

    component half_adder
        Port (
            A     : in  STD_LOGIC;
            B     : in  STD_LOGIC;
            Sum   : out STD_LOGIC;
            Carry : out STD_LOGIC
        );
    end component;

    signal s1, c1, c2 : STD_LOGIC;

begin

    -- First half adder
    HA1: half_adder
        port map (
            A => A,
            B => B,
            Sum => s1,
            Carry => c1
        );

    -- Second half adder
    HA2: half_adder
        port map (
            A => s1,
            B => Cin,
            Sum => Sum,
            Carry => c2
        );

    -- OR gate for final carry
    Cout <= c1 or c2;

end structural;
