library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alarm_clock is
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
end entity;

architecture beh of alarm_clock is
    signal current_hours : unsigned(4 downto 0);
    signal current_minutes : unsigned(5 downto 0);
    signal alarm_set_hours : unsigned(4 downto 0);
    signal alarm_set_minutes : unsigned(5 downto 0);
begin
    process(clk, reset)
    begin
        if reset = '1' then
            current_hours <= (others => '0');
            current_minutes <= (others => '0');
        elsif rising_edge(clk) then
            if set_time = '1' then
                current_hours <= unsigned(time_hours);
                current_minutes <= unsigned(time_minutes);
            else
                if current_minutes = 59 then
                    current_minutes <= (others => '0');
                    if current_hours = 23 then
                        current_hours <= (others => '0');
                    else
                        current_hours <= current_hours + 1;
                    end if;
                else
                    current_minutes <= current_minutes + 1;
                end if;
            end if;

            if set_alarm = '1' then
                alarm_set_hours <= unsigned(alarm_hours);
                alarm_set_minutes <= unsigned(alarm_minutes);
            end if;
        end if;
    end process;

    alarm <= '1' when current_hours = alarm_set_hours and current_minutes = alarm_set_minutes else '0';
end beh;