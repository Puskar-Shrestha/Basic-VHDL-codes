library ieee;
use ieee.std_logic_1164.all;

entity nand_gate is
  port (
    a, b : in  std_logic;
    y    : out std_logic
  );
end entity;

architecture beh of nand_gate is
begin
  y <= a nand b;
end architecture;