--processor tb---
library IEEE;
use IEEE.std_logic_1164.all;
entity processortb is
	generic
	(
		CLK_HELPER : time :=50 ns
	);
end processortb;

architecture structure of processortb is
	constant cCLK  : time := CLK_HELPER * 2;
	signal regAddressA,regAddressB,regWriteAddress : std_logic_vector(4 downto 0);
	signal imediate : std_logic_vector(15 downto 0);
	signal testOut : std_logic_vector(31 downto 0);
	signal reset, extendCtrl, storeCtrl,loadCtrl,aluSrc, aluSub, clk : std_logic;
begin
	test : entity work.processor port map (regAddressA,regAddressB,regWriteAddress,imediate,reset, extendCtrl, storeCtrl,loadCtrl,aluSrc, aluSub, clk ,testOut);
	CLKHELP: process
 		begin
		clk<='0';
		wait for CLK_HELPER;
		clk<='1';
		wait for CLK_HELPER;
	end process;

testing : process
begin
	extendCtrl <= '0';
	storeCtrl <= '0';
	loadCtrl <= '0';
	aluSrc <='0';
	aluSub <='0';
	reset <= '1';
	regWriteAddress <= "00000";
	imediate <= "0000000000000000";
	regAddressA <= "00000";
	regAddressB <= "00000";
	wait for cCLK;

	--addi 25 0 0 --
	reset <='0';
	aluSrc <= '1';
	imediate <= "0000000000000000";
	regWriteAddress <= "11001";
	regAddressA <= "00000";
	wait for cCLK;
	
	--addi 26 0 256 --
	imediate <= "0000000100000000";
	regWriteAddress <= "11010";
	wait for cCLK;
	
	--lw 1 0 25--
	loadCtrl <= '1';
	regWriteAddress <= "00001";
	imediate <= "0000000000000000";
	regAddressA <= "11001";
	wait for cCLK;

	--lw 2 4 25--
	extendCtrl<='1';
	regWriteAddress <= "00010";
	imediate <= "0000000000000001";
	wait for cCLK;

	--add 1 1 2 --
	extendCtrl<='0';
	loadCtrl <= '0';
	aluSrc <='0';
	regWriteAddress <= "00001";
	regAddressA <= "00001";
	regAddressB <= "00010";
	wait for cCLK;

	--sw 1 0 26 --
	storeCtrl <= '1';
	regAddressB <= "00001";
	regAddressA <= "11010";
	aluSrc <= '1';
	imediate <= "0000000000000000";
	wait for cCLK;

	--lw 2 8 25 --
	extendCtrl<='1';
	storeCtrl <= '0';
	loadCtrl <= '1';
	regWriteAddress <= "00010";
	regAddressA <= "11001";
	imediate <= "0000000000000010";
	wait for cCLK;

	--add 1 1 2--
	extendCtrl<='0';
	loadCtrl <= '0';
	aluSrc <='0';
	regWriteAddress <= "00001";
	regAddressA <= "00001";
	regAddressB <= "00010";
	wait for cCLK;

	--sw 1 4 26 --
	storeCtrl <= '1';
	aluSrc <= '1';
	regAddressA <= "11010";
	regAddressA <= "11010";
	imediate <= "0000000000000001";
	wait for cCLK;
	
	--lw 2 12 25 --
	extendCtrl<='1';
	storeCtrl <= '0';
	loadCtrl <= '1';
	regWriteAddress <= "00010";
	regAddressA <= "11001";
	imediate <= "0000000000000011";
	wait for cCLK;
	
	--add 1 1 2--
	extendCtrl<='0';
	loadCtrl <= '0';
	aluSrc <='0';
	regWriteAddress <= "00001";
	regAddressA <= "00001";
	regAddressB <= "00010";
	wait for cCLK;
	
	--sw 1 8 26 --
	storeCtrl <= '1';
	regAddressB <= "00001";
	regAddressA <= "11010";
	aluSrc <= '1';
	imediate <= "0000000000000010";
	wait for cCLK;
	
	--lw 2 16 25 --
	extendCtrl<='1';
	storeCtrl <= '0';
	loadCtrl <= '1';
	regWriteAddress <= "00010";
	regAddressA <= "11001";
	imediate <= "0000000000000100";
	wait for cCLK;
	
	--add 1 1 2--
	extendCtrl<='0';
	loadCtrl <= '0';
	aluSrc <='0';
	regWriteAddress <= "00001";
	regAddressA <= "00001";
	regAddressB <= "00010";
	wait for cCLK;
	
	--sw 1 12 26 --
	storeCtrl <= '1';
	regAddressB <= "00001";
	regAddressA <= "11010";
	aluSrc <= '1';
	imediate <= "0000000000000011";
	wait for cCLK;

	--lw 2 20 25 --
	extendCtrl<='1';
	storeCtrl <= '0';
	loadCtrl <= '1';
	regWriteAddress <= "00010";
	regAddressA <= "11001";
	imediate <= "0000000000000101";
	wait for cCLK;
	
	--add 1 1 2--
	extendCtrl<='0';
	loadCtrl <= '0';
	aluSrc <='0';
	regWriteAddress <= "00001";
	regAddressA <= "00001";
	regAddressB <= "00010";
	wait for cCLK;
	
	--sw 1 16 26 --
	storeCtrl <= '1';
	regAddressB <= "00001";
	regAddressA <= "11010";
	aluSrc <= '1';
	imediate <= "0000000000000100";
	wait for cCLK;
	
	--lw 2 24 25 --
	extendCtrl<='1';
	storeCtrl <= '0';
	loadCtrl <= '1';
	regWriteAddress <= "00010";
	regAddressA <= "11001";
	imediate <= "0000000000000110";
	wait for cCLK;
	
	--add 1 1 2--
	extendCtrl<='0';
	loadCtrl <= '0';
	aluSrc <='0';
	regWriteAddress <= "00001";
	regAddressA <= "00001";
	regAddressB <= "00010";
	wait for cCLK;

	--addi 27 0 512 --
	aluSrc<='1';
	regWriteAddress <= "11011";
	regAddressA <= "00000";
	imediate <= "0000000010000000";
	wait for cCLK;
	
	--sw 1 -4 27 --
	storeCtrl <= '1';
	regAddressB <= "00001";
	regAddressA <= "11010";
	aluSub <= '1';
	imediate <= "0000000000000001";
	wait for cCLK;
	
	--kinda chill cause its over--
	regAddressB <= "11111";
	regAddressA <= "11111";
	aluSrc <='0';
	wait for cCLK;wait for cCLK;wait for cCLK;wait for cCLK;wait for cCLK;wait for cCLK;
	wait for cCLK;wait for cCLK;wait for cCLK;wait for cCLK;wait for cCLK;wait for cCLK;
	wait for cCLK;wait for cCLK;wait for cCLK;wait for cCLK;wait for cCLK;wait for cCLK;
	
	
end process;
end structure;