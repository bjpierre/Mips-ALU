----32 bit register----
library IEEE;
use IEEE.std_logic_1164.all;

entity Nbitreg is
	generic(N : integer := 32);
	port(clk,reset, Wen : in std_logic;
	     inval : in std_logic_vector(N-1 downto 0);
	     outval : out std_logic_vector(N-1 downto 0));
end Nbitreg;

architecture structure of Nbitreg is

	component DFF
	port(i_CLK        : in std_logic;
       	     i_RST        : in std_logic;
       	     i_WE         : in std_logic;
       	     i_D          : in std_logic; 
       	     o_Q          : out std_logic);
	end component;

begin
G1: for i in 0 to N-1 generate

FlipFlop: DFF
    port MAP(i_CLK             => clk,
             i_RST            => reset,
             i_WE             => Wen,
             i_D              => inval(i),
	     o_Q	      => outval(i));

end generate;
end structure;