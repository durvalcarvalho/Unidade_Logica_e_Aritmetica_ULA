library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bin_decoder is
    Port (  result : in UNSIGNED (7 downto 0);
            bin_BCD_unidade: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            bin_BCD_dezena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            bin_BCD_centena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            bin_BCD_milhar: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end bin_decoder;

architecture Behavioral of bin_decoder is

begin

end Behavioral;