library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration
entity priority_encoder_8to3 is
    Port (
        I     : in  STD_LOGIC_VECTOR(7 downto 0);  -- 8 input lines
        Y     : out STD_LOGIC_VECTOR(2 downto 0);  -- 3-bit encoded output
        Valid : out STD_LOGIC                      -- High if any input is high
    );
end priority_encoder_8to3;

-- Architecture definition
architecture Behavioral of priority_encoder_8to3 is
begin
    process(I)
    begin
        -- Default outputs
        Y <= "000";
        Valid <= '0';
        
        -- Check inputs in priority order (highest first)
        if I(7) = '1' then
            Y <= "111";
            Valid <= '1';
        elsif I(6) = '1' then
            Y <= "110";
            Valid <= '1';
        elsif I(5) = '1' then
            Y <= "101";
            Valid <= '1';
        elsif I(4) = '1' then
            Y <= "100";
            Valid <= '1';
        elsif I(3) = '1' then
            Y <= "011";
            Valid <= '1';
        elsif I(2) = '1' then
            Y <= "010";
            Valid <= '1';
        elsif I(1) = '1' then
            Y <= "001";
            Valid <= '1';
        elsif I(0) = '1' then
            Y <= "000";
            Valid <= '1';
        end if;
    end process;
end Behavioral;
