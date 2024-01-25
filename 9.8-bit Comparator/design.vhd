library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comparator is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           AeqB : out STD_LOGIC;
           AltB : out STD_LOGIC;
           AgtB : out STD_LOGIC);
end comparator;

architecture Behavioral of comparator is
begin
    AeqB <= '1' when A = B else '0';
    AltB <= '1' when A < B else '0';
    AgtB <= '1' when A > B else '0';
end Behavioral;