library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder_tb is
end FullAdder_tb;

architecture behavior of FullAdder_tb is 
    -- Component Declaration for the Unit Under Test (UUT)
    component FullAdder
    port(
         A : in std_logic;
         B : in std_logic;
         Cin : in std_logic;
         Sum : out std_logic;
         Cout : out std_logic
        );
    end component;

   --Inputs
   signal A, B, Cin : STD_LOGIC := '0';

    --Outputs
   signal Sum, Cout : STD_LOGIC;

begin
    -- Instantiate the Unit Under Test (UUT)
   uut: FullAdder port map (
          A => A,
          B => B,
          Cin => Cin,
          Sum => Sum,
          Cout => Cout
        );

   -- Stimulus process
   stim_proc: process
   begin        
      -- Test 1: A=0, B=0, Cin=0
      A <= '0'; B <= '0'; Cin <= '0'; 
      wait for 10 ns; 

      -- Test 2: A=0, B=0, Cin=1
      A <= '0'; B <= '0'; Cin <= '1'; 
      wait for 10 ns; 

      -- Test 3: A=0, B=1, Cin=0
      A <= '0'; B <= '1'; Cin <= '0'; 
      wait for 10 ns; 

      -- Test 4: A=0, B=1, Cin=1
      A <= '0'; B <= '1'; Cin <= '1'; 
      wait for 10 ns; 

      -- Test 5: A=1, B=0, Cin=0
      A <= '1'; B <= '0'; Cin <= '0'; 
      wait for 10 ns; 

      -- Test 6: A=1, B=0, Cin=1
      A <= '1'; B <= '0'; Cin <= '1'; 
      wait for 10 ns; 

      -- Test 7: A=1, B=1, Cin=0
      A <= '1'; B <= '1'; Cin <= '0'; 
      wait for 10 ns; 

      -- Test 8: A=1, B=1, Cin=1
      A <= '1'; B <= '1'; Cin <= '1'; 
      wait for 10 ns; 

      wait;
   end process;

end behavior;