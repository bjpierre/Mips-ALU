library IEEE;
use IEEE.std_logic_1164.all;

entity FullAddSub is
	generic(N : integer := 32);
	port( ina : in std_logic_vector(N-1 downto 0);
	      inb : in std_logic_vector(N-1 downto 0);
	      nAdd_Sub : in std_logic;
	      outp : out std_logic_vector(N-1 downto 0);
	      carry_out : out std_logic);

end FullAddSub;

architecture structure of FullAddSub is
signal invsig,muxsig : std_logic_vector(N-1 downto 0);
component NBitMux
	port( ina : in std_logic_vector(N-1 downto 0);
	      inb : in std_logic_vector(N-1 downto 0);
	      sel : in std_logic;
	      outp : out std_logic_vector(N-1 downto 0));
end component;
component FullAdderNBit is
	port( inputa : in std_logic_vector(N-1 downto 0);
	      inputb : in std_logic_vector(N-1 downto 0);
	      carry : in std_logic;
	      sum : out std_logic_vector(N-1 downto 0);
	      carry_out : out std_logic);
end component;
component ones_com_struct is
    port(input  : in std_logic_vector(N-1 downto 0);
    	 o_a : out std_logic_vector(N-1 downto 0));
end component;
begin

	inv : ones_com_struct
		port map(input => inb,
			 o_a => invsig);
	mux : NBitMux
		port map(ina => inb,
			 inb => invsig,
			 sel => nAdd_Sub,
			 outp => muxsig);
	adder : FullAdderNBit
		port map(inputa => ina,
			 inputb => muxsig,
			 carry => nAdd_Sub,
			 sum => outp,
			 carry_out => carry_out);
			 

end structure;