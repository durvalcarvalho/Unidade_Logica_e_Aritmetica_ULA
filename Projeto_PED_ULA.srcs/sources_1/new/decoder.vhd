library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Essa entidade ira receber um 'result' em binario de 8 bits e um codigo de 4 bits
-- e ira retornar 4 variaveis de 4 bits correspondente a conversao do codigo desejado em bcd 
entity decoder is
    Port (  result : in STD_LOGIC_VECTOR (7 downto 0); -- binario
            codigo: in STD_LOGIC_VECTOR(3 DOWNTO 0); -- octal, binario, hexadecimal, decimal
            
            result_BCD_milhar: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            result_BCD_centena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            result_BCD_dezena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            result_BCD_unidade: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end decoder;

architecture Behavioral of decoder is

-- decoder para binario - BCD
component bin_decoder is
    Port (  result : in STD_LOGIC_VECTOR (7 downto 0);
            bin_BCD_unidade: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            bin_BCD_dezena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            bin_BCD_centena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            bin_BCD_milhar: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;

-- decoder para decimal - BCD
component dec_decoder is
    Port (  result : in STD_LOGIC_VECTOR (7 downto 0);
            dec_BCD_unidade: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            dec_BCD_dezena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            dec_BCD_centena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            dec_BCD_milhar: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;

-- decoder para hexa - bcd
component hexa_decoder is
    Port (  result : in STD_LOGIC_VECTOR (7 downto 0);
            hexa_BCD_unidade: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            hexa_BCD_dezena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            hexa_BCD_centena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            hexa_BCD_milhar: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;

-- decoder para octal - bcd
component octal_decoder is
    Port (  result : in STD_LOGIC_VECTOR (7 downto 0);
            oct_BCD_unidade: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            oct_BCD_dezena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            oct_BCD_centena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            oct_BCD_milhar: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;

signal decimal_result_unidade: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal decimal_result_dezena: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal decimal_result_centena: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal decimal_result_milhar: STD_LOGIC_VECTOR(3 DOWNTO 0);

signal octal_result_unidade: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal octal_result_dezena: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal octal_result_centena: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal octal_result_milhar: STD_LOGIC_VECTOR(3 DOWNTO 0);

signal hexadecimal_result_unidade: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal hexadecimal_result_dezena: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal hexadecimal_result_centena: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal hexadecimal_result_milhar: STD_LOGIC_VECTOR(3 DOWNTO 0);

signal binario_result_unidade: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal binario_result_dezena: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal binario_result_centena: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal binario_result_milhar: STD_LOGIC_VECTOR(3 DOWNTO 0);

begin

-- resposta em todos  os codigos
bin_decod: bin_decoder PORT MAP(result=>result,
                                bin_BCD_unidade=>binario_result_unidade,
                                bin_BCD_dezena=>binario_result_dezena,
                                bin_BCD_centena=>binario_result_centena,
                                bin_BCD_milhar=>binario_result_milhar);
                                
dec_decod: dec_decoder PORT MAP(result=>result,
                                dec_BCD_unidade=>decimal_result_unidade,
                                dec_BCD_dezena=>decimal_result_dezena,
                                dec_BCD_centena=>decimal_result_centena,
                                dec_BCD_milhar=>decimal_result_milhar);

hex_decod: hexa_decoder PORT MAP(result=>result,
                                hexa_BCD_unidade=>hexadecimal_result_unidade,
                                hexa_BCD_dezena=>hexadecimal_result_dezena,
                                hexa_BCD_centena=>hexadecimal_result_centena,
                                hexa_BCD_milhar=>hexadecimal_result_milhar);
                                
oct_decod: octal_decoder PORT MAP(  result=>result,
                                    oct_BCD_unidade=>octal_result_unidade,
                                    oct_BCD_dezena=>octal_result_dezena,
                                    oct_BCD_centena=>octal_result_centena,
                                    oct_BCD_milhar=>octal_result_milhar);

-- atribuindo o retorno com o codigo escolhido
find_codigo: process(codigo)
    begin
        case codigo is
            WHEN "00" =>
                result_BCD_unidade <= decimal_result_unidade;
                result_BCD_dezena  <= decimal_result_dezena;
                result_BCD_centena <= decimal_result_centena;
                result_BCD_milhar  <= decimal_result_milhar;
            WHEN "01" =>
                result_BCD_unidade <= hexadecimal_result_unidade;
                result_BCD_dezena  <= hexadecimal_result_dezena;
                result_BCD_centena <= hexadecimal_result_centena;
                result_BCD_milhar  <= hexadecimal_result_milhar; 
            WHEN "10" =>
                result_BCD_unidade <= binario_result_unidade;
                result_BCD_dezena  <= binario_result_dezena;
                result_BCD_centena <= binario_result_centena;
                result_BCD_milhar  <= binario_result_milhar;
            WHEN "11" =>
                result_BCD_unidade <= octal_result_unidade;
                result_BCD_dezena  <= octal_result_dezena;
                result_BCD_centena <= octal_result_centena;
                result_BCD_milhar  <= octal_result_milhar;
        end case;
end process;

end Behavioral;