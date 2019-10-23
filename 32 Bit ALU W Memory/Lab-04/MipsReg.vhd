----32x32bit register----
library IEEE;
use IEEE.std_logic_1164.all;

entity MipsReg is
	port(clk,reset,wen : in std_logic;
		 wd : in std_logic_vector(31 Downto 0);
		 rt : out std_logic_vector(31 downto 0);
		 rs : out std_logic_vector(31 downto 0);
		 wloc, rloca, rlocb : in std_logic_vector(4 downto 0));
end MipsReg;


architecture structure of MipsReg is
	component bitdecoder is
	port(bitin : in std_logic_vector(4 downto 0);
	     bitout : out std_logic_vector(31 downto 0);
	     wen : in std_logic);
	end component;
	
	component Nbitreg is
	port(clk,reset, Wen : in std_logic;
	     inval : in std_logic_vector(31 downto 0);
	     outval : out std_logic_vector(31 downto 0));
	end component;

	component mux3232 is
	port(clk : in std_logic;
	     bitout : out std_logic_vector(31 downto 0);
	     selbit : in std_logic_vector(4 downto 0);
	     in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31: in std_logic_vector(31 downto 0));
	end component;

	type regouttype is array (31 downto 0) of std_logic_vector(31 downto 0);
	signal regout : regouttype;	

	signal decoderSig : std_logic_vector(31 downto 0);
	
	
begin
	decoder : bitdecoder
	   port MAP(bitin => wloc,
	     	    bitout => decoderSig,
	            wen => wen);
	G1: for i in 0 to 31 generate

		reg:Nbitreg
			port MAP(clk => clk,
			reset => reset,
			Wen => decodersig(i),
	        	inval => wd,
	       	 	outval => regout(i));
	end generate;

	muxa : mux3232
		port MAP(clk => clk,
			bitout => rt,
	        	selbit => rloca,
	        	in0 => regout(0),
			in1 => regout(1),
			in2 => regout(2),
			in3 => regout(3),
			in4 => regout(4),
			in5 => regout(5),
			in6 => regout(6),
			in7 => regout(7),
			in8 => regout(8),
			in9 => regout(9),
			in10 => regout(10),
			in11 => regout(11),
			in12 => regout(12),
			in13 => regout(13),
			in14 => regout(14),
			in15 => regout(15),
			in16 => regout(16),
			in17 => regout(17),
			in18 => regout(18),
			in19 => regout(19),
			in20 => regout(20),
			in21 => regout(21),
			in22 => regout(22),
			in23 => regout(23),
			in24 => regout(24),
			in25 => regout(25),
			in26 => regout(26),
			in27 => regout(27),
			in28 => regout(28),
			in29 => regout(29),
			in30 => regout(30),
			in31 => regout(31));
		
		muxb : mux3232
			port MAP( clk => clk,
				bitout => rs,
	        		selbit => rlocb,
	        		in0 => regout(0),
				in1 => regout(1),
				in2 => regout(2),
				in3 => regout(3),
				in4 => regout(4),
				in5 => regout(5),
				in6 => regout(6),
				in7 => regout(7),
				in8 => regout(8),
				in9 => regout(9),
				in10 => regout(10),
				in11 => regout(11),
				in12 => regout(12),
				in13 => regout(13),
				in14 => regout(14),
				in15 => regout(15),
				in16 => regout(16),
				in17 => regout(17),
				in18 => regout(18),
				in19 => regout(19),
				in20 => regout(20),
				in21 => regout(21),
				in22 => regout(22),
				in23 => regout(23),
				in24 => regout(24),
				in25 => regout(25),
				in26 => regout(26),
				in27 => regout(27),
				in28 => regout(28),
				in29 => regout(29),
				in30 => regout(30),
				in31 => regout(31));

end structure;