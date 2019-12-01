library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity indicador_overflow is
    Port ( a, b, ultima_soma : in STD_LOGIC;
           flag_overflow : out STD_LOGIC);
end indicador_overflow;

architecture Behavioral of indicador_overflow is

begin
   flag_overflow <= (not a  and  not b  and  ultima_soma)  or  (a  and  b  and  not ultima_soma);
end Behavioral;
