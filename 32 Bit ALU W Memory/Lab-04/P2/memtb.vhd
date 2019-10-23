---- test bench for provided mem file---
library IEEE;
use IEEE.std_logic_1164.all;
entity memtb is 
	generic 
	(
		DATA_WIDTH : natural := 32;
		ADDR_WIDTH : natural := 10;
		CLK_HELPER : time :=50 ns
	);

end memtb;

architecture struct of memtb is
constant cCLK  : time := CLK_HELPER * 2;
type t_Memory is array (9 downto 0) of std_logic_vector((DATA_WIDTH-1) downto 0);
signal transferData : t_Memory;
signal clk :  std_logic;
signal addr :  std_logic_vector((ADDR_WIDTH-1) downto 0);
signal data :  std_logic_vector((DATA_WIDTH-1) downto 0);
signal q : std_logic_vector((DATA_WIDTH-1) downto 0);
signal we : std_logic;
begin
dmem : entity work.mem port map (clk,addr, data, we, q);

CLKHELP: process
 begin
	clk<='0';
	wait for CLK_HELPER;
	clk<='1';
	wait for CLK_HELPER;
	end process;

TB : process
begin
	we<='0';
	addr <="0000000000";
	wait for cCLK;

	addr <="0000000001";
	transferData(0) <= q;
	wait for cCLK;

	addr <="0000000010";
	transferData(1) <= q;
	wait for cCLK;

	addr <="0000000011";
	transferData(2) <= q;
	wait for cCLK;

	addr <="0000000100";
	transferData(3) <= q;
	wait for cCLK;

	addr <="0000000101";
	transferData(4) <= q;
	wait for cCLK;

	addr <="0000000110";
	transferData(5) <= q;
	wait for cCLK;

	addr <="0000000111";
	transferData(6) <= q;
	wait for cCLK;

	addr <="0000001000";
	transferData(7) <= q;
	wait for cCLK;

	addr <="0000001001";
	transferData(8) <= q;
	wait for cCLK;

	addr <="0000001010";
	transferData(9) <= q;
	wait for cCLK;

	--Rewrite Values--

	we<='1';
	data<= transferData(0);
	addr <= "0100000000";
	wait for cCLK;

	data<= transferData(1);
	addr <= "0100000001";
	wait for cCLK;
	
	data<= transferData(2);
	addr <= "0100000010";
	wait for cCLK;

	data<= transferData(3);
	addr <= "0100000011";
	wait for cCLK;

	data<= transferData(4);
	addr <= "0100000100";
	wait for cCLK;

	data<= transferData(5);
	addr <= "0100000101";
	wait for cCLK;

	data<= transferData(6);
	addr <= "0100000110";
	wait for cCLK;

	data<= transferData(7);
	addr <= "0100000111";
	wait for cCLK;

	data<= transferData(8);
	addr <= "0100001000";
	wait for cCLK;

	data<= transferData(9);
	addr <= "0100001001";
	wait for cCLK;

	--reread values--
	we<='0';
	addr <= "0100000000";
	wait for cCLK;

	addr <= "0100000001";
	wait for cCLK;

	addr <= "0100000010";
	wait for cCLK;

	addr <= "0100000011";
	wait for cCLK;

	addr <= "0100000100";
	wait for cCLK;

	addr <= "0100000101";
	wait for cCLK;

	addr <= "0100000110";
	wait for cCLK;

	addr <= "0100000111";
	wait for cCLK;

	addr <= "0100001000";
	wait for cCLK;

	addr <= "0100001001";
	wait for cCLK;


	end process;


end struct;
