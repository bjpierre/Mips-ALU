library IEEE;
use IEEE.std_logic_1164.all;

entity ones_com is
    generic(N : integer := 32);
    port(input  : in std_logic_vector(N-1 downto 0);
    	 o_F : out std_logic_vector(N-1 downto 0));

end ones_com;

architecture structure of ones_com is

component invg
  port(i_A : in std_logic;
       o_F : out std_logic);
end component;
  

begin

G1: for i in 0 to N-1 generate
	inv_i : invg
		port map(i_A => input(i),
			 o_F => o_F(i));
end generate;

end structure;
