library ieee;
use ieee.std_logic_1164.all;

entity tb_full_subtractor is
end entity;

architecture sim of tb_full_subtractor is
  signal a, b, bin, d, bout : std_logic;
begin
  -- Instantiate the DUT
  uut: entity work.full_subtractor
    port map (
      a => a,
      b => b,
      bin => bin,
      d => d,
      bout => bout
    );

  -- Stimulus process
  process
  begin
    bin <= '0'; a <= '0'; b <= '0'; wait for 100 fs;
    bin <= '0'; a <= '0'; b <= '1'; wait for 100 fs;
    bin <= '0'; a <= '1'; b <= '0'; wait for 100 fs;
    bin <= '0'; a <= '1'; b <= '1'; wait for 100 fs;
    bin <= '1'; a <= '0'; b <= '0'; wait for 100 fs;
    bin <= '1'; a <= '0'; b <= '1'; wait for 100 fs;
    bin <= '1'; a <= '1'; b <= '0'; wait for 100 fs;
    bin <= '1'; a <= '1'; b <= '1'; wait for 100 fs;
    wait;  -- stop simulation
  end process;
end architecture;