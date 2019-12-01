library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somador_subtrator is
    Generic(n: integer := 5);--number of bits of the input
    Port ( a, b : in STD_LOGIC_VECTOR (n-1 downto 0);
           seletor: in STD_LOGIC;
           resultado : out STD_LOGIC_VECTOR (n-1 downto 0);
           carry_out: out STD_LOGIC;
           overflow : out STD_LOGIC);
end somador_subtrator;

architecture Behavioral of somador_subtrator is
    COMPONENT complemento1
        Generic(n: positive);--number of bits of the input    Generic(n: positive);--number of bits of the input
        Port ( entrada : in STD_LOGIC_VECTOR(n-1 downto 0);
                   enable : in STD_LOGIC;
                   saida : out STD_LOGIC_VECTOR(n-1 downto 0));
    end COMPONENT;

    COMPONENT indicador_overflow 
        Port ( a, b, ultima_soma : in STD_LOGIC;
               flag_overflow : out STD_LOGIC);
    END COMPONENT;
    
    COMPONENT som_Nbits
      Generic(n: positive);--number of bits of the input
      PORT (x, y : IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);  -- entradas do somador
            carry_in   : IN  STD_LOGIC;                     -- entrada  vem um
            s    : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);  -- soma
            carry_out   : OUT STD_LOGIC);                    -- vai um
    END COMPONENT;
    
  signal saida_complemento1: STD_LOGIC_VECTOR (n-1 DOWNTO 0);
  signal resultado_aux : STD_LOGIC_VECTOR (n-1 downto 0);
begin
--
-- complemento 1
--
comp1: complemento1 GENERIC MAP(n) PORT MAP (b, seletor, saida_complemento1);
--
-- Soma de 4 bits
--
somaNbits: som_Nbits GENERIC MAP(n) PORT MAP (a,saida_complemento1,seletor,resultado_aux,carry_out);
--
-- Indicador de overflow
--
overf: indicador_overflow PORT MAP (a(n-1),b(n-1),resultado_aux(n-1),overflow);
--
resultado <= resultado_aux;
end Behavioral;
