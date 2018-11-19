library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity hexa_decoder is
    Port (  result : in STD_LOGIC_VECTOR (7 downto 0);
            hexa_BCD_unidade: OUT STD_LOGIC_VECTOR(3 DOWNTO 0):= "0000"  ;
            hexa_BCD_dezena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000"  ;
            hexa_BCD_centena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0):= "0000"  ;
            hexa_BCD_milhar: OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000" );
end hexa_decoder;

architecture Behavioral of hexa_decoder is

signal aux_result : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL AUX_DEZ : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
SIGNAL AUX_UNI : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

begin

AUX_RESULT <= RESULT;

process(AUX_RESULT)
begin
    while(AUX_RESULT >= "100000") LOOP
        aux_result <= STD_LOGIC_VECTOR ( UNSIGNED(aux_result) - "100000");
        AUX_DEZ <= STD_LOGIC_VECTOR ( UNSIGNED(AUX_DEZ) + 1);        
    END LOOP;
    
    while(AUX_RESULT >= "1") LOOP
        aux_result <= STD_LOGIC_VECTOR ( UNSIGNED(aux_result) - "1");
        AUX_UNI <= STD_LOGIC_VECTOR ( UNSIGNED(AUX_UNI) + 1);        
    END LOOP;
    
    hexa_BCD_unidade <= AUX_UNI;
    hexa_BCD_dezena <= AUX_DEZ;
    hexa_BCD_centena <= "0000";
    hexa_BCD_milhar <= "0000";
    
end process;

end Behavioral;