LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;
                             

ENTITY receiver_tst IS
END receiver_tst;

ARCHITECTURE receiver_arch OF receiver_tst IS
-- constants 
-- constants   
type test_vector is record
        Rst : STD_LOGIC;
	      En : STD_LOGIC;
	      rx : STD_LOGIC;
	      ack : STD_LOGIC;
	      OQ : STD_LOGIC_VECTOR(7 DOWNTO 0);
	      dry : STD_LOGIC;
	      ERR : STD_LOGIC;
end record;

type test_vector_array is array (natural range <>) of test_vector;
    constant test_vectors : test_vector_array := (
	
			 -- INITIAL STATE --
  			 ('0', 'U', 'U', 'U', "00000000", '0', '0'), -- reset enabled
			 ('1', '1', '1', '0', "00000000", '0', '0'), -- disable reset and enable input
			 ('1', '1', '1', '0', "00000000", '0', '0'), -- wait
			 ('1', '1', '1', '0', "00000000", '0', '0'), -- wait
			 
			 -- TEST PACKET 1 (VALID PACKET) --
			 ('1', '1', '0', '0', "00000000", '0', '0'), -- send start bit (start of packet)
			 ('1', '1', '1', '0', "00000000", '0', '0'), -- start data (10110101)
			 ('1', '1', '0', '0', "00000000", '0', '0'),
			 ('1', '1', '1', '0', "00000000", '0', '0'),
			 ('1', '1', '1', '0', "00000000", '0', '0'),
			 ('1', '1', '0', '0', "00000000", '0', '0'),
			 ('1', '1', '1', '0', "00000000", '0', '0'),
			 ('1', '1', '0', '0', "00000000", '0', '0'),
			 ('1', '1', '1', '0', "00000000", '0', '0'), -- end data
			 ('1', '1', '1', '0', "00000000", '0', '0'), -- stop bit 1
			 ('1', '1', '1', '0', "00000000", '0', '0'), -- stop bit 2
			 
			 ('1', '1', '1', '0', "10110101", '1', '0'), -- data received successfully
			 ('1', '1', '1', '0', "10110101", '1', '0'), -- wait
			 ('1', '1', '1', '0', "10110101", '1', '0'), -- wait
			 --18
			 -- TEST PACKET 2 (VALID PACKET) --
			 ('1', '1', '0', '0', "10110101", '1', '0'), -- send start bit (start of packet)
			 ('1', '1', '1', '0', "10110101", '0', '0'), -- start data (11100100)
			 ('1', '1', '1', '0', "10110101", '0', '0'),
			 ('1', '1', '1', '0', "10110101", '0', '0'),
			 ('1', '1', '0', '0', "10110101", '0', '0'),
			 ('1', '1', '0', '0', "10110101", '0', '0'),
			 ('1', '1', '1', '0', "10110101", '0', '0'),
			 ('1', '1', '0', '0', "10110101", '0', '0'),
			 ('1', '1', '0', '0', "10110101", '0', '0'), -- end data
			 ('1', '1', '1', '0', "10110101", '0', '0'), -- stop bit 1
			 ('1', '1', '1', '0', "10110101", '0', '0'), -- stop bit 2
			 
			 ('1', '1', '1', '0', "11100100", '1', '0'), -- data received successfully
			 ('1', '1', '1', '0', "11100100", '1', '0'), -- wait
			 ('1', '1', '1', '0', "11100100", '1', '0'), -- wait
			 
			 -- TEST PACKET 3 (INVALID PACKET) --
			 ('1', '1', '0', '0', "11100100", '1', '0'), -- send start bit (start of packet)
			 ('1', '1', '1', '0', "11100100", '0', '0'), -- start data (00110011)
			 ('1', '1', '1', '0', "11100100", '0', '0'),
			 ('1', '1', '1', '0', "11100100", '0', '0'),
			 ('1', '1', '0', '0', "11100100", '0', '0'),
			 ('1', '1', '0', '0', "11100100", '0', '0'),
			 ('1', '1', '1', '0', "11100100", '0', '0'),
			 ('1', '1', '0', '0', "11100100", '0', '0'),
			 ('1', '1', '0', '0', "11100100", '0', '0'), -- end data
			 ('1', '1', '0', '0', "11100100", '0', '0'), -- stop bit 1 (INVALID!)
			 ('1', '1', '1', '0', "11100100", '0', '0'), -- stop bit 2
			 
			 --43
			 -- ERROR STATE --
			 ('1', '1', '1', '0', "11100100", '0', '1'), -- error state
			 ('1', '1', '1', '0', "11100100", '0', '1'), -- wait
			 ('1', '1', '1', '0', "11100100", '0', '1'), -- wait
			 ('1', '1', '0', '0', "11100100", '0', '1'), -- try start bit (should be ignored because of error state)
			 ('1', '1', '1', '0', "11100100", '0', '1'), -- wait
			 ('1', '1', '1', '0', "11100100", '0', '1'), -- wait
			 ('1', '1', '1', '1', "11100100", '0', '0'), -- acknowledge error
			 ('1', '1', '1', '0', "11100100", '0', '0'), -- wait
			 ('1', '1', '1', '0', "11100100", '0', '0'), -- wait
			 
			 -- TEST PACKET 4 (FSM TO BE RESET HALFWAY) --
			 ('1', '1', '0', '0', "11100100", '0', '0'), -- send start bit (start of packet)
			 ('1', '1', '1', '0', "11100100", '0', '0'), -- start data (1000...)
			 ('1', '1', '0', '0', "11100100", '0', '0'),
			 ('1', '1', '0', '0', "11100100", '0', '0'),
			 ('1', '1', '0', '0', "11100100", '0', '0'),
			 ('0', 'U', 'U', 'U', "00000000", '0', '0'), -- reset
			 
			 -- RESET STATE --
			 ('0', 'U', 'U', 'U', "00000000", '0', '0'),
			 ('0', 'U', 'U', 'U', "00000000", '0', '0'), -- wait
			 
			 -- EXIT RESET STATE, ENTER NON-ENABLED STATE --
			 ('1', '0', '1', '0', "00000000", '0', '0'), -- wait
			 ('1', '0', '1', '0', "00000000", '0', '0'), -- wait
			 ('1', '0', '0', '0', "00000000", '0', '0'), -- try start bit (should be ignored because of non-enabled state)
			 ('1', '0', '1', '0', "00000000", '0', '0'), -- wait
			 ('1', '0', '1', '0', "00000000", '0', '0'), -- wait
			 ('1', '0', '1', '0', "00000000", '0', '0'), -- wait
			 
			 -- ENTER ENABLED STATE --
			 ('1', '1', '1', '0', "00000000", '0', '0'), -- wait
			 ('1', '1', '1', '0', "00000000", '0', '0'), -- wait
			 
			 -- TEST PACKET 5 (VALID PACKET) --
			 ('1', '1', '0', '0', "00000000", '0', '0'), -- send start bit (start of packet)
			 ('1', '1', '1', '0', "00000000", '0', '0'), -- start data (10001111)
			 ('1', '1', '0', '0', "00000000", '0', '0'),
			 ('1', '1', '0', '0', "00000000", '0', '0'),
			 ('1', '1', '0', '0', "00000000", '0', '0'),
			 ('1', '1', '1', '0', "00000000", '0', '0'),
			 ('1', '1', '1', '0', "00000000", '0', '0'),
			 ('1', '1', '1', '0', "00000000", '0', '0'),
			 ('1', '1', '1', '0', "00000000", '0', '0'), -- end data
			 ('1', '1', '1', '0', "00000000", '0', '0'), -- stop bit 1
			 ('1', '1', '1', '0', "00000000", '0', '0'), -- stop bit 2
			 
			 ('1', '1', '1', '0', "10001111", '1', '0'), -- data received successfully
			 ('1', '1', '1', '0', "10001111", '1', '0'), -- wait
			 ('1', '1', '1', '0', "10001111", '1', '0')  -- wait
			 
        );                                                 
