library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DerivedClock is
	port (
		clk_in, rst_in : in std_logic;
		clk_out, rst_out : out std_logic
		);
end DerivedClock;

architecture DerivedClock_stru of DerivedClock is
	signal cnt: Integer := 1;
	signal state : std_logic;
	
	begin
	process(clk_in, rst_in)
	begin
		if rst_in ='0' then
			cnt <= 1;
			state <= '0';
		elsif clk_in'event and clk_in = '1' then
		cnt <= cnt + 1;
			if cnt = 25 then
				state <= not(state);
				cnt <= 1;
			end if;
			clk_out <= state;
		end if;
	end process;
end DerivedClock_stru;