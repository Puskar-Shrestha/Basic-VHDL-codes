library ieee;
use ieee.std_logic_1164.all;

entity tb_half_adder is
end entity;

architecture sim of tb_half_adder is
  signal a, b, s,c : std_logic;
begin
  -- Instantiate the DUT
  uut: entity work.half_adder
    port map (
      a => a,
      b => b,
      s => s,
      c => c
    );

  -- Stimulus process
  process
  begin
    a <= '0'; b <= '0'; wait for 100 fs;
    a <= '0'; b <= '1'; wait for 100 fs;
    a <= '1'; b <= '0'; wait for 100 fs;
    a <= '1'; b <= '1'; wait for 100 fs;
    wait;  -- stop simulation
  end process;
end architecture;