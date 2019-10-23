library IEEE;
use IEEE.std_logic_1164.all;

entity NBitMux is
	generic(N : integer := 32);
	port( ina : in std_logic_vector(N-1 downto 0);
	      inb : in std_logic_vector(N-1 downto 0);
	      sel : in std_logic;
	      outp : out std_logic_vector(N-1 downto 0));

end NBitMux;

architecture structure of NBitMux is
component Mux
	port(inputa : in std_logic;
	     inputb : in std_logic;
	     selector : in std_logic;
	     output : out std_logic);
end component;
begin
G1: for i in 0 to N-1 generate
	Mux_1 : MUX
		port map(inputa => ina(i),
			 inputb => inb(i),
			 selector => sel,
			 output => outp(i)); 
end generate;
end structure;
