library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF_tb is
end D_FF_tb;

architecture behavior of D_FF_tb is 
    -- Component Declaration for the Unit Under Test (UUT)
    component D_FF
    port(
         D : in std_logic;
         CLOCK : in std_logic;
         Q : out std_logic
        );
    end component;

   --Inputs
   signal D, CLOCK : STD_LOGIC := '0';

    --Outputs
   signal Q : STD_LOGIC;

begin
    -- Instantiate the Unit Under Test (UUT)
   uut: D_FF port map (
          D => D,
          CLOCK => CLOCK,
          Q => Q
        );

   -- Stimulus process
   stim_proc: process
   begin        
      -- Test 1: D=0, Clock=0->1
      D <= '0'; 
      wait for 10 ns; 
      CLOCK <= '1'; 
      wait for 10 ns; 
      CLOCK <= '0'; 
      wait for 10 ns; 

      -- Test 2: D=1, Clock=0->1
      D <= '1'; 
      wait for 10 ns; 
      CLOCK <= '1'; 
      wait for 10 ns; 
      CLOCK <= '0'; 
      wait for 10 ns; 

      -- Test 3: D=0, Clock=1->0
      D <= '0'; 
      wait for 10 ns; 
      CLOCK <= '1'; 
      wait for 10 ns; 
      CLOCK <= '0'; 
      wait for 10 ns; 

      -- Test 4: D=1, Clock=1->0
      D <= '1'; 
      wait for 10 ns; 
      CLOCK <= '1'; 
      wait for 10 ns; 
      CLOCK <= '0'; 
      wait for 10 ns; 

      -- Test 5: D=0->1, Clock=0
      D <= '0'; 
      wait for 10 ns; 
      D <= '1'; 
      wait for 10 ns; 

      -- Test 6: D=1->0, Clock=0
      D <= '1'; 
      wait for 10 ns; 
      D <= '0'; 
      wait for 10 ns; 

      -- Test 7: D=0->1, Clock=1
      D <= '0'; 
      wait for 10 ns; 
      CLOCK <= '1'; 
      wait for 10 ns; 
      D <= '1'; 
      wait for 10 ns; 

      -- Test 8: D=1->0, Clock=1
      D <= '1'; 
      wait for 10 ns; 
      CLOCK <= '1'; 
      wait for 10 ns; 
      D <= '0'; 
      wait for 10 ns; 

      -- insert more stimulus here 

      wait;
   end process;

end behavior;