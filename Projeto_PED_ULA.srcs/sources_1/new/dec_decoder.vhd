library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dec_decoder is
    Port (  result : in UNSIGNED (7 downto 0);
            dec_BCD_unidade: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            dec_BCD_dezena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            dec_BCD_centena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            dec_BCD_milhar: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end dec_decoder;

architecture Behavioral of dec_decoder is

begin

end Behavioral;