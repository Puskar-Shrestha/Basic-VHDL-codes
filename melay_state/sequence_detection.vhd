library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seq_1011_mealy is
    Port (
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        x     : in  STD_LOGIC;  -- serial input
        z     : out STD_LOGIC   -- output = 1 when 1011 detected
    );
end seq_1011_mealy;

architecture Behavioral of seq_1011_mealy is

    type state_type is (S0, S1, S2, S3);
    signal current_state, next_state : state_type;

begin

    ------------------------------------------------------------------
    -- State register
    ------------------------------------------------------------------
    process(clk)
    begin
        if falling_edge(clk) then
            if reset = '1' then
                current_state <= S0;
            else
                current_state <= next_state;
            end if;
        end if;
    end process;

    ------------------------------------------------------------------
    -- Next state and output logic (Mealy)
    ------------------------------------------------------------------
    process(current_state, x)
    begin
        -- Default assignments
        next_state <= current_state;
        z <= '0';

        case current_state is

            when S0 =>
                if x = '1' then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;

            when S1 =>  -- "1"
                if x = '0' then
                    next_state <= S2;
                else
                    next_state <= S1; -- stay for overlapping
                end if;

            when S2 =>  -- "10"
                if x = '1' then
                    next_state <= S3;
                else
                    next_state <= S0;
                end if;

            when S3 =>  -- "101"
                if x = '1' then
                    z <= '1';         -- 1011 detected
                    next_state <= S1; -- overlap handling
                else
                    next_state <= S2; -- 1010 → "10"
                end if;

        end case;
    end process;

end Behavioral;
