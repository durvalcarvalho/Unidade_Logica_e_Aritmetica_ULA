library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity octal_decoder is
    Port (  result : in UNSIGNED (7 downto 0);
            oct_BCD_unidade: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            oct_BCD_dezena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            oct_BCD_centena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            oct_BCD_milhar: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end octal_decoder;

architecture Behavioral of octal_decoder is

begin

end Behavioral;