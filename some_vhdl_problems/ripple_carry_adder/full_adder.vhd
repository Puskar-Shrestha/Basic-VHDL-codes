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
    signal axb : STD_LOGIC;
    signal ab  : STD_LOGIC;
    signal axb_cin : STD_LOGIC;
begin
    axb      <= A xor B;
    Sum      <= axb xor Cin;
    ab       <= A and B;
    axb_cin  <= axb and Cin;
    Cout     <= ab or axb_cin;
end structural;
