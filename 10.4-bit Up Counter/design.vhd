library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity up_counter is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end up_counter;

architecture Behavioral of up_counter is
    signal temp : unsigned(3 downto 0) := "0000";
begin
    process(clk, reset)
    begin
        if reset = '1' then
            temp <= "0000";
        elsif rising_edge(clk) then
            if enable = '1' then
                temp <= temp + 1;
            end if;
        end if;
    end process;
    Q <= std_logic_vector(temp);
end Behavioral;