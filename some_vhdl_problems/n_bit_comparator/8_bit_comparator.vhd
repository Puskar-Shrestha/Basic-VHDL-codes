library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity eight_bit_comparator is
    port(
        a : in std_logic_vector(7 downto 0);
        b : in std_logic_vector(7 downto 0);
        equal :  out std_logic;
        greater :  out std_logic;
        less :  out std_logic

    );
end entity;

architecture beh of eight_bit_comparator is
begin
    process(a,b)
    begin
        equal <= '0';
        greater <= '0';
        less <= '0';
        if unsigned(a) = unsigned(b) then
            equal <= '1';
        elsif unsigned(a) < unsigned(b) then
            less <= '1';
        else
            greater <= '1';
        end if;
    end process;
end architecture;
        