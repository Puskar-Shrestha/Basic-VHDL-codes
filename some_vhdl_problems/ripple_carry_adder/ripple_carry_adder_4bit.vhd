library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_carry_adder_4bit is
    Port (
        A    : in  STD_LOGIC_VECTOR(3 downto 0);
        B    : in  STD_LOGIC_VECTOR(3 downto 0);
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC_VECTOR(3 downto 0);
        Cout : out STD_LOGIC
    );
end ripple_carry_adder_4bit;

architecture structural of ripple_carry_adder_4bit is

    component full_adder
        Port (
            A    : in  STD_LOGIC;
            B    : in  STD_LOGIC;
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC;
            Cout : out STD_LOGIC
        );
    end component;

    signal c : STD_LOGIC_VECTOR(3 downto 0);

begin
    FA0: full_adder port map (
        A => A(0),
        B => B(0),
        Cin => Cin,
        Sum => Sum(0),
        Cout => c(0)
    );

    FA1: full_adder port map (
        A => A(1),
        B => B(1),
        Cin => c(0),
        Sum => Sum(1),
        Cout => c(1)
    );

    FA2: full_adder port map (
        A => A(2),
        B => B(2),
        Cin => c(1),
        Sum => Sum(2),
        Cout => c(2)
    );

    FA3: full_adder port map (
        A => A(3),
        B => B(3),
        Cin => c(2),
        Sum => Sum(3),
        Cout => c(3)
    );

    Cout <= c(3);

end structural;
