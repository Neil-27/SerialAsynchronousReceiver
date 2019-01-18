library ieee;
use ieee.std_logic_1164.all;

entity top is
	port (
		clk, ack, en, rst, rx: in std_logic;
		dry, err: out std_logic;
		OQ: out std_logic_vector(7 downto 0)
	);
end top;

architecture top_stru of top is
	signal pd, cdc, rxf, rxo, rxck, qst, ed, dlEn: std_logic;
	signal QSP: std_logic_vector(1 downto 0);
	signal Q: std_logic_vector(7 downto 0);
	component ShiftRegister
		port (
			clk : in std_logic;
			clr : in std_logic;
			rx : in std_logic;
			rxo: out std_logic;
			QST: out std_logic;
			QSP: out std_logic_vector(1 downto 0);
			Q: out std_logic_vector(7 downto 0)
		);
	end component;
	component DataLatch
		port (
			clk: in std_logic;
			en: in std_logic;
			D: in std_logic_vector(7 downto 0);
			OQ: out std_logic_vector(7 downto 0)
		);
	end component;
	component DivBy11
		port (
			clk: in std_logic;
			clr: in std_logic;
			rxf: out std_logic
		);
	end component;
	component FSM
		port (
			clk, ack, en, rst, ed, rxo, rxf, st : in std_logic;
			pd, dry, err, rxck, cdc, dlEn : out std_logic
		);
	end component;
begin
   L0: FSM port map (clk, ack, en, rst, ed, rxo, rxf, rx, pd, dry, err, rxck, cdc, dlEn);
	L1: DivBy11 port map (rxck, cdc, rxf);
	L2: ShiftRegister port map (rxck, cdc, rx, rxo, qst, QSP(1 downto 0), Q(7 downto 0));
 	L3: DataLatch port map (pd, dlEn, Q(7 downto 0), OQ(7 downto 0));
	ed <= qst or not((qsp(1) and qsp(0)));
end top_stru;