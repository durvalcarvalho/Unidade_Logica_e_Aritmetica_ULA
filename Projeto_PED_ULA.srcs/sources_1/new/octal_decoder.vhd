library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity octal_decoder is
    Port (  result : in STD_LOGIC_VECTOR (7 downto 0);
            oct_BCD_unidade: OUT STD_LOGIC_VECTOR (3 DOWNTO 0):="0000";
            oct_BCD_dezena: OUT STD_LOGIC_VECTOR (3 DOWNTO 0) :="0000";
            oct_BCD_centena: OUT STD_LOGIC_VECTOR (3 DOWNTO 0):="0000";
            oct_BCD_milhar: OUT STD_LOGIC_VECTOR (3 DOWNTO 0) :="0000";
            overflow : OUT STD_LOGIC := '0');
end octal_decoder;

architecture Behavioral of octal_decoder is

signal bin_4bits : STD_LOGIC_VECTOR (3 downto 0);

begin

oct_BCD_milhar  <= "0000";
oct_BCD_centena <= "0000";

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
        when "0000" => oct_BCD_unidade <= "0000"; oct_BCD_dezena <= "0000"; -- 0
        when "0001" => oct_BCD_unidade <= "0001"; oct_BCD_dezena <= "0000"; -- 1
        when "0010" => oct_BCD_unidade <= "0010"; oct_BCD_dezena <= "0000"; -- 2
        when "0011" => oct_BCD_unidade <= "0011"; oct_BCD_dezena <= "0000"; -- 3
        when "0100" => oct_BCD_unidade <= "0100"; oct_BCD_dezena <= "0000"; -- 4
        when "0101" => oct_BCD_unidade <= "0101"; oct_BCD_dezena <= "0000"; -- 5
        when "0110" => oct_BCD_unidade <= "0110"; oct_BCD_dezena <= "0000"; -- 6
        when "0111" => oct_BCD_unidade <= "0111"; oct_BCD_dezena <= "0000"; -- 7
        when "1000" => oct_BCD_unidade <= "0000"; oct_BCD_dezena <= "0001"; -- 8
        when "1001" => oct_BCD_unidade <= "0001"; oct_BCD_dezena <= "0001"; -- 9
        when "1010" => oct_BCD_unidade <= "0010"; oct_BCD_dezena <= "0001"; -- 10
        when "1011" => oct_BCD_unidade <= "0011"; oct_BCD_dezena <= "0001"; -- 11
        when "1100" => oct_BCD_unidade <= "0100"; oct_BCD_dezena <= "0001"; -- 12
        when "1101" => oct_BCD_unidade <= "0101"; oct_BCD_dezena <= "0001"; -- 13
        when "1110" => oct_BCD_unidade <= "0110"; oct_BCD_dezena <= "0001"; -- 14
        when "1111" => oct_BCD_unidade <= "0111"; oct_BCD_dezena <= "0001"; -- 15
    END CASE;
end process;

end Behavioral;