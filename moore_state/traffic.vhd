library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity traffic_light_moore is
    Port (
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        red    : out STD_LOGIC;
        yellow : out STD_LOGIC;
        green  : out STD_LOGIC
    );
end traffic_light_moore;

architecture Behavioral of traffic_light_moore is

    -- State declaration
    type state_type is (RED_STATE, GREEN_STATE, YELLOW_STATE);
    signal current_state, next_state : state_type;

    -- Counter for timing
    signal count : integer range 0 to 5 := 0;

begin

    ------------------------------------------------------------------
    -- State register & counter
    ------------------------------------------------------------------
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                current_state <= RED_STATE;
                count <= 0;
            else
                current_state <= next_state;

                if count = 5 then
                    count <= 0;
                else
                    count <= count + 1;
                end if;
            end if;
        end if;
    end process;

    ------------------------------------------------------------------
    -- Next state logic
    ------------------------------------------------------------------
    process(current_state, count)
    begin
        next_state <= current_state;

        case current_state is
            when RED_STATE =>
                if count = 5 then
                    next_state <= YELLOW_STATE;
                end if;

            when GREEN_STATE =>
                if count = 5 then
                    next_state <= RED_STATE;
                end if;

            when YELLOW_STATE =>
                if count = 5 then
                    next_state <= GREEN_STATE;
                end if;
        end case;
    end process;

    ------------------------------------------------------------------
    -- Output logic (Moore)
    ------------------------------------------------------------------
    process(current_state)
    begin
        -- Default OFF
        red    <= '0';
        yellow <= '0';
        green  <= '0';

        case current_state is
            when RED_STATE =>
                red <= '1';

            when GREEN_STATE =>
                green <= '1';

            when YELLOW_STATE =>
                yellow <= '1';
        end case;
    end process;

end Behavioral;
