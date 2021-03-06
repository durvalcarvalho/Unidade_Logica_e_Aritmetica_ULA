
--libraries to be used are specified here
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;


architecture behavior of testbench is
    --Signal declarations
    signal S_J,S_K,S_clk,S_clk_en,S_clr,S_pre,S_Q,S_Qnot : std_logic := '0';

    -- Clock period definitions
    constant clk_period : time := 1 ns;

    ---Component Declarations
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


begin
-- Instantiate the Unit Under Test (UUT)
UUT : entity FlipFlopJK_PreClr port map(  J => S_J,
                                          K => S_K,
                                          clk => S_clk,
                                          clk_en => S_clk_en,
                                          clr => S_clr,
                                          pre => S_pre,
                                          Q => S_Q,
                                          Qnot => S_Qnot
                                        );
-- Clock process definitions
clk_process :process
begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
end process;
-- Stimulus process
stim_proc: process
begin
    wait for 100 ns;
    -
    - Testing Normal behavior
    -
    pre <= '0';
    clr <= '0';
    clk_en <= '1'; 
    J<='0';
    K<='0';
    wait for clk_period*2;
    
    pre <= '0';
    clr <= '0';
    clk_en <= '1'; 
    J<='1';
    K<='0';
    wait for clk_period*2;
    
    pre <= '0';
    clr <= '0';
    clk_en <= '1'; 
    J<='0';
    K<='1';
    wait for clk_period*2;
    
    pre <= '0';
    clr <= '0';
    clk_en <= '1'; 
    J<='1';
    K<='1';
    wait for clk_period*2;
        
    -
    - Testing Clock Enable
    -
    pre <= '0';
    clr <= '0';
    clk_en <= '0'; 
    J<='0';
    K<='0';
    wait for clk_period*2;
    
    pre <= '0';
    clr <= '0';
    clk_en <= '0'; 
    J<='1';
    K<='0';
    wait for clk_period*2;
    
    pre <= '0';
    clr <= '0';
    clk_en <= '0'; 
    J<='0';
    K<='1';
    wait for clk_period*2;
    
    pre <= '0';
    clr <= '0';
    clk_en <= '0'; 
    J<='1';
    K<='1';
    wait for clk_period*2;
    
    -
    - Testing Preset
    -
    pre <= '1';
    clr <= '0';
    clk_en <= '1'; 
    J<='0';
    K<='0';
    wait for clk_period*2;
    
    pre <= '1';
    clr <= '0';
    clk_en <= '1'; 
    J<='1';
    K<='0';
    wait for clk_period*2;
    
    pre <= '1';
    clr <= '0';
    clk_en <= '1'; 
    J<='0';
    K<='1';
    wait for clk_period*2;
    
    pre <= '1';
    clr <= '0';
    clk_en <= '1'; 
    J<='1';
    K<='1';
    wait for clk_period*2;
    
    -
    - Testing Clear
    -
    pre <= '0';
    clr <= '1';
    clk_en <= '1'; 
    J<='0';
    K<='0';
    wait for clk_period*2;
    
    pre <= '0';
    clr <= '1';
    clk_en <= '1'; 
    J<='1';
    K<='0';
    wait for clk_period*2;
    
    pre <= '0';
    clr <= '1';
    clk_en <= '1'; 
    J<='0';
    K<='1';
    wait for clk_period*2;
    
    pre <= '0';
    clr <= '1';
    clk_en <= '1'; 
    J<='1';
    K<='1';
    wait for clk_period*2;

end process;

end;
