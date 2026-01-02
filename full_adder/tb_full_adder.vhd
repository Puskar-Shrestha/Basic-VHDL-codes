library ieee;
use ieee.std_logic_1164.all;

entity tb_full_adder is
end entity;

architecture sim of tb_full_adder is
  signal a, b, cin, s, c : std_logic;
begin
  -- Instantiate the DUT
  uut: entity work.full_adder
    port map (
      a => a,
      b => b,
      cin => cin,
      s => s,
      c => c
    );

  -- Stimulus process
  process
  begin
    cin <= '0'; a <= '0'; b <= '0'; wait for 100 fs;
    cin <= '0'; a <= '0'; b <= '1'; wait for 100 fs;
    cin <= '0'; a <= '1'; b <= '0'; wait for 100 fs;
    cin <= '0'; a <= '1'; b <= '1'; wait for 100 fs;
    cin <= '1'; a <= '0'; b <= '0'; wait for 100 fs;
    cin <= '1'; a <= '0'; b <= '1'; wait for 100 fs;
    cin <= '1'; a <= '1'; b <= '0'; wait for 100 fs;
    cin <= '1'; a <= '1'; b <= '1'; wait for 100 fs;
    wait;  -- stop simulation
  end process;
end architecture;