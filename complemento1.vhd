library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity complemento1 is
    Generic(n: positive := 4);--number of bits of the input
    Port ( entrada : in STD_LOGIC_VECTOR(n-1 downto 0);
           enable : in STD_LOGIC;
           saida : out STD_LOGIC_VECTOR(n-1 downto 0));
end complemento1;

architecture Behavioral of complemento1 is

begin
label1: FOR i IN 0 TO n-1 GENERATE
    saida(i) <= entrada(i) xor enable;
END GENERATE;

end Behavioral;
