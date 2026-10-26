-- VHDL_1, p.22, Problem 2: eight-to-one multiplexer.
library ieee;
use ieee.std_logic_1164.all;

entity q2_mux8 is
    port (
        a, b, c, d, e, f, g, h : in std_logic;
        sel : in std_logic_vector(2 downto 0);
        data : out std_logic
    );
end q2_mux8;

architecture rtl of q2_mux8 is
begin
    process(a, b, c, d, e, f, g, h, sel)
    begin
        case sel is
            when "000" => data <= a;
            when "001" => data <= b;
            when "010" => data <= c;
            when "011" => data <= d;
            when "100" => data <= e;
            when "101" => data <= f;
            when "110" => data <= g;
            when "111" => data <= h;
            when others => data <= '0';
        end case;
    end process;
end rtl;
