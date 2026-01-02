library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decade_counter is
    port(
        clk   : in  std_logic;
        count : out std_logic_vector(3 downto 0)
    );
end entity;

architecture beh of decade_counter is
    signal cnt : unsigned(3 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if cnt = 9 then
                cnt <= (others => '0');  -- reset to 0 after 9
            else
                cnt <= cnt + 1;
            end if;
        end if;
    end process;

    count <= std_logic_vector(cnt);
end architecture;
