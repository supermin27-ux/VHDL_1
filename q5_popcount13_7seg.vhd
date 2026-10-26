-- VHDL_1, p.22, Problem 5: 13-bit population count and display.
-- display(7 downto 0) = a b c d e f g dp; active high.
-- A 13-bit input reaches 0..13 (0..D). E/F remain in the decoder.
library ieee;
use ieee.std_logic_1164.all;

entity q5_popcount13_7seg is
    port (
        vt : in std_logic_vector(12 downto 0);
        en : in std_logic;
        display : out std_logic_vector(7 downto 0)
    );
end q5_popcount13_7seg;

architecture rtl of q5_popcount13_7seg is
    function hex_to_segments(value : natural) return std_logic_vector is
    begin
        case value is
            when 0  => return "11111100"; -- 0
            when 1  => return "01100000"; -- 1
            when 2  => return "11011010"; -- 2
            when 3  => return "11110010"; -- 3
            when 4  => return "01100110"; -- 4
            when 5  => return "10110110"; -- 5
            when 6  => return "10111110"; -- 6
            when 7  => return "11100000"; -- 7
            when 8  => return "11111110"; -- 8
            when 9  => return "11110110"; -- 9
            when 10 => return "11101110"; -- A
            when 11 => return "00111110"; -- b
            when 12 => return "10011100"; -- C
            when 13 => return "01111010"; -- d
            when 14 => return "10011110"; -- E
            when 15 => return "10001110"; -- F
            when others => return "00000000";
        end case;
    end hex_to_segments;
begin
    process(vt, en)
        variable count_ones : integer range 0 to 13;
    begin
        count_ones := 0;
        for i in vt'range loop
            if vt(i) = '1' then
                count_ones := count_ones + 1;
            end if;
        end loop;
        if en = '1' then
            display <= hex_to_segments(count_ones);
        else
            display <= "00000000";
        end if;
    end process;
end rtl;
