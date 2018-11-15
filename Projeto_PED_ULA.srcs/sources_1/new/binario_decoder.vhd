library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bin_decoder is
    Port (  result : in UNSIGNED (7 downto 0);
            bin_BCD_unidade: OUT UNSIGNED(3 DOWNTO 0):= "0000"  ;
            bin_BCD_dezena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000"  ;
            bin_BCD_centena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0):= "0000"  ;
            bin_BCD_milhar: OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000" );
end bin_decoder;

architecture Behavioral of bin_decoder is

signal aux_result : UNSIGNED (7 DOWNTO 0);
signal aux_mil, aux_cent, aux_dez, aux_uni : UNSIGNED(3 DOWNTO 0) := "0000"; 

begin

process is
begin
    -- ENQUANTO AUX RESULT FOR MAIOR QUE 100
    while aux_result > "1100100" loop
    
    aux_result <= aux_result - "1100100";
    aux_cent <= aux_cent + "0001";
    
    end loop;
end process;




end Behavioral;