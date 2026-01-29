library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity octal_to_binary_encoder is
    Port (
        D : in  STD_LOGIC_VECTOR(7 downto 0); -- Octal inputs
        B : out STD_LOGIC_VECTOR(2 downto 0)  -- Binary output
    );
end octal_to_binary_encoder;

architecture Behavioral of octal_to_binary_encoder is
begin
    process(D)
    begin
        case D is
            when "00000001" => B <= "000"; -- D0
            when "00000010" => B <= "001"; -- D1
            when "00000100" => B <= "010"; -- D2
            when "00001000" => B <= "011"; -- D3
            when "00010000" => B <= "100"; -- D4
            when "00100000" => B <= "101"; -- D5
            when "01000000" => B <= "110"; -- D6
            when "10000000" => B <= "111"; -- D7
            when others     => B <= "000"; -- Invalid / no input
        end case;
    end process;
end Behavioral;
