library ieee;
use ieee.std_logic_1164.all;

entity DataLatch is
port(
	clk, en: in std_logic;
	D: in std_logic_vector(7 downto 0);
	OQ: out std_logic_vector(7 downto 0)
	);
end DataLatch;

architecture dlarch of DataLatch is
begin
	process(clk, D, en)
	begin
		if en = '0' then
			OQ <= (others => '0');
		elsif(clk'event and clk = '1') then
			OQ <= D;
		end if;
	end process;
end dlarch;
