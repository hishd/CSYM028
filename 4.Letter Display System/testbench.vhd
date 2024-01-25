			  library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_7seg_tb is
end bcd_7seg_tb;

architecture behavior of bcd_7seg_tb is 
    -- Component Declaration for the Unit Under Test (UUT)
    component bcd_7seg
    port(
         B0, B1, B2, B3 : in STD_LOGIC;
         A, B, C, D, E, F, G : out STD_LOGIC
        );
    end component;

   --Inputs
   signal B0, B1, B2, B3 : STD_LOGIC := '0';

    --Outputs
   signal A, B, C, D, E, F, G : STD_LOGIC;

begin
    -- Instantiate the Unit Under Test (UUT)
   uut: bcd_7seg port map (
          B0 => B0,
          B1 => B1,
          B2 => B2,
          B3 => B3,
          A => A,
          B => B,
          C => C,
          D => D,
          E => E,
          F => F,
          G => G
        );

   -- Stimulus process
   stim_proc: process
   begin        

      B0 <= '0'; B1 <= '0'; B2 <= '0'; B3 <= '0'; 
      wait for 20 ns; 

      B0 <= '1'; B1 <= '0'; B2 <= '0'; B3 <= '0'; 
      wait for 20 ns; 

      B0 <= '0'; B1 <= '1'; B2 <= '0'; B3 <= '0'; 
      wait for 20 ns; 

      B0 <= '1'; B1 <= '1'; B2 <= '0'; B3 <= '0'; 
      wait for 20 ns; 

      -- insert more stimulus here 

      wait;
   end process;

end behavior;