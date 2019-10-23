library IEEE;
use IEEE.std_logic_1164.all;

entity FullAdder is
	port( inputa : in std_logic;
	      inputb : in std_logic;
	      carry : in std_logic;
	      sum : out std_logic;
	      carry_out : out std_logic);

end FullAdder;

architecture structure of FullAdder is
signal xors1,ands1,ands2 : std_logic;
component andg2
	port(i_A : in std_logic;
	     i_B : in std_logic;
	     o_F : out std_logic);
end component;
component org2
	port(i_A : in std_logic;
	     i_B : in std_logic;
	     o_F : out std_logic);
end component;
component xorg2
	port(i_A : in std_logic;
	     i_B : in std_logic;
	     o_F : out std_logic);
end component;
	
begin
	 xora : xorg2 
		port MAP(i_A => inputa,
			 i_B => inputb,
			 o_F => xors1);
	 xorb : xorg2
		port MAP(i_A => xors1,
			 i_B => carry,
			 o_F => sum);
	 anda : andg2 
		port MAP(i_A => carry,
			 i_B => xors1,
			 o_F => ands1);
	 andb : andg2
		port MAP(i_A => inputb,
			 i_B => inputa,
			 o_F => ands2);
	 ora : org2 
		port MAP(i_A => ands1,
			 i_B => ands2,
			 o_F => carry_out);
end structure;
