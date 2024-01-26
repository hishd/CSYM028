library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.TypePackage.all;

entity TemperatureSensor is
    Port ( 
        temp_input : in STD_LOGIC_VECTOR (7 downto 0);  -- 8-bit binary input for temperature
        temp_output : out TemperatureType  -- Temperature output
    );
end TemperatureSensor;

architecture Behavioral of TemperatureSensor is
begin
    process(temp_input)
    begin
        if unsigned(temp_input) > 100 then
            temp_output <= HIGH;
        elsif unsigned(temp_input) > 50 then
            temp_output <= MEDIUM;
        else
            temp_output <= LOW;
        end if;
    end process;
end Behavioral;