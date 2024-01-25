library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    Port ( inp_a : in signed(3 downto 0);
           inp_b : in signed(3 downto 0);
           sel : in STD_LOGIC_VECTOR (2 downto 0);
           out_alu : out signed(3 downto 0));
end alu;

architecture Behavioral of alu is
    signal temp : signed(3 downto 0);
begin
    -- Default operation (addition)
    temp <= inp_a + inp_b;

    -- Other operations
    with sel select
        temp <= inp_a + inp_b when "000",  -- addition
                inp_a - inp_b when "001",  -- subtraction
                inp_a - 1 when "010",  -- decrement
                inp_a + 1 when "011",  -- increment
                inp_a and inp_b when "100",  -- AND
                inp_a or inp_b when "101",  -- OR
                not inp_a when "110",  -- NOT
                inp_a xor inp_b when others;  -- XOR

    out_alu <= temp;
end Behavioral;