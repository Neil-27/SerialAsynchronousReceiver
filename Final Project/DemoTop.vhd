library ieee;
use ieee.std_logic_1164.all;

entity DemoTop is
	port (
		clk, ack, en, rst, send: in std_logic;
		packet: in std_logic_vector(10 downto 0);
		dry, err: out std_logic;
		OQ: out std_logic_vector(7 downto 0)
	);
end DemoTop;

architecture DemoTop_stru of DemoTop is
	signal rx: std_logic;
	component top
		port (
		clk, ack, en, rst, rx: in std_logic;
		dry, err: out std_logic;
		OQ: out std_logic_vector(7 downto 0)
		);
	end component;
	
	component DemoLayer
		port (
		clk, send: in std_logic;
		packet: in std_logic_vector(10 downto 0);
		bitOut: out std_logic
		);
	end component;
begin
	L0: DemoLayer port map (clk, send, packet, rx);
	L1: top port map (clk, ack, en, rst, rx, dry, err, OQ);
end DemoTop_stru;