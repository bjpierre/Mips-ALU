-------------------------------------------------------------------------
-- Ben Pierre
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity Einstein is

  port(iCLK             : in std_logic;
       iM 		            : in integer;
       oE 		            : out integer);

end Einstein;

architecture structure of Einstein is
  component Multiplier
    port(iCLK           : in std_logic;
         iA             : in integer;
         iB             : in integer;
         oC             : out integer);
  end component;

  constant c : integer := 9487;
  signal sVALUE_Squared : integer;
  begin

  g_Mult1: Multiplier
    port MAP(iCLK             => iCLK,
             iA               => c,
             iB               => c,
             oC               => sVALUE_Squared);

  g_Mult2: Multiplier
    port MAP(iCLK             => iCLK,
             iA               => sVALUE_Squared,
             iB               => iM,
             oC               => oE);
end structure;