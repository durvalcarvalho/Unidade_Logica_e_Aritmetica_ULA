
--library declaration for the module.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--This is a D Flip-Flop with Asynchronous Clear,Set and Clock Enable(negedge clock).
--Note that the clear input has the highest priority,preset being the next highest
--priority and clock enable having the lowest priority
entity FlipFlopD is 
   port(
      D :in  std_logic;      -- Data input
      clk :in std_logic;      -- Clock input
      clk_en :in std_logic;    -- Clock enable input
      clr :in std_logic;  -- Asynchronous clear input
      pre : in std_logic;   -- Asynchronous set input
      Q : out std_logic:='1';      -- Data output
      Qnot : out std_logic:='0'      -- Data output
   );
end FlipFlopD;

architecture Behavioral of FlipFlopD is  --architecture of the circuit.

begin  --"begin" statement for architecture.

process(clr,pre,clk) --process with sensitivity list.
begin  --"begin" statment for the process. 

    if (clr = '1') then  --Asynchronous clear input
           Q <= '0';
           Qnot <= '1';
    else 
           if(pre = '1') then  --Asynchronous set input
               Q <= '1';
               Qnot <= '0';
           else 
               if ( clk_en = '1' and  rising_edge(clk) ) then 
                  Q <= D;
                  Qnot <= not D;
              end if;
          end if;
   end if;

end process;  --end of process statement.

end Behavioral; 