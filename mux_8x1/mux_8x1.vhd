library ieee;
use ieee.std_logic_1164.all;

entity mux_8x1 is
    port(
        i : in std_logic_vector(7 downto 0); --0 to 7 position of bits so 8-bits
        s : in std_logic_vector(2 downto 0); --0 to 2 position of bits so 3-bits
        y : out std_logic
    );
    end entity;

architecture beh of mux_8x1 is
begin
    with s select
        y <= i(0) when "000",
            i(1) when "001",
            i(2) when "010",
            i(3) when "011",
            i(4) when "100",
            i(5) when "101",
            i(6) when "110",
            i(7) when "111",
            '0' when others;
end architecture;

-- other way
-- architecture Behavioral of mux_8x1 is
-- begin
--     process(I, S)
--     begin
--         case S is
--             when "000" => Y <= I(0);
--             when "001" => Y <= I(1);
--             when "010" => Y <= I(2);
--             when "011" => Y <= I(3);
--             when "100" => Y <= I(4);
--             when "101" => Y <= I(5);
--             when "110" => Y <= I(6);
--             when "111" => Y <= I(7);
--             when others => Y <= '0';
--         end case;
--     end process;
-- end Behavioral;
        