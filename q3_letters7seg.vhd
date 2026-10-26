-- VHDL_1, p.22, Problem 3: display a, b, c, d, f, g.
-- display(7 downto 0) = a b c d e f g dp; 1 lights a segment.
-- dat: 000=a, 001=b, 010=c, 011=d, 100=f, 101=g.
library ieee;
use ieee.std_logic_1164.all;

entity q3_letters7seg is
    port (
        en : in std_logic;
        dat : in std_logic_vector(2 downto 0);
        display : out std_logic_vector(7 downto 0)
    );
end q3_letters7seg;

architecture rtl of q3_letters7seg is
begin
    process(en, dat)
    begin
        display <= "00000000";
        if en = '1' then
            case dat is
                when "000" => display <= "11111010"; -- a
                when "001" => display <= "00111110"; -- b
                when "010" => display <= "00011010"; -- c
                when "011" => display <= "01111010"; -- d
                when "100" => display <= "10001110"; -- f
                when "101" => display <= "11110110"; -- g
                when others => display <= "00000000";
            end case;
        end if;
    end process;
end rtl;
