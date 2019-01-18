library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DivBy11 is
port
(
	clk: in std_logic;
	clr: in std_logic;
	rxf: out std_logic
);
end DivBy11;

architecture divarch of DivBy11 is
	signal counter: unsigned(3 downto 0) := "0000";
begin
	process(clk, clr)
	begin
		if(clr = '0') then
			counter <= "0000";
			rxf <= '0';
		elsif(clk'event and clk ='1') then
			 if(counter = "1010") then
			  rxf <= '1';
				counter <= "0000";
			else
			  rxf <= '0';
				counter <= counter + 1;
			end if;
		end if;
  end process;
end divarch;


	