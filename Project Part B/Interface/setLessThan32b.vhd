---- Set less than 32b ---
library IEEE;
use IEEE.std_logic_1164.all;

entity setLessThan32b is
	port(inputA,inputB : in std_logic_vector(31 downto 0);
	     sel : in std_logic;
	     output : out std_logic);
end setLessThan32b;

architecture processor of setLessThan32b is
begin
	process(inputA,inputB)
		begin
		if(inputA>inputB and inputA(31) = '1' and sel ='1') then
			output <= '1';
		elsif(inputA<inputB and inputB(31) = '1' and sel ='1') then
			output <= '0';
		elsif(inputA<inputB and inputB(31) = '0' and sel ='1') then
			output <= '1';
		elsif(inputA>inputB and inputA(31) = '0' and sel ='1') then
			output <= '0';
		else
			output <= '0';
		end if;
	end process;
end processor;