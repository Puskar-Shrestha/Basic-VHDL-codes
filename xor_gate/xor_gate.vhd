library ieee;
use ieee.std_logic_1164.all;

entity xor_gate is
  port (
    a, b : in  std_logic;
    y    : out std_logic
  );
end entity;

architecture beh of xor_gate is
begin
  y <= a xor b;
end architecture;