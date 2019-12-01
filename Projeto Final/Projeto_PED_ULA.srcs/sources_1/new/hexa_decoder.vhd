library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity hexa_decoder is
    Port (  result : in STD_LOGIC_VECTOR (7 downto 0);
            hexa_BCD_unidade: OUT STD_LOGIC_VECTOR(3 DOWNTO 0):= "0000";
            hexa_BCD_dezena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
            hexa_BCD_centena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0):= "0000";
            hexa_BCD_milhar: OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
            overflow : OUT STD_LOGIC := '0');
end hexa_decoder;

architecture Behavioral of hexa_decoder is

signal bin_4bits : STD_LOGIC_VECTOR (3 downto 0);

begin

hexa_BCD_milhar  <= "0000";
hexa_BCD_centena <= "0000";

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

bin_4bits(0) <= result(0);
bin_4bits(1) <= result(1);
bin_4bits(2) <= result(2);
bin_4bits(3) <= result(3);

process(bin_4bits)
begin
    case bin_4bits is 
        when "0000" => HEXA_BCD_unidade <= "0000"; -- 00
        when "0001" => HEXA_BCD_unidade <= "0001"; -- 01
        when "0010" => HEXA_BCD_unidade <= "0010"; -- 02
        when "0011" => HEXA_BCD_unidade <= "0011"; -- 03
        when "0100" => HEXA_BCD_unidade <= "0100"; -- 04
        when "0101" => HEXA_BCD_unidade <= "0101"; -- 05
        when "0110" => HEXA_BCD_unidade <= "0110"; -- 06
        when "0111" => HEXA_BCD_unidade <= "0111"; -- 07
        when "1000" => HEXA_BCD_unidade <= "1000"; -- 08
        when "1001" => HEXA_BCD_unidade <= "1001"; -- 09
        when "1010" => HEXA_BCD_unidade <= "1010"; -- 10
        when "1011" => HEXA_BCD_unidade <= "1011"; -- 11
        when "1100" => HEXA_BCD_unidade <= "1100"; -- 12
        when "1101" => HEXA_BCD_unidade <= "1101"; -- 13
        when "1110" => HEXA_BCD_unidade <= "1110"; -- 14
        when "1111" => HEXA_BCD_unidade <= "1111"; -- 15
    END CASE;
end process;

end Behavioral;