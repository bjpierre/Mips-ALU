----32x32bit Mux----
library IEEE;
use IEEE.std_logic_1164.all;

entity mux3232 is
	port(clk : in std_logic;
	bitout : out std_logic_vector(31 downto 0);
	     selbit : in std_logic_vector(4 downto 0);
	     in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31: in std_logic_vector(31 downto 0));
end mux3232;


architecture Behavioral of mux3232 is
begin 
process(selbit,clk)
	begin
	case selbit is
			when "00000" => bitout <= in0;
			when "00001" => bitout <= in1;
			when "00010" => bitout <= in2;
			when "00011" => bitout <= in3;
			when "00100" => bitout <= in4;
			when "00101" => bitout <= in5;
			when "00110" => bitout <= in6;
			when "00111" => bitout <= in7;
			when "01000" => bitout <= in8;
			when "01001" => bitout <= in9;
			when "01010" => bitout <= in10;
			when "01011" => bitout <= in11;
			when "01100" => bitout <= in12;
			when "01101" => bitout <= in13;
			when "01110" => bitout <= in14;
			when "01111" => bitout <= in15;
			when "10000" => bitout <= in16;
			when "10001" => bitout <= in17;
			when "10010" => bitout <= in18;
			when "10011" => bitout <= in19;
			when "10100" => bitout <= in20;
			when "10101" => bitout <= in21;
			when "10110" => bitout <= in22;
			when "10111" => bitout <= in23;
			when "11000" => bitout <= in24;
			when "11001" => bitout <= in25;
			when "11010" => bitout <= in26;
			when "11011" => bitout <= in27;
			when "11100" => bitout <= in28;
			when "11101" => bitout <= in29;
			when "11110" => bitout <= in30;
			when "11111" => bitout <= in31;
			when others => bitout <= "00000000000000000000000000000000";
			end case;

end process;
end Behavioral;