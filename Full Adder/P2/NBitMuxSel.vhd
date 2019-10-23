library IEEE;
use IEEE.std_logic_1164.all;

entity NBitMuxSel is
	generic(N : integer := 32);
	port( ina : in std_logic_vector(N-1 downto 0);
	      inb : in std_logic_vector(N-1 downto 0);
	      sel : in std_logic;
	      outp : out std_logic_vector(N-1 downto 0));

end NBitMuxSel;

architecture dataflow of NBitMuxSel is

begin
G1: for i in 0 to N-1 generate
	outp(i) <= (ina(i) and (not sel)) or (inb(i) and sel);
	
end generate;
end dataflow;