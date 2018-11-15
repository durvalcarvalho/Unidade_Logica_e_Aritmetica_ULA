library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ULA_4bits is
    Port ( binary_a : in STD_LOGIC_VECTOR (3 downto 0);
           binary_b : in STD_LOGIC_VECTOR (3 downto 0);
           modo : in STD_LOGIC_VECTOR (3 downto 0); -- modo da calculadora
           codigo : in STD_LOGIC_VECTOR (2 downto 0); -- codigo desejado (decimal, hexadecimal, binario, octal)
           
           clock_basys : in STD_LOGIC; -- CLOCK QUE SER�? USADO NO CONTADOR
           
           anodo_display : out STD_LOGIC_VECTOR (3 downto 0); -- variavel para escolher qual display irá ligar
           segmento_display : out STD_LOGIC_VECTOR (6 downto 0)); -- variavel para escolher qual leds do display irá ligar
end ULA_4bits;

architecture Behavioral of ULA_4bits is


-- TODOS ESSES SIGNAL SERÃO CALCULADOS, ASSIM QUE A E B FOREM DEFINIDOS, DEPENDENDO DO MODE, UMA DESSAS
-- VARI�?VEIS IR�? SER USADA NO DISPLAY DE 7 SEGMENTOS
signal all_zero : STD_LOGIC_VECTOR(3 DOWNTO 0):=(others=>'0'); -- zerar todos os bits da variável
signal all_one  : STD_LOGIC_VECTOR(3 DOWNTO 0):=(others=>'1'); -- um em todos os bits da variável
signal a_or_b  : STD_LOGIC_VECTOR(3 DOWNTO 0); -- realizar operação 'or' bit a bit de a com b
signal a_and_b  : STD_LOGIC_VECTOR(3 DOWNTO 0); -- realizar operação 'and' bit a bit de a com b
signal a_xor_b  : STD_LOGIC_VECTOR(3 DOWNTO 0); -- realizar operação 'xor' bit a bit de a com b
signal not_a  : STD_LOGIC_VECTOR(3 DOWNTO 0); -- realizar operação 'not' bit a bit de a com b (inversora)
signal a_plus_b  : STD_LOGIC_VECTOR(3 DOWNTO 0); -- somar a com b (retornar bit indicando se houve ou não overflow)
signal a_minus_b  : STD_LOGIC_VECTOR(3 DOWNTO 0); -- subtrair a com b (retornar bit indicando se houve ou não overflow)
signal a_x_b  : STD_LOGIC_VECTOR(3 DOWNTO 0); -- multiplicar a com b (retornar bit indicando se houve ou não overflow)
signal a_div_b  : STD_LOGIC_VECTOR(3 DOWNTO 0); -- dividir a com b (retornar bit indicando se houve ou não overflow)
signal a_mod_b  : STD_LOGIC_VECTOR(3 DOWNTO 0); -- calcular o resto da divisão de a por b
signal a_x_a  : STD_LOGIC_VECTOR(3 DOWNTO 0); -- calcular o quadrado de a
signal compl_a  : STD_LOGIC_VECTOR(3 DOWNTO 0); -- calcular o complemento de 2 de a
signal a_plus_1  : STD_LOGIC_VECTOR(3 DOWNTO 0); -- somar a com '0001'

signal result: STD_LOGIC_VECTOR(3 DOWNTO 0); -- resultado da operação que será usada no display

-- BCD QUE IR�? GUARDAR OS VALORES EM DECIMAL
signal decimal_result_unidade: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal decimal_result_dezena: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal decimal_result_centena: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal decimal_result_milhar: STD_LOGIC_VECTOR(3 DOWNTO 0);

-- BCD QUE IR�? GUARDAR OS VALORES EM OCTAL
signal octal_result_unidade: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal octal_result_dezena: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal octal_result_centena: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal octal_result_milhar: STD_LOGIC_VECTOR(3 DOWNTO 0);

-- BCD QUE IR�? GUARDAR OS VALORES EM HEXADECIMAL
signal hexadecimal_result_unidade: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal hexadecimal_result_dezena: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal hexadecimal_result_centena: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal hexadecimal_result_milhar: STD_LOGIC_VECTOR(3 DOWNTO 0);

-- BCD QUE IR�? GUARDAR OS VALORES EM binario -- 0000 ou 0001
signal binario_result_unidade: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal binario_result_dezena: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal binario_result_centena: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal binario_result_milhar: STD_LOGIC_VECTOR(3 DOWNTO 0);

-- ESSES SIGNAL IR�? RECEBER UM DOS CODIGOS ACIMA DE ACORDO COM A ENTRADA DO CODIGO
signal selected_result_unidade: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal selected_result_dezena: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal selected_result_centena: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal selected_result_milhar: STD_LOGIC_VECTOR(3 DOWNTO 0);

begin

