library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FlipFlopJK_PreClr is
port (  J,K :in  std_logic;      -- J and K inputs
        clk :in std_logic;      -- Clock input
        clk_en :in std_logic;    -- Clock enable input
        clr :in std_logic;  -- Asynchronous clear input
        pre : in std_logic;   -- Asynchronous set input
        Q : out std_logic;      -- Data output
        Qnot : out std_logic      -- Data output       
);
end FlipFlopJK_PreClr;

architecture Behavioral of FlipFlopJK_PreClr is

signal SQ,SQnot : std_logic :='0';

begin
Q <= SQ;
Qnot <= SQnot;


process(clr,pre,clk) --process with sensitivity list.
begin  --"begin" statment for the process. 

    if (clr = '1') then  --Asynchronous clear input
           SQ <= '0';
           SQnot <= '1';
    else 
           if(pre = '1') then  --Asynchronous set input
               SQ <= '1';
               SQnot <= '0';
           else
            if ( clk_en = '1' and  rising_edge(clk) ) then
                   if (J='0' and K='0') then       --No change in the output
                    NULL;
                   elsif(J='0' and K='1') then    --Set the output.
                    SQ <= '0';
                    SQnot <= '1';
                   elsif(J='1' and K='0') then    --Reset the output.
                    SQ <= '1';
                    SQnot <= '0';
                   else                           --Toggle the output.
                    SQ <= not SQ;
                    SQnot <= not SQnot;
                  end if;
            end if;
          end if;
   end if;

end process;  --end of process statement.
end Behavioral;
