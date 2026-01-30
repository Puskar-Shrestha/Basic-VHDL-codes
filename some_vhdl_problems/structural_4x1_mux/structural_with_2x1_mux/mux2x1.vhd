library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2x1 is
    Port (
        A   : in  STD_LOGIC;
        B   : in  STD_LOGIC;
        S   : in  STD_LOGIC;
        Y   : out STD_LOGIC
    );
end mux2x1;

architecture structural of mux2x1 is
begin
    Y <= (not S and A) or (S and B);
end structural;
