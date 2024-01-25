library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity mux_4to1 is
 port(
     Input1, Input2, Input3, Input4 : in STD_LOGIC;
     Select1, Select2: in STD_LOGIC;
     Output: out STD_LOGIC
  );
end mux_4to1;
 
architecture bhv of mux_4to1 is
begin
process (Input1, Input2, Input3, Input4, Select1, Select2) is
begin
  if (Select1 = '0' and Select2 = '0') then
    Output <= Input1;
  elsif (Select1 = '1' and Select2 = '0') then
    Output <= Input2;
  elsif (Select1 = '0' and Select2 = '1') then
    Output <= Input3;
  else
    Output <= Input4;
  end if;
end process;
end bhv;