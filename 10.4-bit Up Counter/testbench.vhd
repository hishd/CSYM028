library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity up_counter_tb is
end up_counter_tb;

architecture behavior of up_counter_tb is 
    -- Component Declaration for the Unit Under Test (UUT)
    component up_counter
    port(
         clk : in std_logic;
         reset : in std_logic;
         enable : in std_logic;
         Q : out std_logic_vector(3 downto 0)
        );
    end component;

   --Inputs
   signal clk, reset, enable : std_logic := '0';

   --Outputs
   signal Q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
   uut: up_counter port map (
          clk => clk,
          reset => reset,
          enable => enable,
          Q => Q
        );

   -- Clock process definitions
   clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin
        -- hold reset state for 100 ns.
        reset <= '1';
        enable <= '0';
        wait for 100 ns;  

        -- release reset state
        reset <= '0';
        enable <= '1';
        wait for clk_period*16;  -- wait for 16 clock cycles

        -- hold counter at current state
        enable <= '0';
        wait for clk_period*8;  -- wait for 8 clock cycles

        -- enable counter again
        enable <= '1';
        wait for clk_period*16;  -- wait for 16 clock cycles

        -- stop the simulation
        assert false report "End of simulation" severity failure;
    end process;

end behavior;