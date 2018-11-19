library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entidade que converte um numero binario para BCD Decimal
entity dec_decoder is
    Port (  result : in STD_LOGIC_VECTOR (7 downto 0);
            dec_BCD_unidade: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            dec_BCD_dezena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            dec_BCD_centena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            dec_BCD_milhar: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end dec_decoder;

architecture Behavioral of dec_decoder is

signal aux_result : STD_LOGIC_VECTOR (7 downto 0);
signal aux_mil, aux_cent, aux_dez, aux_uni : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

begin

aux_result <= result;

-- Conversão
process(aux_result)
begin    
    -- centena
    while (aux_result >= "1100100") loop
            aux_result <= STD_LOGIC_VECTOR ( UNSIGNED(aux_result) - "1100100");
            aux_cent <= STD_LOGIC_VECTOR ( UNSIGNED(aux_cent) + 1);
        end loop;
    
    -- dezena
    while (aux_result >= "1010") loop
        aux_result <= STD_LOGIC_VECTOR ( UNSIGNED(aux_result) - "1010");
        aux_dez <= STD_LOGIC_VECTOR ( UNSIGNED(aux_dez) + 1);
    end loop;
    
    -- unidade
    while (aux_result >= "1") loop
        aux_result <= STD_LOGIC_VECTOR ( UNSIGNED(aux_result) - "1");
        aux_uni <= STD_LOGIC_VECTOR ( UNSIGNED(aux_uni) + 1);
    end loop;
    
    dec_BCD_unidade <= aux_uni;
    dec_BCD_dezena  <= aux_dez;
    dec_BCD_centena <= aux_cent;
    dec_BCD_milhar  <= "0000";
        
end process;

end Behavioral;