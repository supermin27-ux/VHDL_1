-- VHDL_1, p.22, Problem 4: strict majority of 25 votes.
library ieee;
use ieee.std_logic_1164.all;

entity q4_vote25 is
    port (
        vt : in std_logic_vector(24 downto 0);
        result : out std_logic
    );
end q4_vote25;

architecture rtl of q4_vote25 is
begin
    process(vt)
        variable count_ones : integer range 0 to 25;
    begin
        count_ones := 0;
        for i in vt'range loop
            if vt(i) = '1' then
                count_ones := count_ones + 1;
            end if;
        end loop;
        if count_ones >= 13 then
            result <= '1';
        else
            result <= '0';
        end if;
    end process;
end rtl;
