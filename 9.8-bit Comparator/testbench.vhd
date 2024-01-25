library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comparator_tb is
end comparator_tb;

architecture behavior of comparator_tb is 
    -- Component Declaration for the Unit Under Test (UUT)
    component comparator
    port(
         A : in std_logic_vector(7 downto 0);
         B : in std_logic_vector(7 downto 0);
         AeqB : out std_logic;
         AltB : out std_logic;
         AgtB : out std_logic
        );
    end component;

   --Inputs
   signal A, B : std_logic_vector(7 downto 0) := (others => '0');

   --Outputs
   signal AeqB, AltB, AgtB : std_logic;

begin
    -- Instantiate the Unit Under Test (UUT)
   uut: comparator port map (
          A => A,
          B => B,
          AeqB => AeqB,
          AltB => AltB,
          AgtB => AgtB
        );

   -- Stimulus process
   stim_proc: process
   begin
        -- test A = B
        A <= "00001111";  -- 15 in binary
        B <= "00001111";  -- 15 in binary
        wait for 100 ns;

        -- test A < B
        A <= "00001111";  -- 15 in binary
        B <= "00010000";  -- 16 in binary
        wait for 100 ns;

        -- test A > B
        A <= "00010000";  -- 16 in binary
        B <= "00001111";  -- 15 in binary
        wait for 100 ns;

        wait;
    end process;

end behavior;