-- signals                                                   
SIGNAL Clk : STD_LOGIC;
SIGNAL Rst : STD_LOGIC;
SIGNAL En : STD_LOGIC;
SIGNAL rx : STD_LOGIC;
SIGNAL ack : STD_LOGIC;
SIGNAL dry : STD_LOGIC;
SIGNAL err : STD_LOGIC;
SIGNAL OQ : STD_LOGIC_VECTOR(7 DOWNTO 0);

COMPONENT top
	PORT (
		clk, ack, en, rst, rx: in std_logic;
		dry, err: out std_logic;
		OQ: out std_logic_vector(7 downto 0)
	);
END COMPONENT;

BEGIN
	i1 : top
	PORT MAP (
-- list connections between master ports and signals
	Clk => Clk,
	Rst => Rst,
	En => En,
	rx => rx,
	ack => ack,
	dry => dry,
	err => err,
	OQ => OQ
	);
	
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;
END PROCESS init; 
inputs : process (Clk)
variable i : natural range 0 to test_vectors'length := 0;
variable j : Integer := 0;
begin
if (CLK'event and CLK = '1') then
	if j = 0 then
	Rst <= test_vectors(i).Rst;
	En <= test_vectors(i).En;
	rx <= test_vectors(i).rx;
	ack <= test_vectors(i).ack;
	if i /= 81 then
	i := i + 1;
	end if;
	end if;
	j := j + 1;
	if j = 4 then
	j := 0;
	end if;
end if;
end process inputs;
test : process (Clk,Rst)
variable i : natural range 0 to test_vectors'length := 0;
variable j : Integer := 0;
begin
if (CLK'event and CLK = '1') then
	if j = 1 then
		assert( 
                    (OQ = test_vectors(i).OQ) and  
		    (dry = test_vectors(i).dry) and 
		    (err = test_vectors(i).err)
               )
	 	report  "test_vector " & integer'image(i) & " failed "
                    severity error;
        if i /= 81 then
         i := i + 1;
       end if;
	end if;
	j := j + 1;
	if j = 4 then
	j := 0;
	end if;
end if;
end process test;                                                                                                 
always : PROCESS                                                                     
BEGIN                                                         
	for i in 0 to 26*16 loop
		Clk <= '0';
		wait for 50 ps;   
		Clk <= '1';
		wait for 50 ps;
	end loop;  
WAIT;                                                        
END PROCESS always;                                          
END receiver_arch;