-- ETAPA 1: CALCULAR TODOS OS POSS�?VEIS RESULTADOS
------------------------------------------------------------
-- REALIZAR OPERAÇÕES PARA CALCULAR OS SIGNALS --

-- exemplo de assinatura de função
calcula_or: operacao_or PORT MAP(binary_a, binary_b, a_or_b);
--^ identificador               ^ PORT MAP COM ENTRADAS A E B, e retorno no signal já definido
--              ^ nome do circuito criado

calcula_and: operacao_and PORT MAP(binary_a, binary_b, a_and_b);

calcula_xor: operacao_and PORT MAP(binary_a, binary_b, a_and_b);

-- É PRECISO FAZER TODAS ESSAS OPERAÇÕES, e guardar o valor no signal já definido
------------------------------------------------------------





-- ETAPA 2: Encontrar a resposta esperada de acordo com o modo
------------------------------------------------------------
-- PROCESS PARA ATRIBUIR O VALOR DESEJADO NO BINARIO RESULT
find_mode: process(modo)
    begin
        case modo is
            WHEN "0000" => result <= all_zero;  -- ZERA    (0,0,0,0)
            WHEN "0001" => result <= all_one;   -- TUDO UM (1,1,1,1)
            WHEN "0010" => result <= binary_a;  -- OPA     (A0, A1, A2, A3)
            WHEN "0011" => result <= binary_b;  -- OPB     (B0, B1, B2, B3)
            WHEN "0100" => result <= a_or_b;    -- OR      (A OR B)
            WHEN "0101" => result <= a_and_b;   -- AND     (A AND B)
            WHEN "0110" => result <= a_xor_b;   -- XOR     (A XOR B)
            WHEN "0111" => result <= not_a;     -- NOTA    (NOT A)
            WHEN "1000" => result <= a_plus_b;  -- SOMA    (A + B)
            WHEN "1001" => result <= a_minus_b; -- SUBT    (A - B)
            WHEN "1010" => result <= a_x_b;     -- MULT    (A * B)
            WHEN "1011" => result <= a_div_b;   -- DIV     (A / B)
            WHEN "1100" => result <= a_mod_b;   -- MOD     (A MOD B) -- resto da divisão de a por b
            WHEN "1101" => result <= a_x_a;     -- SQA     ( A * A) 
            WHEN "1110" => result <= compl_a;   -- NEGA    (-A) -- complemento de 2 de A
            WHEN "1111" => result <= a_plus_1;  -- ADD1    (A + 1)
        end case;
end process;
------------------------------------------------------------------

-- ETAPA 3: CODIFICAR OS CODIGOS PARA BCD DE ACORDO COM O CODIGO DESEJADO
            -- primeiro converter binario para 'codigo dejeado'
            -- segundo converter 'codigo desjeado' para bcd com 4 digitos

codificador_to_binario: codificador_to_binario PORT MAP(result, binario_result_milhar, binario_result_centena, binario_result_dezena, binario_result_unidade);
codificador_to_decimal: codificador_to_decimal PORT MAP(result, decimal_result_milhar, decimal_result_centena, decimal_result_dezena, decimal_result_unidade);
codificador_to_hexadecimal: codificador_to_hexadecimal PORT MAP(result, hexadecimal_result_milhar, hexadecimal_result_centena, hexadecimal_result_dezena, hexadecimal_result_unidade);
codificador_to_octal: codificador_to_octal PORT MAP(result, octal_result_milhar, octal_result_centena, octal_result_dezena, octal_result_unidade);

----------------------------------------------------------------------

-- ETAPA 4: ENCONTRAR E ATRIBUIR O CODIGO DESEJADO

find_codigo: process(codigo)
    begin
        case codigo is
            WHEN "00" => 
                selected_result_unidade <= decimal_result_unidade;
                selected_result_dezena  <= decimal_result_dezena;
                selected_result_centena <= decimal_result_centena;
                selected_result_milhar  <= decimal_result_milhar;
            WHEN "01" =>
                selected_result_unidade <= hexadecimal_result_unidade;
                selected_result_dezena  <= hexadecimal_result_dezena;
                selected_result_centena <= hexadecimal_result_centena;
                selected_result_milhar  <= hexadecimal_result_milhar;
            WHEN "10" => 
                selected_result_unidade <= binario_result_unidade;
                selected_result_dezena  <= binario_result_dezena;
                selected_result_centena <= binario_result_centena;
                selected_result_milhar  <= binario_result_milhar;
            WHEN "11" => 
                selected_result_unidade <= octal_result_unidade;
                selected_result_dezena  <= octal_result_dezena;
                selected_result_centena <= octal_result_centena;
                selected_result_milhar  <= octal_result_milhar;
        end case;
end process

-------------------------------------------------------------------

-- ETAPA 5: MOSTRAR O VALOR NO DISPLAY
-- USAR UM CLOCK PARA ALTERAR ENTRE DISPLAY E unidade, dezena, centena e milhar

end Behavioral;