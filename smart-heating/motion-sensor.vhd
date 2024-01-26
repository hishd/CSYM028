library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MotionSensor is
    Port ( 
        sensor_input : in STD_LOGIC;
        motion_detected : out STD_LOGIC);
end MotionSensor;

architecture Behavioral of MotionSensor is
begin
    process(sensor_input)
    begin
        if sensor_input = '1' then
            motion_detected <= '1';
        else
            motion_detected <= '0';
        end if;
    end process;
end Behavioral;
