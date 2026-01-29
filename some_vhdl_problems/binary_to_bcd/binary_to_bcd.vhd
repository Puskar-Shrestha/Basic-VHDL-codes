library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bin_to_bcd is
    Port (
        bin  : in  STD_LOGIC_VECTOR(7 downto 0);
        bcd  : out STD_LOGIC_VECTOR(11 downto 0)
    );
end bin_to_bcd;

architecture Behavioral of bin_to_bcd is
    signal value     : integer range 0 to 255;
    signal hundreds  : integer range 0 to 9;
    signal tens      : integer range 0 to 9;
    signal ones      : integer range 0 to 9;
begin

    -- Convert binary to integer
    value <= to_integer(unsigned(bin));

    -- Decimal digit extraction
    hundreds <= value / 100;
    tens     <= (value / 10) mod 10;
    ones     <= value mod 10;

    -- Pack into BCD
    bcd(11 downto 8) <= std_logic_vector(to_unsigned(hundreds, 4));
    bcd(7 downto 4)  <= std_logic_vector(to_unsigned(tens, 4));
    bcd(3 downto 0)  <= std_logic_vector(to_unsigned(ones, 4));

end Behavioral;
