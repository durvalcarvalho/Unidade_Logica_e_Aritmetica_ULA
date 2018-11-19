library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity hexa_decoder is
    Port (  result : in STD_LOGIC_VECTOR (7 downto 0);
            hexa_BCD_unidade: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            hexa_BCD_dezena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            hexa_BCD_centena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            hexa_BCD_milhar: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end hexa_decoder;

architecture Behavioral of hexa_decoder is

begin

end Behavioral;