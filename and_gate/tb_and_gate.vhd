library ieee;
use ieee.std_logic_1164.all;

entity tb_and_gate is
end entity;

architecture sim of tb_and_gate is
  signal a, b, y : std_logic;
begin
  -- Instantiate the DUT
  uut: entity work.and_gate
    port map (
      a => a,
      b => b,
      y => y
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
