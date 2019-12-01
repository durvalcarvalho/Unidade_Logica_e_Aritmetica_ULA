library IEEE;               
use IEEE.STD_LOGIC_1164.ALL;

ENTITY som_1bit IS
  PORT   (a, b, ve  : IN  STD_LOGIC;
          s, vs     : OUT STD_LOGIC); 
END som_1bit;

ARCHITECTURE teste OF som_1bit IS
BEGIN
  s  <=  a XOR b  XOR ve;                      -- soma
  vs <= (a AND b) OR (a AND ve) OR (b AND ve); -- vai um
END teste;