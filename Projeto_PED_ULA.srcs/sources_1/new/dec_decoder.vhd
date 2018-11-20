library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entidade que converte um numero binario para BCD Decimal
entity dec_decoder is
    Port (  result : in STD_LOGIC_VECTOR (7 downto 0);
            dec_BCD_unidade: OUT STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
            dec_BCD_dezena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0) :="0000";
            dec_BCD_centena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
            dec_BCD_milhar: OUT STD_LOGIC_VECTOR(3 DOWNTO 0) :="0000";
            overflow : OUT STD_LOGIC := '0');
end dec_decoder;

architecture Behavioral of dec_decoder is

signal bin_4bits : STD_LOGIC_VECTOR (3 downto 0);

begin

-- ESSES DIGITOS NAO SERAO UTILIZADOS
dec_BCD_centena <= "0000";
dec_BCD_milhar <=  "0000";

-- IDENTIFICANDO OVERFLOW
process(result)
begin
    if(result(4) = '1') then
        overflow <= '1';
    
    elsif(result(5) = '1') then
        overflow <= '1';
        
    elsif(result(6) = '1') then
        overflow <= '1';
        
    elsif(result(7) = '1') then
        overflow <= '1';
    ELSE
        overflow <= '0';
    end if;
end process;

-- SOMENTE DE 0 15 
bin_4bits(0) <= result(0);
bin_4bits(1) <= result(1);
bin_4bits(2) <= result(2);
bin_4bits(3) <= result(3);

process(bin_4bits)
begin
    case bin_4bits is 
        when "0000" => dec_BCD_unidade <= "0000"; dec_BCD_dezena <= "0000"; -- 00
        when "0001" => dec_BCD_unidade <= "0001"; dec_BCD_dezena <= "0000"; -- 01
        when "0010" => dec_BCD_unidade <= "0010"; dec_BCD_dezena <= "0000"; -- 02
        when "0011" => dec_BCD_unidade <= "0011"; dec_BCD_dezena <= "0000"; -- 03
        when "0100" => dec_BCD_unidade <= "0100"; dec_BCD_dezena <= "0000"; -- 04
        when "0101" => dec_BCD_unidade <= "0101"; dec_BCD_dezena <= "0000"; -- 05
        when "0110" => dec_BCD_unidade <= "0110"; dec_BCD_dezena <= "0000"; -- 06
        when "0111" => dec_BCD_unidade <= "0111"; dec_BCD_dezena <= "0000"; -- 07
        when "1000" => dec_BCD_unidade <= "1000"; dec_BCD_dezena <= "0000"; -- 08
        when "1001" => dec_BCD_unidade <= "1001"; dec_BCD_dezena <= "0000"; -- 09
        when "1010" => dec_BCD_unidade <= "0000"; dec_BCD_dezena <= "0001"; -- 10
        when "1011" => dec_BCD_unidade <= "0001"; dec_BCD_dezena <= "0001"; -- 11
        when "1100" => dec_BCD_unidade <= "0010"; dec_BCD_dezena <= "0001"; -- 12
        when "1101" => dec_BCD_unidade <= "0011"; dec_BCD_dezena <= "0001"; -- 13
        when "1110" => dec_BCD_unidade <= "0100"; dec_BCD_dezena <= "0001"; -- 14
        when "1111" => dec_BCD_unidade <= "0101"; dec_BCD_dezena <= "0001"; -- 15
    END CASE;
end process;

end Behavioral;