---
--- LIBRARIES
---

---
--- ENTITY
---
entity Mux2_disp7seg is
    Port ( bcd_units: in STD_LOGIC_VECTOR (3 downto 0);--entrada das unidades
           bcd_tens : in STD_LOGIC_VECTOR (3 downto 0);--entrada das dezenas           
           clk: in STD_LOGIC;--clock da Basys 3 (100 MHz)
           an: out STD_LOGIC_VECTOR (3 downto 0):="1100";--anodos dos displays de sete segmentos
           seg : out STD_LOGIC_VECTOR (6 downto 0)--catodos dos displays de sete segmentos
          );
end Mux2_disp7seg;
---
--- ARCHITECTURE
---
architecture Behavioral of Mux2_disp7seg is

    component decod7seg_an
        port ( bcd : in STD_LOGIC_VECTOR (3 downto 0); 
           seg : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;
    
    ---
    --- SIGNALS
    ---
    signal clk_dividido: STD_LOGIC:='0';--Clock divido
--    signal counter: INTEGER:=0;--Contador para o clock dividido
    signal count: STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";--Contador para o clock dividido
    signal Sbcd: STD_LOGIC_VECTOR (3 downto 0):=(others => '0');--Armazena o bcd que será mostrado no display
    signal seletor_bcd: STD_LOGIC:='0';
    signal San: STD_LOGIC_VECTOR (3 downto 0):="1111";
    signal Sseg: STD_LOGIC_VECTOR (6 downto 0):="1111111";

begin
    ----------------------------
    ----  Divisor de clock -----
    ----------------------------
--    divisor_clock: process(clk)
--    begin
--        if rising_edge(clk) then
--            if counter = 100000 then
--                counter <= 0;
--                clk_dividido <= not clk_dividido;
--            else             
--                counter <= counter + 1;
--            end if;
--        end if;
--    end process;
    clock_divider: process(clk)
    begin 
    if rising_edge(clk) then
      --increment count.
     count <= count + 1;
    end if;
    -- Choose the 16th bit.
    clk_dividido <= count(15);
    end process;
    ----------------------------
    ----  Processo com cloque dividido -----
    ----------------------------
    escolhe_anodo: process(clk_dividido)
    begin
        if rising_edge(clk_dividido) then
        seletor_bcd  <= not seletor_bcd;
            case seletor_bcd is
                when '0' =>  Sbcd  <= bcd_units; San <= "1110";
                when '1' =>  Sbcd  <= bcd_tens;  San <= "1101";
                when others => null;
            end case;
            ---------------------------
            ----  DRIVER BCD/7seg -----
            ---------------------------
--            case Sbcd is
--                when "0000" => Sseg <= "1000000"; -- 0
--                when "0001" => Sseg <= "1111001"; -- 1
--                when "0010" => Sseg <= "0100100"; -- 2
--                when "0011" => Sseg <= "0110000"; -- 3
--                when "0100" => Sseg <= "0011001"; -- 4
--                when "0101" => Sseg <= "0010010"; -- 5
--                when "0110" => Sseg <= "0000010"; -- 6
--                when "0111" => Sseg <= "1111000"; -- 7
--                when "1000" => Sseg <= "0000000"; -- 8
--                when "1001" => Sseg <= "0010000"; -- 9
--                when "1010" => Sseg <= "0001000"; -- a
--                when "1011" => Sseg <= "0000011"; -- b
--                when "1100" => Sseg <= "1000110"; -- c
--                when "1101" => Sseg <= "0100001"; -- d
--                when "1110" => Sseg <= "0000110"; -- e
--                when "1111" => Sseg <= "0001110"; -- f
--                when others => Sseg <= "1111111"; -- others
--            end case;
            
        end if;      
    end process;
    
    seg <= Sseg;
    an <= San;
    driver_BCD_7seg: decod7seg_an port map (bcd=>Sbcd,seg=>Sseg);
--    with Sbcd select           
--        seg <= "1000000" when "0000",  -- '0'
--               "1111001" when "0001",  -- '1'
--               "0100100" when "0010",  -- '2'
--               "0110000" when "0011",  -- '3'
--               "0011001" when "0100",  -- '4' 
--               "0010010" when "0101",  -- '5'
--               "0000010" when "0110",  -- '6'
--               "1111000" when "0111",  -- '7'
--               "0000000" when "1000",  -- '8'
--               "0010000" when "1001",  -- '9'
--               "0001000" when "1010",  -- 'A'
--               "0000011" when "1011",  -- 'b'
--               "1000110" when "1100",  -- 'C'
--               "0100001" when "1101",  -- 'd'
--               "0000110" when "1110",  -- 'E'
--               "0001110" when "1111",  -- 'F' 
--               "1111111" when others;  -- apaga  
----
end Behavioral;
