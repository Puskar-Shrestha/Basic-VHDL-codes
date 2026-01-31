library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity universal_shift_register_4bit is
    Port (
        clk        : in  STD_LOGIC;
        reset      : in  STD_LOGIC;
        S     : in  STD_LOGIC_VECTOR(1 downto 0);
        serial_in : in  STD_LOGIC; 
        P          : in  STD_LOGIC_VECTOR(3 downto 0); -- parallel input
        Q          : out STD_LOGIC_VECTOR(3 downto 0)
    );
end universal_shift_register_4bit;

architecture behavioral of universal_shift_register_4bit is
    signal reg : STD_LOGIC_VECTOR(3 downto 0);
begin

    process(clk, reset)
    begin
        if reset = '1' then
            reg <= (others => '0');

        elsif rising_edge(clk) then
            case (s) is

                when "00" =>       -- Hold
                    reg <= reg;

                when "01" =>       -- Shift Right
                    reg <= serial_in & reg(3 downto 1);

                when "10" =>       -- Shift Left
                    reg <= reg(2 downto 0) & serial_in;

                when "11" =>       -- Parallel Load
                    reg <= P;

                when others =>
                    reg <= reg;

            end case;
        end if;
    end process;

    Q <= reg;

end behavioral;
