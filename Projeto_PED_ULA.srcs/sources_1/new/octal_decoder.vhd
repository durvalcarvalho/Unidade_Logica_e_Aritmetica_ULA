library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity octal_decoder is
    Port (  result : in STD_LOGIC_VECTOR (7 downto 0);
            oct_BCD_unidade: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            oct_BCD_dezena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            oct_BCD_centena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            oct_BCD_milhar: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end octal_decoder;

architecture Behavioral of octal_decoder is

SIGNAL AUX_UNI, AUX_DEZ, AUX_CENT : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000" ;
SIGNAL AUX_RESULT : STD_LOGIC_VECTOR (7 DOWNTO 0);

begin

AUX_RESULT <= RESULT;

PROCESS(AUX_RESULT)
BEGIN
    WHILE(AUX_RESULT) >= "1000000" LOOP
        aux_result <= STD_LOGIC_VECTOR ( UNSIGNED(aux_result) - "1000000");
        AUX_CENT <= STD_LOGIC_VECTOR ( UNSIGNED(AUX_CENT) + 1);
    END LOOP;
    
    WHILE(AUX_RESULT) >= "1000" LOOP
        aux_result <= STD_LOGIC_VECTOR ( UNSIGNED(aux_result) - "1000");
        AUX_DEZ <= STD_LOGIC_VECTOR ( UNSIGNED(AUX_DEZ) + 1);
    END LOOP;
    
    WHILE(AUX_RESULT) >= "1" LOOP
        aux_result <= STD_LOGIC_VECTOR ( UNSIGNED(aux_result) - "1");
        AUX_UNI <= STD_LOGIC_VECTOR ( UNSIGNED(AUX_UNI) + 1);
    END LOOP;
    
    oct_BCD_unidade <= aux_uni;
    oct_BCD_dezena <= aux_dez;
    oct_BCD_centena <= aux_cent;
    oct_BCD_milhar <= "0000";
    
END PROCESS;

end Behavioral;