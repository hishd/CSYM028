											library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity decoder2_tb is
end decoder2_tb;

architecture behavior of decoder2_tb is 
    -- Component Declaration for the Unit Under Test (UUT)
    component decoder2
    port(
         a : in  std_logic_vector(1 downto 0);
         b : out  std_logic_vector(3 downto 0)
        );
    end component;

   --Inputs
   signal a : std_logic_vector(1 downto 0) := "00";

    --Outputs
   signal b : std_logic_vector(3 downto 0);

begin
    -- Instantiate the Unit Under Test (UUT)
   uut: decoder2 port map (
          a => a,
          b => b
        );

   -- Stimulus process
   stim_proc: process
   begin        

      a <= "00"; 
      wait for 20 ns; 

      a <= "01"; 
      wait for 20 ns; 

      a <= "10"; 
      wait for 20 ns; 

      a <= "11"; 
      wait for 20 ns; 

      -- insert stimulus here 

      wait;
   end process;

end behavior;