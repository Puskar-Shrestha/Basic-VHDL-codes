library ieee;
use ieee.std_logic_1164.all;

entity tb_half_subtractor is
end entity;

architecture sim of tb_half_subtractor is
  signal a, b, d, bo : std_logic;
begin
  -- Instantiate the DUT
  uut: entity work.half_subtractor
    port map (
      a  => a,
      b  => b,
      d  => d,
      bo => bo
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
