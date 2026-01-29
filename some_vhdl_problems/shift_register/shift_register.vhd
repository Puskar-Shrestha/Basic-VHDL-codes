library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_register_4bit is
    Port (
        clk        : in  std_logic;
        reset      : in  std_logic;
        serial_in  : in  std_logic;
        serial_out : out std_logic
    );
end shift_register_4bit;

architecture Behavioral of shift_register_4bit is
    signal reg : std_logic_vector(3 downto 0);
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                reg <= (others => '0');
            else
                reg <= serial_in & reg(3 downto 1); -- & operation in vhdl is for concatination
            end if;
        end if;
    end process;

    serial_out <= reg(0);

end Behavioral;
