library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.TypePackage.all;

entity SmartHeaterTest is
end SmartHeaterTest;

architecture Behavioral of SmartHeaterTest is
    component SmartHeater is
        PORT(
            turnOn : in STD_LOGIC;
            chainInput : in STD_LOGIC;
            operationMode : in OperationModeType;
            desiredTemperature : in STD_LOGIC_VECTOR (7 downto 0);
            enableValve : in STD_LOGIC;
            motionSensorInput : in STD_LOGIC;
            temperatureInput : in STD_LOGIC_VECTOR (7 downto 0);
            clock : in STD_LOGIC;
            reset : in STD_LOGIC;
            controlValveOutput : out STD_LOGIC;
            powerLed : out STD_LOGIC;
            redLed : out STD_LOGIC;
            greenLed : out STD_LOGIC;
            blueLed : out STD_LOGIC;
            chainOutput : out STD_LOGIC
        );
    end component;

    signal turnOn : STD_LOGIC := '0';
    signal chainInput : STD_LOGIC := '0';
    signal operationMode : OperationModeType := MANUAL_MODE;
    signal desiredTemperature : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal enableValve : STD_LOGIC := '0';
    signal motionSensorInput : STD_LOGIC := '0';
    signal temperatureInput : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal clock : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal controlValveOutput : STD_LOGIC;
    signal powerLed : STD_LOGIC;
    signal redLed : STD_LOGIC;
    signal greenLed : STD_LOGIC;
    signal blueLed : STD_LOGIC;
    signal chainOutput : STD_LOGIC;

begin
    uut: SmartHeater PORT MAP (
        turnOn => turnOn,
        chainInput => chainInput,
        operationMode => operationMode,
        desiredTemperature => desiredTemperature,
        enableValve => enableValve,
        motionSensorInput => motionSensorInput,
        temperatureInput => temperatureInput,
        clock => clock,
        reset => reset,
        controlValveOutput => controlValveOutput,
        powerLed => powerLed,
        redLed => redLed,
        greenLed => greenLed,
        blueLed => blueLed,
        chainOutput => chainOutput
    );

    -- Clock signal generation
    clock_process : process
    variable i : integer := 0;
    begin
    while i < 120 loop  -- Adjust this to change the duration
        wait for 10 ns;  -- Adjust this to change the clock frequency
        clock <= not clock;
        i := i + 1;
    end loop;
    wait;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Reset the system
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
        wait for 10 ns;

        -- 1. Turn on the heater
        turnOn <= '1';
        wait for 20 ns;
        -- 2. Set the operation mode to MANUAL_MODE
        operationMode <= MANUAL_MODE;
        wait for 20 ns;
        -- 3. Manually turn on the valve
        enableValve <= '1';
        wait for 60 ns;
        -- 4. Manually turn off the valve
        enableValve <= '0';
        wait for 20 ns;
        -- 5. Set the operation mode to MOTION_MODE
        operationMode <= MOTION_MODE;
        wait for 20 ns;
        -- 6. Set motion sensor input to '1'
        motionSensorInput <= '1';
        wait for 60 ns;
        -- 7. Set motion sensor input to '0'
        motionSensorInput <= '0';
        wait for 60 ns;
        -- 8. Set the desired temperature to 25 degrees
        desiredTemperature <= "00011001";
        wait for 20 ns;
        -- 9. Set the operation mode to TEMPERATURE_MODE
        operationMode <= TEMPERATURE_MODE;
        wait for 60 ns;
        -- 10. Set the temperature input to 20 degrees
        temperatureInput <= "00010100";
        wait for 60 ns;
        -- 11. Set the desired temperature to 15 degrees
        desiredTemperature <= "00001111";
        wait for 60 ns;
        -- 12. Turn off the heater
        turnOn <= '0';
        wait for 60 ns;
        -- 13. Set the operation mode to MANUAL_MODE
        operationMode <= MANUAL_MODE;
        wait for 60 ns;
        -- 14. Manually turn off the valve
        enableValve <= '0';
        wait for 60 ns;
        -- 15. Turn on the heater
        turnOn <= '1';
        wait for 60 ns;
        -- 16. Manually turn on the valve
        enableValve <= '1';
        wait for 60 ns;
        -- 17. Set the operation mode to MOTION_MODE
        operationMode <= MOTION_MODE;
        wait for 60 ns;
        -- 18. Set motion sensor input to '1'
        motionSensorInput <= '1';
        wait for 60 ns;
        -- 19. Turn off the heater
        turnOn <= '0';
        wait for 60 ns;
        -- 20. Turn on the heater
        turnOn <= '1';
        wait for 60 ns;
        -- 21. Set the operation mode to CHAINED_MODE
        operationMode <= CHAINED_MODE;
        wait for 60 ns;
        -- 22. Set the chain input to '1'
        chainInput <= '1';
        wait for 60 ns;
        -- 23. Set the chain input to '0'
        chainInput <= '0';
        -- 24. Turn off the heater
        turnOn <= '0';

        wait;
    end process;

    monitor : process
    begin
        wait until rising_edge(clock);
        assert false report "controlValveOutput: " & std_logic'image(controlValveOutput) severity note;
    end process;

end Behavioral;