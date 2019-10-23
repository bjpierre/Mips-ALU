---The file to end all files
library IEEE;
use IEEE.std_logic_1164.all;
entity processor is
	port(regAddressA,regAddressB,regWriteAddress : in std_logic_vector(4 downto 0);
	     imediate : in std_logic_vector(15 downto 0);
	     reset, extendCtrl, storeCtrl,loadCtrl,aluCtrl, aluSub, clk : in std_logic;
	     testOut : out std_logic_vector(31 downto 0));
end processor;

architecture structural of processor is

signal regOutA, regOutB, aluOut, memOut, extendOut, muxOut : std_logic_vector(31 downto 0);
signal carryout,storeCtrlInv : std_logic;

component NBitMux
	port( ina : in std_logic_vector(35-4 downto 0);
	      inb : in std_logic_vector(36-5 downto 0);
	      sel : in std_logic;
	      outp : out std_logic_vector(30+1 downto 0));
end component;

component extender632 
	port(inp : in std_logic_vector(15 downto 0);
	     ctrl : in std_logic;
	     outp : out std_logic_vector(31 downto 0));
end component;

component addsubwalusrc
	port( rega,regb,imin : in std_logic_vector(31 downto 0);
	      nAdd_Sub,alusrc : in std_logic;
	      outp : out std_logic_vector(31 downto 0);
	      carry_out : out std_logic);

end component;

component MipsReg
	port(clk,reset,wen : in std_logic;
		 wd : in std_logic_vector(31 Downto 0);
		 rt : out std_logic_vector(31 downto 0);
		 rs : out std_logic_vector(31 downto 0);
		 wloc, rloca, rlocb : in std_logic_vector(4 downto 0));
end component;

component mem
	port 
	(
		clk		: in std_logic;
		addr	        : in std_logic_vector(9 downto 0);
		data	        : in std_logic_vector(31 downto 0);
		we		: in std_logic := '1';
		q		: out std_logic_vector(31 downto 0)
	);
end component;

begin
	storeCtrlInv <= not(storeCtrl);

	Reg32 : MipsReg
		port MAP(clk => clk,
			 reset => reset,
			 wen =>  storeCtrlInv,
			 wd => muxOut,
			 rt => regOutA,
		         rs => regOutB,
			 wloc => regWriteAddress,
			 rloca => regAddressA,
			 rlocb => regAddressB);

	exten : extender632
		port MAP(inp => imediate,
			 ctrl => extendCtrl,
			 outp => extendOut);
	
	ALU : addsubwalusrc
		port MAP(rega => regOutA,
			 regb => regOutB,
			 imin => extendOut,
			 nAdd_Sub => aluSub,
			 alusrc => aluCtrl,
			 outp => aluOut,
			 carry_out => carryout);
	memory : mem
		port MAP(clk => clk,
		  	 addr => aluOut(9 downto 0),
			 data => regOutB,
			 we => storeCtrl,
			 q => memOut);
	
	mux : NBitMux
		port MAP(ina => aluOut,
			 inb => memOut,
			 sel => loadCtrl,
			 outp => muxOut);

	testOut <= muxOut;
end structural;