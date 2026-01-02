library ieee;
use ieee.std_logic_1164.all;

entity half_subtractor is
    port(
        a, b : in std_logic;
        d, bo : out std_logic
    );
end entity;

architecture beh of half_subtractor is
begin
    d  <= a xor b;
    bo <= (not a) and b;
end architecture;