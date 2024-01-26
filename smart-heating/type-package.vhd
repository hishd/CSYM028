library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package TypePackage is
    type TemperatureType is (HIGH, MEDIUM, LOW);
    type OperationModeType is (TEMPERATURE_MODE, MOTION_MODE, MANUAL_MODE, CHAINED_MODE);
end package TypePackage;