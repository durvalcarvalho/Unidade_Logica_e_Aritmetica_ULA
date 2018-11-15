library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ULA_4bits is
    Port ( binary_a : in UNSIGNED (3 downto 0);
           binary_b : in UNSIGNED (3 downto 0);
           modo : in UNSIGNED (3 downto 0);
           codigo : in STD_LOGIC_VECTOR (2 downto 0);
           clk : in STD_LOGIC;
           anodo_display : out STD_LOGIC_VECTOR (3 downto 0);
           segmento_display : out STD_LOGIC_VECTOR (6 downto 0));
end ULA_4bits;

architecture Behavioral of ULA_4bits is

component decoder is
    Port (  result : in UNSIGNED (7 downto 0);
            codigo: in STD_LOGIC_VECTOR(3 DOWNTO 0);
            result_BCD_milhar: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            result_BCD_centena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            result_BCD_dezena: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            result_BCD_unidade: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;

signal all_zero     : UNSIGNED(3 DOWNTO 0):=(others=>'0'); -- zerar todos os bits da variável
signal all_one      : UNSIGNED(3 DOWNTO 0):=(others=>'1'); -- um em todos os bits da variável
signal a_or_b       : UNSIGNED(3 DOWNTO 0); -- realizar operação 'or' bit a bit de a com b
signal a_and_b      : UNSIGNED(3 DOWNTO 0); -- realizar operação 'and' bit a bit de a com b
signal a_xor_b      : UNSIGNED(3 DOWNTO 0); -- realizar operação 'xor' bit a bit de a com b
signal not_a        : UNSIGNED(3 DOWNTO 0); -- realizar operação 'not' bit a bit de a com b (inversora)
signal a_plus_b     : UNSIGNED(3 DOWNTO 0); -- somar a com b (retornar bit indicando se houve ou não overflow) -- TRATAR CASOS DE OVERFLOW
signal a_minus_b    : UNSIGNED(3 DOWNTO 0); -- subtrair a com b (retornar bit indicando se houve ou não overflow) -- TRATAR CASOS DE OVERFLOW
signal a_x_b        : UNSIGNED(7 DOWNTO 0); -- multiplicar a com b (retornar bit indicando se houve ou não overflow)
signal a_div_b      : UNSIGNED(6 DOWNTO 0); -- dividir a com b (retornar bit indicando se houve ou não overflow)
signal a_mod_b      : UNSIGNED(3 DOWNTO 0); -- calcular o resto da divisão de a por b
signal a_x_a        : UNSIGNED(7 DOWNTO 0); -- calcular o quadrado de a
signal compl_a      : UNSIGNED(3 DOWNTO 0); -- calcular o complemento de 2 de a
signal a_plus_1     : UNSIGNED(3 DOWNTO 0); -- somar a com '0001'

signal result: UNSIGNED(7 DOWNTO 0); -- resultado da operacao que sera usada no display

-- ESSES SIGNAL IR�? RECEBER UM DOS CODIGOS ACIMA DE ACORDO COM A ENTRADA DO CODIGO
signal selected_result_unidade: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal selected_result_dezena: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal selected_result_centena: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal selected_result_milhar: STD_LOGIC_VECTOR(3 DOWNTO 0);

begin

-- ETAPA 1: CALCULAR TODOS OS POSS�?VEIS RESULTADOS
a_or_b      <= binary_a OR binary_b;
a_and_b     <= binary_a AND binary_b;
a_xor_b     <= binary_a XOR binary_b;
not_a       <= NOT binary_A;
a_plus_b    <= binary_a + binary_b;
a_plus_1    <= binary_a + 1;
compl_a     <= 0 - binary_a;
a_mod_b     <= binary_a mod binary_b;
a_x_b       <= binary_a * binary_b;
a_x_a       <= binary_a * binary_a;
a_minus_b   <= binary_a + (0-binary_b); -- soma com o complemento de 2 de b
a_div_b     <= (binary_a & "000") / (binary_b & "000");
-- FIM DA ETAPA 1
------------------------------------------------------------


-- ETAPA 2: Atribuir a resposta esperada de acordo com o modo
find_mode: process(modo)
    begin
        case modo is
            WHEN "0000" => result <= "0000" & all_zero;  -- ZERA    (0,0,0,0)
            WHEN "0001" => result <= "0000" & all_one;   -- TUDO UM (1,1,1,1)
            WHEN "0010" => result <= "0000" & binary_a;  -- OPA     (A0, A1, A2, A3)
            WHEN "0011" => result <= "0000" & binary_b;  -- OPB     (B0, B1, B2, B3)
            WHEN "0100" => result <= "0000" & a_or_b;    -- OR      (A OR B)
            WHEN "0101" => result <= "0000" & a_and_b;   -- AND     (A AND B)
            WHEN "0110" => result <= "0000" & a_xor_b;   -- XOR     (A XOR B)
            WHEN "0111" => result <= "0000" & not_a;     -- NOTA    (NOT A)
            WHEN "1000" => result <= "0000" & a_plus_b;  -- SOMA    (A + B)
            WHEN "1001" => result <= "0000" & a_minus_b; -- SUBT    (A - B)
            WHEN "1010" => result <= a_x_b;              -- MULT    (A * B)
            WHEN "1011" => result <= "0" & a_div_b;      -- DIV     (A / B)
            WHEN "1100" => result <= "0000" & a_mod_b;   -- MOD     (A MOD B) -- resto da divisão de a por b
            WHEN "1101" => result <= a_x_a;              -- SQA     ( A * A) 
            WHEN "1110" => result <= "0000" & compl_a;   -- NEGA    (-A) -- complemento de 2 de A
            WHEN "1111" => result <= a_plus_1;           -- ADD1    (A + 1)
        end case;
end process;

-- FIM DA ETAPA 2
------------------------------------------------------------------


-- ETAPA 3: CONVERTER A RESPOSTA PARA TODOS OS C�DIGOS EM BCD
decod: decoder PORT MAP(result, codigo, selected_result_milhar, selected_result_centena, selected_result_dezena, selected_result_unidade);

-- FIM DA ETAPA 3
----------------------------------------------------------------------

-- ETAPA 5: MOSTRAR O VALOR NO DISPLAY
-- USAR UM CLOCK PARA ALTERAR ENTRE DISPLAY E unidade, dezena, centena e milhar

end Behavioral; 