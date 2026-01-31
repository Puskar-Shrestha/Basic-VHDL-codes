library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_ALU_4bit is
end tb_ALU_4bit;

architecture Behavioral of tb_ALU_4bit is

    -- DUT signals
    signal A       : STD_LOGIC_VECTOR(3 downto 0);
    signal B       : STD_LOGIC_VECTOR(3 downto 0);
    signal ALU_Sel : STD_LOGIC_VECTOR(1 downto 0);
    signal Result  : STD_LOGIC_VECTOR(3 downto 0);
    signal CarryOut: STD_LOGIC;

begin

    -- Device Under Test (explicit work.entity usage)
    DUT : entity work.ALU_4bit
        port map (
            A        => A,
            B        => B,
            ALU_Sel  => ALU_Sel,
            Result   => Result,
            CarryOut => CarryOut
        );

    -- Stimulus process
    stim_proc : process
    begin
        -- ADD: 3 + 5 = 8
        A <= "0011";
        B <= "0101";
        ALU_Sel <= "00";
        wait for 10 ns;

        -- ADD with carry: 15 + 1 = 16
        A <= "1111";
        B <= "0001";
        ALU_Sel <= "00";
        wait for 10 ns;

        -- SUB: 7 - 2 = 5
        A <= "0111";
        B <= "0010";
        ALU_Sel <= "01";
        wait for 10 ns;

        -- SUB with borrow: 2 - 5
        A <= "0010";
        B <= "0101";
        ALU_Sel <= "01";
        wait for 10 ns;

        -- AND
        A <= "1100";
        B <= "1010";
        ALU_Sel <= "10";
        wait for 10 ns;

        -- OR
        A <= "1100";
        B <= "1010";
        ALU_Sel <= "11";
        wait for 10 ns;

        -- stop simulation
        wait;
    end process;

end Behavioral;
