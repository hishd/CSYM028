																   library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux_4to1_tb is
end mux_4to1_tb;

architecture behavior of mux_4to1_tb is 
    -- Component Declaration for the Unit Under Test (UUT)
    component mux_4to1
    port(
         Input1 : in  std_logic;
         Input2 : in  std_logic;
         Input3 : in  std_logic;
         Input4 : in  std_logic;
         Select1 : in  std_logic;
         Select2 : in  std_logic;
         Output : out  std_logic
        );
    end component;

   --Inputs
   signal Input1 : std_logic := '0';
   signal Input2 : std_logic := '0';
   signal Input3 : std_logic := '0';
   signal Input4 : std_logic := '0';
   signal Select1 : std_logic := '0';
   signal Select2 : std_logic := '0';

    --Outputs
   signal Output : std_logic;

begin
    -- Instantiate the Unit Under Test (UUT)
   uut: mux_4to1 port map (
          Input1 => Input1,
          Input2 => Input2,
          Input3 => Input3,
          Input4 => Input4,
          Select1 => Select1,
          Select2 => Select2,
          Output => Output
        );

   -- Stimulus process
   stim_proc: process
   begin        

      Input1 <= '1'; 
      Input2 <= '0'; 
      Input3 <= '1'; 
      Input4 <= '0'; 

      wait for 20 ns; 
      Select1 <= '0';
      Select2 <= '0';

      wait for 20 ns; 
      Select1 <= '1';
      Select2 <= '0';

      wait for 20 ns; 
      Select1 <= '0';
      Select2 <= '1';

      wait for 20 ns; 
      Select1 <= '1';
      Select2 <= '1';

      wait;
   end process;

end behavior;