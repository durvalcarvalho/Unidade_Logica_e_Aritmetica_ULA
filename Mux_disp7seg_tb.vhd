library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_disp7seg_tb is
end Mux_disp7seg_tb;

architecture Behavioral of Mux_disp7seg_tb is

    component Mux2_disp7seg
        Port ( bcd_units: in STD_LOGIC_VECTOR (3 downto 0);--entrada das unidades
               bcd_tens : in STD_LOGIC_VECTOR (3 downto 0);--entrada das dezenas           
               clk: in STD_LOGIC;--clock da Basys 3 (100 MHz)
               an: out STD_LOGIC_VECTOR (3 downto 0):="1100";--anodos dos displays de sete segmentos
               seg : out STD_LOGIC_VECTOR (6 downto 0)--catodos dos displays de sete segmentos
              );
    end component;

    signal Sbcd_units: STD_LOGIC_VECTOR (3 downto 0):="0000";--entrada das unidades
    signal sbcd_tens : STD_LOGIC_VECTOR (3 downto 0):="0000";--entrada das dezenas           
    signal Sclk: STD_LOGIC:='0';--clock da Basys 3 (100 MHz)
    signal san: STD_LOGIC_VECTOR (3 downto 0):="1100";--anodos dos displays de sete segmentos
    signal Sseg: STD_LOGIC_VECTOR (6 downto 0)--catodos dos displays de sete segmentos
    signal counter: interger:='0';
    
    constant clk_period : time := 10 ns;

    
