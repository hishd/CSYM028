library ieee;
use ieee.std_logic_1164.all;

entity alarm_clock_tb is
end alarm_clock_tb;

architecture behavior of alarm_clock_tb is 
    -- Component Declaration for the Unit Under Test (UUT)
    component alarm_clock
    port(
         clk : in std_logic;
         reset : in std_logic;
         set_time : in std_logic;
         set_alarm : in std_logic;
         time_hours : in std_logic_vector(4 downto 0);
         time_minutes : in std_logic_vector(5 downto 0);
         alarm_hours : in std_logic_vector(4 downto 0);
         alarm_minutes : in std_logic_vector(5 downto 0);
         alarm : out std_logic
        );
    end component;

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal set_time : std_logic := '0';
   signal set_alarm : std_logic := '0';
   signal time_hours : std_logic_vector(4 downto 0) := (others => '0');
   signal time_minutes : std_logic_vector(5 downto 0) := (others => '0');
   signal alarm_hours : std_logic_vector(4 downto 0) := (others => '0');
   signal alarm_minutes : std_logic_vector(5 downto 0) := (others => '0');

   --Outputs
signal alarm : std_logic;

-- Clock period definitions
constant clk_period : time := 1 sec;  -- 1 Hz

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: alarm_clock port map (
        clk => clk,
        reset => reset,
        set_time => set_time,
        set_alarm => set_alarm,
        time_hours => time_hours,
        time_minutes => time_minutes,
        alarm_hours => alarm_hours,
        alarm_minutes => alarm_minutes,
        alarm => alarm
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
        wait for 100 ns;  

        reset <= '0';      
        wait for clk_period;  -- wait for 1 sec

        -- set time to 12:30
        set_time <= '1';
        time_hours <= "11000";  -- 12 in binary
        time_minutes <= "011110";  -- 30 in binary
        wait for clk_period;

        set_time <= '0';
        wait for clk_period;

        -- set alarm to 12:31
        set_alarm <= '1';
        alarm_hours <= "11000";  -- 12 in binary
        alarm_minutes <= "011111";  -- 31 in binary
        wait for clk_period;

        set_alarm <= '0';
        wait;

    end process;

end behavior;