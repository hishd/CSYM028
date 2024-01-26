library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.TypePackage.all;

entity SmartHeater is
    PORT(
        turnOn : in STD_LOGIC;
        chainInput : in STD_LOGIC; -- This signal is used to chain multiple smart heaters
        operationMode : in OperationModeType;
        desiredTemperature : in STD_LOGIC_VECTOR (7 downto 0);
        enableValve : in STD_LOGIC; -- If system is in manual mode, this signal is used to enable the valve
        motionSensorInput : in STD_LOGIC;
        temperatureInput : in STD_LOGIC_VECTOR (7 downto 0);
        clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        controlValveOutput : out STD_LOGIC;
        powerLed : out STD_LOGIC;
        redLed : out STD_LOGIC; -- If system is in MANUAL_MODE, this signal indicates if the valve is open or closed
        greenLed : out STD_LOGIC; -- If system is in TEMPERATURE_MODE, this signal indicates if the valve is open or closed
        blueLed : out STD_LOGIC; -- If system is in MOTION_MODE, this signal indicates if the valve is open or closed
        chainOutput : out STD_LOGIC -- This signal is used to chain multiple smart heaters
    );
end SmartHeater;

architecture Behavioral of SmartHeater is
    signal turnOnSignal : STD_LOGIC := '0';
    signal operationModeSignal : OperationModeType := MANUAL_MODE;

    component TemperatureSensor is
        PORT(
            temp_input : in STD_LOGIC_VECTOR (7 downto 0);
            temp_output : out TemperatureType
        );
    end component;

    component MotionSensor is
        PORT(
            sensor_input : in STD_LOGIC;
            motion_detected : out STD_LOGIC
        );
    end component;

    component ControlValve is
        PORT(
            control_signal : in STD_LOGIC;
            valve_state : out STD_LOGIC
        );
    end component;

    signal temperatureOutput : TemperatureType := HIGH;
    signal motionSensorOutput : STD_LOGIC := '0';
    signal controlValveOutputSignal : STD_LOGIC := '0';
begin

    -- Instantiate the temperature sensor
    temperatureSensor1 : TemperatureSensor
    PORT MAP(
        temp_input => temperatureInput,
        temp_output => temperatureOutput
    );

    -- Instantiate the motion sensor
    motionSensor1 : MotionSensor
    PORT MAP(
        sensor_input => motionSensorInput,
        motion_detected => motionSensorOutput
    );

    -- Instantiate the control valve
    controlValve1 : ControlValve
    PORT MAP(
        control_signal => controlValveOutputSignal,
        valve_state => controlValveOutput
    );

    -- Turn on the heater
    process(clock, reset)
    begin
        if reset = '1' then
            turnOnSignal <= '0';
        elsif rising_edge(clock) then
            if turnOn = '1' then
                turnOnSignal <= '1';
            elsif turnOn = '0' then
                turnOnSignal <= '0';
            end if;
        end if;
    end process;

    -- Set the operation mode
    process(clock, reset)
    begin
        if reset = '1' then
            operationModeSignal <= MANUAL_MODE;
        elsif rising_edge(clock) then
            if operationMode = TEMPERATURE_MODE then
                operationModeSignal <= TEMPERATURE_MODE;
            elsif operationMode = MOTION_MODE then
                operationModeSignal <= MOTION_MODE;
            elsif operationMode = MANUAL_MODE then
                operationModeSignal <= MANUAL_MODE;
			elsif operationMode = MANUAL_MODE then
                operationModeSignal <= CHAINED_MODE;
            end if;
        end if;
    end process;

    -- Control the valve
    process(clock, reset)
    begin
        if reset = '1' then
            controlValveOutputSignal <= '0';
        elsif rising_edge(clock) then
            if turnOnSignal = '1' then
                if operationModeSignal = TEMPERATURE_MODE then
                    if unsigned(desiredTemperature) > unsigned(temperatureInput) then
                        controlValveOutputSignal <= '1';
                    elsif unsigned(desiredTemperature) <= unsigned(temperatureInput) then
                        controlValveOutputSignal <= '0';
                    end if;
                elsif operationModeSignal = MOTION_MODE then
                    if motionSensorInput = '1' then
                        controlValveOutputSignal <= '1';
                    elsif motionSensorInput = '0' then
                        controlValveOutputSignal <= '0';
                    end if;
                elsif operationModeSignal = MANUAL_MODE then
                    if enableValve = '1' then
                        controlValveOutputSignal <= '1';
                    elsif enableValve = '0' then
                        controlValveOutputSignal <= '0';
                    end if;
                elsif operationModeSignal = CHAINED_MODE then
                    if chainInput = '1' then
                        controlValveOutputSignal <= '1';
                    elsif chainInput = '0' then
                        controlValveOutputSignal <= '0'; 
					end if;
                end if;
            elsif turnOnSignal = '0' then
                controlValveOutputSignal <= '0';
            end if;
        end if;
    end process;

    -- Output the chain signal
    chainOutput <= controlValveOutputSignal;
    -- Output the control signal
    controlValveOutput <= controlValveOutputSignal;
    -- Output the powerLed
    powerLed <= controlValveOutputSignal;
    -- Output the redLed if system is in MANUAL_MODE
    redLed <= controlValveOutputSignal when operationModeSignal = MANUAL_MODE else '0';
    -- Output the greenLed if system is in TEMPERATURE_MODE
    greenLed <= controlValveOutputSignal when operationModeSignal = TEMPERATURE_MODE else '0';
    -- Output the blueLed if system is in MOTION_MODE
    blueLed <= controlValveOutputSignal when operationModeSignal = MOTION_MODE else '0';

end Behavioral;