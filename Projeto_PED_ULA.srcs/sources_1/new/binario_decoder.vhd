library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bin_decoder is
    Port (  result : in STD_LOGIC_VECTOR (7 downto 0);
            bin_BCD_unidade: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            bin_BCD_dezena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            bin_BCD_centena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            bin_BCD_milhar: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end bin_decoder;

architecture Behavioral of bin_decoder is

begin

-- 4 bits menos significativos
bin_BCD_unidade(0) <= result(0);
bin_BCD_dezena(0) <= result(1);
bin_BCD_centena(0) <= result(2);
bin_BCD_milhar(0) <= result(3);

end Behavioral;