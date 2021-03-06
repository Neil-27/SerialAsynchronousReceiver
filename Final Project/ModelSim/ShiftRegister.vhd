library ieee;
use ieee.std_logic_1164.all;

entity shiftregister is 
	port
	(
		clk : in std_logic;
		clr : in std_logic;
		rx : in std_logic;
		rxo: out std_logic;
		QST: out std_logic;
		QSP: out std_logic_vector(1 downto 0);
		Q: out std_logic_vector(7 downto 0)
	);
end entity;

architecture srarch of shiftregister is
	signal sr: std_logic_vector(10 downto 0);
begin
	process(clk,clr)
	begin
		if(clr = '0') then
			sr <= (others=>'0');
		elsif (rising_edge(clk)) then
			sr(10 downto 1) <= sr(9 downto 0);
			sr(0) <= rx;
			
		end if;
	end process;
	QST <= sr(10);
	Q(7 downto 0) <= sr(9 downto 2);
	QSP(1 downto 0) <= sr(1 downto 0);
end srarch;
		
	
		