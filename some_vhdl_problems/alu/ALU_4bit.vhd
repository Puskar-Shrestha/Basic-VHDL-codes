library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_4bit is
    Port (
        A       : in  STD_LOGIC_VECTOR(3 downto 0);
        B       : in  STD_LOGIC_VECTOR(3 downto 0);
        ALU_Sel : in  STD_LOGIC_VECTOR(1 downto 0);
        Result  : out STD_LOGIC_VECTOR(3 downto 0);
        CarryOut: out STD_LOGIC
    );
end ALU_4bit;

architecture Behavioral of ALU_4bit is
begin
    process(A, B, ALU_Sel)
        variable temp_result : unsigned(4 downto 0);
    begin
        case ALU_Sel is
            when "00" =>  -- ADD
                temp_result := ('0' & unsigned(A)) + unsigned(B);
                Result    <= std_logic_vector(temp_result(3 downto 0));
                CarryOut  <= temp_result(4);

            when "01" =>  -- SUB
                temp_result := ('0' & unsigned(A)) - unsigned(B);
                Result    <= std_logic_vector(temp_result(3 downto 0));
                CarryOut  <= temp_result(4);

            when "10" =>  -- AND
                Result    <= A and B;
                CarryOut  <= '0';

            when "11" =>  -- OR
                Result    <= A or B;
                CarryOut  <= '0';

            when others =>
                Result    <= (others => '0');
                CarryOut  <= '0';
        end case;
    end process;
end Behavioral;
