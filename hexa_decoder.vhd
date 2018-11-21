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
        end if;
    end process;
    
    bin_4bits(0) <= result(0);
    bin_4bits(1) <= result(1);
    bin_4bits(2) <= result(2);
    bin_4bits(3) <= result(3);
      
    with bin_4bits select
        hexa_BCD_unidade <=  "1000000" when "0000",  -- '0'
                             "1111001" when "0001",  -- '1'
                             "0100100" when "0010",  -- '2'
                             "0110000" when "0011",  -- '3'
                             "0011001" when "0100",  -- '4' 
                             "0010010" when "0101",  -- '5'
                             "0000010" when "0110",  -- '6'
                             "1111000" when "0111",  -- '7'
                             "0000000" when "1000",  -- '8'
                             "0010000" when "1001",  -- '9'
                             "0001000" when "1010",  -- 'A'
                             "0000011" when "1011",  -- 'b'
                             "1000110" when "1100",  -- 'C'
                             "0100001" when "1101",  -- 'd'
                             "0000110" when "1110",  -- 'E'
                             "0001110" when "1111",  -- 'F'
                             "1111111" when others;  -- apaga
end Behavioral;