library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator_1bit is
    port (
        A  : in  std_logic;
        B  : in  std_logic;
        gt : out std_logic;
        eq : out std_logic;
        lt : out std_logic
    );
end comparator_1bit;

architecture Behavioral of comparator_1bit is
begin
    gt <= A and not B;
    eq <= not (A xor B);
    lt <= not A and B;
end Behavioral;
