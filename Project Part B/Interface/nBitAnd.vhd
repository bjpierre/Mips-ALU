-------------------------------------------------------------------------
-- Thomas Beckler
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- nBitAnd.vhd


library IEEE;
use IEEE.std_logic_1164.all;
entity nBitAnd is
generic(N : integer := 32);
	port(i_A : in std_logic_vector(N-1 downto 0);
	     i_B : in std_logic_vector(N-1 downto 0);
	     o_F : out std_logic_vector(N-1 downto 0));
end nBitAnd;
architecture structure of nBitAnd is
--components
component andg2
	port(i_A          : in std_logic;
       i_B          : in std_logic;
       o_F          : out std_logic);

end component;
begin
G1: for i in 0 to N-1 generate
  andg2_i: andg2 
    port map(i_A  => i_A(i),
		i_B => i_B(i),
  	          o_F  => o_F(i));
end generate;
end structure;