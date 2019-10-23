library IEEE;
use IEEE.std_logic_1164.all;

entity ones_com_struct is
    generic(N : integer := 32);
    port(input  : in std_logic_vector(N-1 downto 0);
    	 o_a : out std_logic_vector(N-1 downto 0));

end ones_com_struct;

architecture dataflow of ones_com_struct is
begin

G1: for i in 0 to N-1 generate
	o_a(i) <= not input(i);
end generate;
end dataflow;