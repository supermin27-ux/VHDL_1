-- VHDL_1, p.22, Problem 1: four-input AND and OR.
library ieee;
use ieee.std_logic_1164.all;

entity q1_logic4 is
    port (
        a, b, c, d : in std_logic;
        out1, out2 : out std_logic
    );
end q1_logic4;

architecture rtl of q1_logic4 is
begin
    out1 <= a and b and c and d;
    out2 <= a or b or c or d;
end rtl;
