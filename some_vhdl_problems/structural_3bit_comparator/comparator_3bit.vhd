library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator_3bit is
    Port (
        A  : in  STD_LOGIC_VECTOR(2 downto 0);
        B  : in  STD_LOGIC_VECTOR(2 downto 0);
        GT : out STD_LOGIC;
        EQ : out STD_LOGIC;
        LT : out STD_LOGIC
    );
end comparator_3bit;

architecture structural of comparator_3bit is

    -- Internal signals
    signal nB0, nB1, nB2 : STD_LOGIC;
    signal nA0, nA1, nA2 : STD_LOGIC;
    signal x0, x1, x2    : STD_LOGIC;

    signal gt2, gt1, gt0 : STD_LOGIC;
    signal lt2, lt1, lt0 : STD_LOGIC;

begin

    -- Inverters
    nA2 <= not A(2);
    nA1 <= not A(1);
    nA0 <= not A(0);
    nB2 <= not B(2);
    nB1 <= not B(1);
    nB0 <= not B(0);

    -- XNORs (bit equality)
    x2 <= not (A(2) xor B(2));
    x1 <= not (A(1) xor B(1));
    x0 <= not (A(0) xor B(0));

    -- Greater-than logic
    gt2 <= A(2) and nB2;
    gt1 <= x2 and A(1) and nB1;
    gt0 <= x2 and x1 and A(0) and nB0;

    GT <= gt2 or gt1 or gt0;

    -- Less-than logic
    lt2 <= nA2 and B(2);
    lt1 <= x2 and nA1 and B(1);
    lt0 <= x2 and x1 and nA0 and B(0);

    LT <= lt2 or lt1 or lt0;

    -- Equality
    EQ <= x2 and x1 and x0;

end structural;
