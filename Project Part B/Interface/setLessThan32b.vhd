---- Set less than 32b ---
library IEEE;
use IEEE.std_logic_1164.all;

entity setLessThan32b is
	port(inputA,inputB : in std_logic_vector(31 downto 0);
	     output : out std_logic);
end setLessThan32b;

architecture processor of setLessThan32b is
begin
	process(inputA,inputB)
		begin
		if(inputA>inputB) then
			output<='0';
		else
			output<='1';
		end if;
	end process;
end processor;