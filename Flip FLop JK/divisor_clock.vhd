library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divisor_clock is
    Generic (divisor:integer:=100_000);
    Port ( clk_master : in STD_LOGIC;
           clk_dividido : out STD_LOGIC);
end divisor_clock;

architecture Behavioral of divisor_clock is

signal counter: INTEGER:=0;--Contador para o clock dividido
signal Sclk_dividido: STD_LOGIC:='0';--Clock divido
begin

clk_dividido <= Sclk_dividido;
----------------------------
----  Divisor de clock -----
----------------------------
    divisor_clock: process(clk_master)
    begin
        if rising_edge(clk_master) then
            if counter = divisor then
                counter <= 0;
                Sclk_dividido <= not Sclk_dividido;
            else             
                counter <= counter + 1;
            end if;
        end if;
    end process;
end Behavioral;
