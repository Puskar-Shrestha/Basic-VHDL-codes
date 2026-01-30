library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_ripple_carry_adder_4bit is
end tb_ripple_carry_adder_4bit;

architecture behavior of tb_ripple_carry_adder_4bit is

    -- DUT signals
    signal A    : STD_LOGIC_VECTOR(3 downto 0);
    signal B    : STD_LOGIC_VECTOR(3 downto 0);
    signal Cin  : STD_LOGIC;
    signal Sum  : STD_LOGIC_VECTOR(3 downto 0);
    signal Cout : STD_LOGIC;

begin

    -- ===============================
    -- DUT instantiation (work.entity)
    -- ===============================
    DUT : entity work.ripple_carry_adder_4bit
        port map (
            A    => A,
            B    => B,
            Cin  => Cin,
            Sum  => Sum,
            Cout => Cout
        );

    -- ===============================
    -- Stimulus process
    -- ===============================
    stim_proc : process
    begin
        -- Test 1: 0 + 0
        A <= "0000";
        B <= "0000";
        Cin <= '0';
        wait for 10 ns;

        -- Test 2: 3 + 5 = 8
        A <= "0011";
        B <= "0101";
        Cin <= '0';
        wait for 10 ns;

        -- Test 3: 7 + 8 = 15
        A <= "0111";
        B <= "1000";
        Cin <= '0';
        wait for 10 ns;

        -- Test 4: 15 + 1 = 16 (overflow)
        A <= "1111";
        B <= "0001";
        Cin <= '0';
        wait for 10 ns;

        -- Test 5: 15 + 15 + Cin = 31
        A <= "1111";
        B <= "1111";
        Cin <= '1';
        wait for 10 ns;

        -- End simulation
        wait;
    end process;

end behavior;
