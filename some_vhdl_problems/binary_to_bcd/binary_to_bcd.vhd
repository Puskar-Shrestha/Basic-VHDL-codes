library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bin_to_bcd is
    Port (
        bin : in  STD_LOGIC_VECTOR(7 downto 0);
        bcd : out STD_LOGIC_VECTOR(11 downto 0)
    );
end bin_to_bcd;

architecture Behavioral of bin_to_bcd is

    signal uval      : unsigned(7 downto 0);

    -- Intermediate wide results
    signal h_tmp     : unsigned(7 downto 0);
    signal t_tmp     : unsigned(7 downto 0);
    signal o_tmp     : unsigned(7 downto 0);

    -- Final BCD digits
    signal hundreds  : unsigned(3 downto 0);
    signal tens      : unsigned(3 downto 0);
    signal ones      : unsigned(3 downto 0);

begin

    uval <= unsigned(bin);

    -- Full-width division results
    h_tmp <= uval / 100;
    t_tmp <= (uval / 10) mod 10;
    o_tmp <= uval mod 10;

    -- Safe narrowing (values are guaranteed 0–9)
    hundreds <= h_tmp(3 downto 0);
    tens     <= t_tmp(3 downto 0);
    ones     <= o_tmp(3 downto 0);

    bcd(11 downto 8) <= std_logic_vector(hundreds);
    bcd(7 downto 4)  <= std_logic_vector(tens);
    bcd(3 downto 0)  <= std_logic_vector(ones);

end Behavioral;

