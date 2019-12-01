library IEEE;               
use IEEE.STD_LOGIC_1164.ALL;

ENTITY som_Nbits IS
  Generic(n: positive := 4);--number of bits of the input
  PORT (x, y : IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);  -- entradas do somador
        carry_in   : IN  STD_LOGIC;                     -- entrada  vem um
        s    : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);  -- soma
        carry_out   : OUT STD_LOGIC);                    -- vai um
END som_Nbits;

ARCHITECTURE estrutural OF som_Nbits IS
  COMPONENT som_1bit
    PORT   (a, b, ve : IN  STD_LOGIC;
            s, vs : OUT STD_LOGIC); 
  END COMPONENT;

  SIGNAL aux   : STD_LOGIC_VECTOR (n DOWNTO 0);  -- vai um interno
BEGIN
--
-- atribui carry_in a aux(0)
--
aux(0) <= carry_in;
--
-- Faz n somas
--
forSoma: FOR i IN 0 TO n-1 GENERATE
    soma1bit: som_1bit PORT MAP(x(i),y(i),aux(i),s(i),aux(i+1));
END GENERATE;
--
-- atribui aux(n) a carry_out
--
carry_out <= aux(n);
--
--
--
--  x0: som_1bit PORT MAP(     x(0),      y(0),      carry_in,         s(0),       v(1));
--  x1: som_1bit PORT MAP(     x(1),      y(1),      v(1),       s(1),       v(2));  
--  x2: som_1bit PORT MAP(b => y(2), a => x(2), s => s(2), ve => v(2), vs => v(3));
--  x3: som_1bit PORT MAP(     x(3),      y(3),      v(3),       s(3),       carry_out);
END estrutural;