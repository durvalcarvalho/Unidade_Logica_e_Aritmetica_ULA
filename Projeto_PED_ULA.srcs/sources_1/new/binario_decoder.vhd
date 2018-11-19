library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bin_decoder is
    Port (  result : in STD_LOGIC_VECTOR (7 downto 0);
            bin_BCD_unidade: OUT STD_LOGIC_VECTOR(3 DOWNTO 0):= "0000"  ;
            bin_BCD_dezena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000"  ;
            bin_BCD_centena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0):= "0000"  ;
            bin_BCD_milhar: OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000" );
end bin_decoder;

architecture Behavioral of bin_decoder is

signal aux_result : STD_LOGIC_VECTOR (7 DOWNTO 0);
signal aux_mil, aux_cent, aux_dez, aux_uni : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000"; 

begin

end Behavioral;