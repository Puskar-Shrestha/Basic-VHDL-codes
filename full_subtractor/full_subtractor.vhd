library ieee;
use ieee.std_logic_1164.all;

entity full_subtractor is
    port(
        a,b,bin : in std_logic;
        d, bout : out std_logic
    );
end entity;

architecture beh of full_subtractor is
begin
    d <= (a xor b) xor bin;
    bout <= (bin and (not (a xor b))) or ((not a) and b);
end architecture;