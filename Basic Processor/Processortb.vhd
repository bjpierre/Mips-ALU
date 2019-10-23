---Processor tb---

library IEEE;
use IEEE.std_logic_1164.all;

entity Processortb is
end Processortb;

architecture behave of Processortb is
	signal imin : std_logic_vector(31 downto 0);
	signal nAdd_Sub,alusrc, reset, wen, clk : std_logic;
	signal readAdda, readAddB, writeAdd : std_logic_vector(4 downto 0);
begin
HA1 : entity work.MipsProcessor port map (imin, nAdd_Sub, alusrc, reset, clk,wen, readAdda, readAddb, writeAdd);
end behave;
