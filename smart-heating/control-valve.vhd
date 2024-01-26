library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlValve is
    Port ( 
        control_signal : in STD_LOGIC;
        valve_state : out STD_LOGIC);
end ControlValve;

architecture Behavioral of ControlValve is
begin
    process(control_signal)
    begin
        if control_signal = '1' then
            valve_state <= '1';  -- Valve is open
        else
            valve_state <= '0';  -- Valve is closed
        end if;
    end process;
end Behavioral;