begin

    uud: Mux2_disp7seg port map (Sbcd_units,sbcd_tens,Sclk,san,Sseg);
    
    
    clk_process: process
       begin            
            Sclk <= '0';
            wait for clk_period/2;  --for 0.5 ns signal is '0'.
            Sclk <= '1';
            wait for clk_period/2;  --for next 0.5 ns signal is '1'.
       end process;
    
    stimuli: process(Sclk)
    begin
        if rising_edge(Sclk) then
            if counter=0 then
                sbcd_tens <="0000"; Sbcd_units <= "0000";
            elsif counter=1 then
                sbcd_tens <="0000"; Sbcd_units <= "0001";
            elsif counter=2 then
                sbcd_tens <="0000"; Sbcd_units <= "0010";
            elsif counter=3 then
                sbcd_tens <="0000"; Sbcd_units <= "0011";
            elsif counter=4 then
                sbcd_tens <="0000"; Sbcd_units <= "0100";
            elsif counter=5 then
                sbcd_tens <="0000"; Sbcd_units <= "0101";
            elsif counter=6 then
                sbcd_tens <="0000"; Sbcd_units <= "0110";
            elsif counter=7 then
                sbcd_tens <="0000"; Sbcd_units <= "0111";
            elsif counter=8 then
                sbcd_tens <="0000"; Sbcd_units <= "1000";
            elsif counter=9 then
                sbcd_tens <="0000"; Sbcd_units <= "1001";
            elsif counter=10 then
                sbcd_tens <="0000"; Sbcd_units <= "1010";
            elsif counter=11 then
                sbcd_tens <="0000"; Sbcd_units <= "1011";
            elsif counter=12 then
                sbcd_tens <="0000"; Sbcd_units <= "1100";
            elsif counter=13 then
                sbcd_tens <="0000"; Sbcd_units <= "1101";
            elsif counter=14 then
                sbcd_tens <="0000"; Sbcd_units <= "1110";
            elsif counter=15 then
                sbcd_tens <="0000"; Sbcd_units <= "1111";
            elsif counter=16 then
                sbcd_tens <="0001"; Sbcd_units <= "0000";
            elsif counter=17 then
                sbcd_tens <="0001"; Sbcd_units <= "0001";
            elsif counter=18 then
                sbcd_tens <="0001"; Sbcd_units <= "0010";
            elsif counter=19 then
                sbcd_tens <="0001"; Sbcd_units <= "0011";
            elsif counter=20 then
                sbcd_tens <="0001"; Sbcd_units <= "0100";
            elsif counter=21 then
                sbcd_tens <="0001"; Sbcd_units <= "0101";
            elsif counter=22 then
                sbcd_tens <="0001"; Sbcd_units <= "0110";
            elsif counter=23 then
                sbcd_tens <="0001"; Sbcd_units <= "0111";
            elsif counter=24 then
                sbcd_tens <="0001"; Sbcd_units <= "1000";
            elsif counter=25 then
                sbcd_tens <="0001"; Sbcd_units <= "1001";
            elsif counter=26 then
                sbcd_tens <="0001"; Sbcd_units <= "1010";
            elsif counter=27 then
                sbcd_tens <="0001"; Sbcd_units <= "1011";
            elsif counter=28 then
                sbcd_tens <="0001"; Sbcd_units <= "1100";
            elsif counter=29 then
                sbcd_tens <="0001"; Sbcd_units <= "1101";
            elsif counter=30 then
                sbcd_tens <="0001"; Sbcd_units <= "1110";
            elsif counter=31 then
                sbcd_tens <="0001"; Sbcd_units <= "1111";
            elsif counter=32 then
                sbcd_tens <="0010"; Sbcd_units <= "0000";
            elsif counter=33 then
                sbcd_tens <="0010"; Sbcd_units <= "0001";
            elsif counter=34 then
                sbcd_tens <="0010"; Sbcd_units <= "0010";
            elsif counter=35 then
                sbcd_tens <="0010"; Sbcd_units <= "0011";
            elsif counter=36 then
                sbcd_tens <="0010"; Sbcd_units <= "0100";
            elsif counter=37 then
                sbcd_tens <="0010"; Sbcd_units <= "0101";
            elsif counter=38 then
                sbcd_tens <="0010"; Sbcd_units <= "0110";
            elsif counter=39 then
                sbcd_tens <="0010"; Sbcd_units <= "0111";
            elsif counter=40 then
                sbcd_tens <="0010"; Sbcd_units <= "1000";
            elsif counter=41 then
                sbcd_tens <="0010"; Sbcd_units <= "1001";
            elsif counter=42 then
                sbcd_tens <="0010"; Sbcd_units <= "1010";
            elsif counter=43 then
                sbcd_tens <="0010"; Sbcd_units <= "1011";
            elsif counter=44 then
                sbcd_tens <="0010"; Sbcd_units <= "1100";
            elsif counter=45 then
                sbcd_tens <="0010"; Sbcd_units <= "1101";
            elsif counter=46 then
                sbcd_tens <="0010"; Sbcd_units <= "1110";
            elsif counter=47 then
                sbcd_tens <="0010"; Sbcd_units <= "1111";
            elsif counter=48 then
                sbcd_tens <="0011"; Sbcd_units <= "0000";
            elsif counter=49 then
                sbcd_tens <="0011"; Sbcd_units <= "0001";
            elsif counter=50 then
                sbcd_tens <="0011"; Sbcd_units <= "0010";
            elsif counter=51 then
                sbcd_tens <="0011"; Sbcd_units <= "0011";
            elsif counter=52 then
                sbcd_tens <="0011"; Sbcd_units <= "0100";
            elsif counter=53 then
                sbcd_tens <="0011"; Sbcd_units <= "0101";
            elsif counter=54 then
                sbcd_tens <="0011"; Sbcd_units <= "0110";
            elsif counter=55 then
                sbcd_tens <="0011"; Sbcd_units <= "0111";
            elsif counter=56 then
                sbcd_tens <="0011"; Sbcd_units <= "1000";
            elsif counter=57 then
                sbcd_tens <="0011"; Sbcd_units <= "1001";
            elsif counter=58 then
                sbcd_tens <="0011"; Sbcd_units <= "1010";
            elsif counter=59 then
                sbcd_tens <="0011"; Sbcd_units <= "1011";
            elsif counter=60 then
                sbcd_tens <="0011"; Sbcd_units <= "1100";
            elsif counter=61 then
                sbcd_tens <="0011"; Sbcd_units <= "1101";
            elsif counter=62 then
                sbcd_tens <="0011"; Sbcd_units <= "1110";
            elsif counter=63 then
                sbcd_tens <="0011"; Sbcd_units <= "1111";
            end if;
        end if
    end process;

end Behavioral;
