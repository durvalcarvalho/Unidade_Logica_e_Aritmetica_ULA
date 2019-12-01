library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity master is
    port(
          J,K :in  std_logic;      -- J,K inputs (sw(0),sw(1))
          clk :in std_logic;      -- Clock input
          clk_en :in std_logic;    -- Clock enable input (sw(2))
          clr :in std_logic;  -- Asynchronous clear input (pushbottom U17)
          pre : in std_logic;   -- Asynchronous set input (pushbottom T18)
          Q : out std_logic;      -- Data output (led(0))
          Qnot : out std_logic      -- Data output (led(1))
       );
end master;

architecture Behavioral of master is
    --
    --COMPONENTS
    --
    component divisor_clock
        Generic (divisor:integer:=100_000);
        Port ( clk_master : in STD_LOGIC;
               clk_dividido : out STD_LOGIC);
    end component;
    component FlipFlopJK_PreClr 
       port(
          J,K :in  std_logic;      -- Data input
          clk :in std_logic;      -- Clock input
          clk_en :in std_logic;    -- Clock enable input
          clr :in std_logic;  -- Asynchronous clear input
          pre : in std_logic;   -- Asynchronous set input
          Q : out std_logic;      -- Data output
          Qnot : out std_logic      -- Data output
       );
    end component;
    --
    -- CONSTANTS
    --
    constant divisor: integer:=100_000_000;
    --
    -- CONSTANTS
    --
    signal clk_dividido: std_logic:='0';
begin

div_clk: divisor_clock generic map (divisor) port map(clk_master => clk, clk_dividido => clk_dividido);
usa_ffJK: FlipFlopJK_PreClr port map(  J => J,
                                       K => K,
                                       clk => clk_dividido,
                                       clk_en => clk_en,
                                       clr => clr,
                                       pre => pre,
                                       Q => Q,
                                       Qnot => Qnot
                                    );
end Behavioral;
