library IEEE;
use IEEE.std_logic_1164.all;

entity FullAdderNBit is
	generic(N : integer := 32);
	port( inputa : in std_logic_vector(N-1 downto 0);
	      inputb : in std_logic_vector(N-1 downto 0);
	      carry : in std_logic;
	      sum : out std_logic_vector(N-1 downto 0);
	      carry_out : out std_logic);

end FullAdderNBit;

architecture structure of FullAdderNBit is

signal carrysig : std_logic_vector(N-1 downto 0);

component FullAdder
	port( inputa : in std_logic;
	      inputb : in std_logic;
	      carry : in std_logic;
	      sum : out std_logic;
	      carry_out : out std_logic);
end component;

begin

adder3 : FullAdder
		port map(inputa => inputa(0),
			 inputb => inputb(0),
			 carry => carry,
			 sum => sum(0),
			 carry_out => carrysig(0)); 

G1: for i in 1 to N-2 generate
	adder1 : FullAdder
		port map(inputa => inputa(i),
			 inputb => inputb(i),
			 carry => carrysig(i-1),
			 sum => sum(i),
			 carry_out => carrysig(i)); 
end generate;
adder2 : FullAdder
		port map(inputa => inputa(N-1),
			 inputb => inputb(N-1),
			 carry => carrysig(N-2),
			 sum => sum(N-1),
			 carry_out => carry_out); 
end structure;