library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
    port(
        a,b : in std_logic;
        s,c : out std_logic
    );
end entity;

architecture beh of half_adder is
begin
    s <= a xor b;
    c <= a and b;
end architecture;