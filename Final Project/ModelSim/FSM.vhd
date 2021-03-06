library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FSM is
port(
	clk, ack, en, rst, ed, rxo, rxf, st : in std_logic;
	pd, dry, err, rxck, cdc, dlEn : out std_logic
	
);
end FSM;

architecture fsmarch of FSM is 
	type states is (s0, s1, s2, s3, s4, s5);
	signal clock, reset, enable: std_logic;
	signal clkAdjust: std_logic;
	signal pulse, clear, dataReady, dataError: std_logic;
	signal CS, NS : states;
	signal counter : unsigned(1 downto 0) := "00";
begin
	clock <= clk;
	reset <= rst;
	enable <= en;
	process(clock, reset)
	begin
		if reset = '0' then
			dlEn <= '0'; -- clear data on data latch
			CS <= S0;
		elsif clock'event and clock = '1' then
			dlEn <= '1';
		   CS <= NS;
		end if;
	end process;
	process (clock, CS)
	begin
		dataReady <= dataReady; -- purposely infer latch since we want to keep dry high between S5
			case CS is
				when S0 => -- reset state
					clear <= '0';
					pulse <= '0';
					dataReady <= '0';
					dataError <= '0';
					clkAdjust <= '0';
						NS <= S1;
				when S1 => -- waiting for start bit
					pulse <= '0';
					clkAdjust <= '0';
					dataError <= '0';
						if st = '0' and enable = '1' then -- do not listen for start bit if enable is off
						   clear <= '1';
						   clkAdjust <= '1';
							NS <= S2;
						else
						   clear <= '0';
							NS <= S1;
						end if;			
				when S2 => -- waiting for complete packet
					dataReady <= '0';
					dataError <= '0';
					clear <= '1';
					pulse <= '0';
					if rxf = '1' then
							clkAdjust <= '0';
							NS <= S3;
						else
							if enable = '1' then -- only process incoming bits if enable is on
								clkAdjust <= '1';
							else
								clkAdjust <= '0';
							end if;
							NS <= S2;
						end if;
				when S3 => -- transition state
					clear <= '1';
					dataReady <= '0';
					pulse <= '0';
					clkAdjust <= '0';
					dataError <= '0';
						if ed = '1' then
							NS <= S4;
						else
							pulse <= '1';
							NS <= S5;
						end if;
				when S4 => -- error state
						dataReady <= '0';
						pulse <= '0';
						clkAdjust <= '0';
						if ack = '0' then
							dataError <= '1';
							clear <= '1';
							NS <= S4;
						else
							dataError <= '0';
							clear <= '0';
							NS <= S1;
						end if;
				when S5 => -- success state
						clkAdjust <= '0';
						dataReady <= '1';
						dataError <= '0';
						clear <= '0';
						pulse <= '0';
						NS <= S1;
			end case;
	end process;
			pd <= pulse;
			cdc <= clear;
			dry <= dataReady;
			err <= dataError;
	process (clock, reset, enable)
	begin
		if reset = '0' or enable = '0' or clkAdjust = '0' then
			rxck <= '0';
			counter <= "00";
		elsif (clock'event and clock = '1' and clkAdjust = '1') then
			if counter = "01" then
				rxck <= '1';
				counter <= counter + 1;
			else
				rxck <= '0';
				if counter = "11" then
					counter <= "00";
				else
					counter <= counter + 1;
				end if;
			end if;
		end if;
	end process;
end fsmarch;
	
