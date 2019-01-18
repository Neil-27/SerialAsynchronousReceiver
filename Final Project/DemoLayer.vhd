library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DemoLayer is
	port (
		clk, send: in std_logic;
		packet: in std_logic_vector(10 downto 0);
		bitOut: out std_logic := '1'
	);
end entity;

architecture DemoLayer_stru of DemoLayer is
	signal sending: std_logic;

begin
	process(clk)
		variable t: Integer := 0;
		variable i: Integer := 10;
		variable pressed: Integer := 0;
	begin
		if rising_edge(clk) then
			if send = '1' and pressed = 0 then
				sending <= '1';
				pressed := 1;
			end if;
			if sending = '1' then
				bitOut <= packet(i);
				t := t + 1;
				if t = 4 then
					i := i - 1;
					if i = -1 then
						sending <= '0';
					end if;
					t := 0;
				end if;
			else
				bitOut <= '1';
				t := 0;
				i := 10;
			end if;
			if send = '0' then
				pressed := 0;
			end if;
		end if;
	end process;
end DemoLayer_stru;
			