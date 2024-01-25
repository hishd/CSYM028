library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity decoder3to8_tb is
end decoder3to8_tb;

architecture behavior of decoder3to8_tb is 
    -- Component Declaration for the Unit Under Test (UUT)
    component decoder3to8
    port(
         A : in  std_logic_vector(2 downto 0);
         Y : out  std_logic_vector(7 downto 0)
        );
    end component;

   --Inputs
   signal A : std_logic_vector(2 downto 0) := "000";

    --Outputs
   signal Y : std_logic_vector(7 downto 0);

begin
    -- Instantiate the Unit Under Test (UUT)
   uut: decoder3to8 port map (
          A => A,
          Y => Y
        );

   -- Stimulus process
   stim_proc: process
   begin        

      A <= "000"; 
      wait for 20 ns; 

      A <= "001"; 
      wait for 20 ns; 

      A <= "010"; 
      wait for 20 ns; 

      A <= "011"; 
      wait for 20 ns; 

      A <= "100"; 
      wait for 20 ns; 

      A <= "101"; 
      wait for 20 ns; 

      A <= "110"; 
      wait for 20 ns; 

      A <= "111"; 
      wait for 20 ns; 

      -- insert stimulus here 

      wait;
   end process;

end behavior;