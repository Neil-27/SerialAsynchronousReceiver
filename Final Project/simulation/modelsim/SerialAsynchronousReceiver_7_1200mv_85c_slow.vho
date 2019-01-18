-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "12/04/2018 11:50:51"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	top IS
    PORT (
	clk : IN std_logic;
	ack : IN std_logic;
	en : IN std_logic;
	rst : IN std_logic;
	rx : IN std_logic;
	dry : OUT std_logic;
	err : OUT std_logic;
	OQ : OUT std_logic_vector(7 DOWNTO 0)
	);
END top;

-- Design Ports Information
-- dry	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- err	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OQ[0]	=>  Location: PIN_T4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OQ[1]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OQ[2]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OQ[3]	=>  Location: PIN_U4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OQ[4]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OQ[5]	=>  Location: PIN_U3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OQ[6]	=>  Location: PIN_R3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OQ[7]	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ack	=>  Location: PIN_R1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx	=>  Location: PIN_R2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- en	=>  Location: PIN_T3,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_ack : std_logic;
SIGNAL ww_en : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_rx : std_logic;
SIGNAL ww_dry : std_logic;
SIGNAL ww_err : std_logic;
SIGNAL ww_OQ : std_logic_vector(7 DOWNTO 0);
SIGNAL \L0|Selector1~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \L0|rxck~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rst~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \L0|rxck~q\ : std_logic;
SIGNAL \L0|Selector2~0_combout\ : std_logic;
SIGNAL \L0|Selector4~4_combout\ : std_logic;
SIGNAL \L0|Equal0~0_combout\ : std_logic;
SIGNAL \L0|process_2~0_combout\ : std_logic;
SIGNAL \L0|counter~0_combout\ : std_logic;
SIGNAL \L0|counter[0]~1_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \L0|rxck~clkctrl_outclk\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \dry~output_o\ : std_logic;
SIGNAL \err~output_o\ : std_logic;
SIGNAL \OQ[0]~output_o\ : std_logic;
SIGNAL \OQ[1]~output_o\ : std_logic;
SIGNAL \OQ[2]~output_o\ : std_logic;
SIGNAL \OQ[3]~output_o\ : std_logic;
SIGNAL \OQ[4]~output_o\ : std_logic;
SIGNAL \OQ[5]~output_o\ : std_logic;
SIGNAL \OQ[6]~output_o\ : std_logic;
SIGNAL \OQ[7]~output_o\ : std_logic;
SIGNAL \rx~input_o\ : std_logic;
SIGNAL \L2|sr[0]~feeder_combout\ : std_logic;
SIGNAL \ack~input_o\ : std_logic;
SIGNAL \en~input_o\ : std_logic;
SIGNAL \L0|CS.s1~feeder_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \L0|CS.s1~q\ : std_logic;
SIGNAL \L0|Selector4~5_combout\ : std_logic;
SIGNAL \L0|CS.s2~q\ : std_logic;
SIGNAL \L1|counter~3_combout\ : std_logic;
SIGNAL \L1|counter~0_combout\ : std_logic;
SIGNAL \L1|counter~1_combout\ : std_logic;
SIGNAL \L1|counter[2]~2_combout\ : std_logic;
SIGNAL \L1|Equal0~0_combout\ : std_logic;
SIGNAL \L1|rxf~q\ : std_logic;
SIGNAL \L0|NS.s3~0_combout\ : std_logic;
SIGNAL \L0|CS.s3~q\ : std_logic;
SIGNAL \L0|Selector5~0_combout\ : std_logic;
SIGNAL \L0|Selector5~1_combout\ : std_logic;
SIGNAL \L0|CS.s4~feeder_combout\ : std_logic;
SIGNAL \L0|CS.s4~q\ : std_logic;
SIGNAL \L0|Selector3~0_combout\ : std_logic;
SIGNAL \L0|Selector3~1_combout\ : std_logic;
SIGNAL \L2|sr[2]~feeder_combout\ : std_logic;
SIGNAL \L2|sr[3]~feeder_combout\ : std_logic;
SIGNAL \L2|sr[4]~feeder_combout\ : std_logic;
SIGNAL \L2|sr[5]~feeder_combout\ : std_logic;
SIGNAL \L2|sr[6]~feeder_combout\ : std_logic;
SIGNAL \L2|sr[7]~feeder_combout\ : std_logic;
SIGNAL \L2|sr[8]~feeder_combout\ : std_logic;
SIGNAL \L2|sr[9]~feeder_combout\ : std_logic;
SIGNAL \L2|sr[10]~feeder_combout\ : std_logic;
SIGNAL \L0|NS.s5~0_combout\ : std_logic;
SIGNAL \L0|CS.s5~q\ : std_logic;
SIGNAL \L0|dataReady~combout\ : std_logic;
SIGNAL \L0|err~0_combout\ : std_logic;
SIGNAL \L0|CS.s0~feeder_combout\ : std_logic;
SIGNAL \L0|CS.s0~q\ : std_logic;
SIGNAL \L0|Selector1~combout\ : std_logic;
SIGNAL \L0|Selector1~clkctrl_outclk\ : std_logic;
SIGNAL \L3|OQ[0]~feeder_combout\ : std_logic;
SIGNAL \L3|OQ[1]~feeder_combout\ : std_logic;
SIGNAL \L3|OQ[2]~feeder_combout\ : std_logic;
SIGNAL \L3|OQ[3]~feeder_combout\ : std_logic;
SIGNAL \L3|OQ[4]~feeder_combout\ : std_logic;
SIGNAL \L3|OQ[5]~feeder_combout\ : std_logic;
SIGNAL \L3|OQ[6]~feeder_combout\ : std_logic;
SIGNAL \L3|OQ[7]~feeder_combout\ : std_logic;
SIGNAL \L1|counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \L0|counter\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \L3|OQ\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \L2|sr\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \L0|ALT_INV_process_2~0_combout\ : std_logic;
SIGNAL \L0|ALT_INV_Selector3~1_combout\ : std_logic;
SIGNAL \L0|ALT_INV_err~0_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_ack <= ack;
ww_en <= en;
ww_rst <= rst;
ww_rx <= rx;
dry <= ww_dry;
err <= ww_err;
OQ <= ww_OQ;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\L0|Selector1~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \L0|Selector1~combout\);

\L0|rxck~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \L0|rxck~q\);

\rst~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rst~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\L0|ALT_INV_process_2~0_combout\ <= NOT \L0|process_2~0_combout\;
\L0|ALT_INV_Selector3~1_combout\ <= NOT \L0|Selector3~1_combout\;
\L0|ALT_INV_err~0_combout\ <= NOT \L0|err~0_combout\;

-- Location: FF_X1_Y36_N7
\L0|rxck\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L0|Equal0~0_combout\,
	clrn => \L0|ALT_INV_process_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L0|rxck~q\);

-- Location: LCCOMB_X2_Y36_N8
\L0|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \L0|Selector2~0_combout\ = (\L0|CS.s1~q\ & (\en~input_o\ & !\rx~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \L0|CS.s1~q\,
	datac => \en~input_o\,
	datad => \rx~input_o\,
	combout => \L0|Selector2~0_combout\);

-- Location: LCCOMB_X2_Y36_N12
\L0|Selector4~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \L0|Selector4~4_combout\ = (!\L1|rxf~q\ & \L0|CS.s2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \L1|rxf~q\,
	datad => \L0|CS.s2~q\,
	combout => \L0|Selector4~4_combout\);

-- Location: FF_X1_Y36_N11
\L0|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L0|counter[0]~1_combout\,
	clrn => \L0|ALT_INV_process_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L0|counter\(0));

-- Location: FF_X1_Y36_N27
\L0|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L0|counter~0_combout\,
	clrn => \L0|ALT_INV_process_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L0|counter\(1));

-- Location: LCCOMB_X1_Y36_N6
\L0|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \L0|Equal0~0_combout\ = (!\L0|counter\(1) & \L0|counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \L0|counter\(1),
	datad => \L0|counter\(0),
	combout => \L0|Equal0~0_combout\);

-- Location: LCCOMB_X2_Y36_N28
\L0|process_2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \L0|process_2~0_combout\ = (((!\L0|Selector2~0_combout\ & !\L0|Selector4~4_combout\)) # (!\en~input_o\)) # (!\rst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~input_o\,
	datab => \L0|Selector2~0_combout\,
	datac => \en~input_o\,
	datad => \L0|Selector4~4_combout\,
	combout => \L0|process_2~0_combout\);

-- Location: LCCOMB_X1_Y36_N26
\L0|counter~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \L0|counter~0_combout\ = \L0|counter\(1) $ (\L0|counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \L0|counter\(1),
	datad => \L0|counter\(0),
	combout => \L0|counter~0_combout\);

-- Location: LCCOMB_X1_Y36_N10
\L0|counter[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \L0|counter[0]~1_combout\ = !\L0|counter\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \L0|counter\(0),
	combout => \L0|counter[0]~1_combout\);

-- Location: IOIBUF_X0_Y36_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G3
\L0|rxck~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \L0|rxck~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \L0|rxck~clkctrl_outclk\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOOBUF_X0_Y42_N9
\dry~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L0|dataReady~combout\,
	devoe => ww_devoe,
	o => \dry~output_o\);

-- Location: IOOBUF_X0_Y35_N16
\err~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L0|ALT_INV_err~0_combout\,
	devoe => ww_devoe,
	o => \err~output_o\);

-- Location: IOOBUF_X0_Y33_N23
\OQ[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L3|OQ\(0),
	devoe => ww_devoe,
	o => \OQ[0]~output_o\);

-- Location: IOOBUF_X0_Y32_N23
\OQ[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L3|OQ\(1),
	devoe => ww_devoe,
	o => \OQ[1]~output_o\);

-- Location: IOOBUF_X0_Y34_N2
\OQ[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L3|OQ\(2),
	devoe => ww_devoe,
	o => \OQ[2]~output_o\);

-- Location: IOOBUF_X0_Y34_N16
\OQ[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L3|OQ\(3),
	devoe => ww_devoe,
	o => \OQ[3]~output_o\);

-- Location: IOOBUF_X0_Y31_N16
\OQ[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L3|OQ\(4),
	devoe => ww_devoe,
	o => \OQ[4]~output_o\);

-- Location: IOOBUF_X0_Y34_N9
\OQ[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L3|OQ\(5),
	devoe => ww_devoe,
	o => \OQ[5]~output_o\);

-- Location: IOOBUF_X0_Y34_N23
\OQ[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L3|OQ\(6),
	devoe => ww_devoe,
	o => \OQ[6]~output_o\);

-- Location: IOOBUF_X0_Y33_N16
\OQ[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L3|OQ\(7),
	devoe => ww_devoe,
	o => \OQ[7]~output_o\);

-- Location: IOIBUF_X0_Y35_N1
\rx~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx,
	o => \rx~input_o\);

-- Location: LCCOMB_X2_Y36_N10
\L2|sr[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \L2|sr[0]~feeder_combout\ = \rx~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rx~input_o\,
	combout => \L2|sr[0]~feeder_combout\);

-- Location: IOIBUF_X0_Y35_N8
\ack~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ack,
	o => \ack~input_o\);

-- Location: IOIBUF_X0_Y32_N15
\en~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_en,
	o => \en~input_o\);

-- Location: LCCOMB_X2_Y36_N26
\L0|CS.s1~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \L0|CS.s1~feeder_combout\ = \L0|Selector3~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L0|Selector3~1_combout\,
	combout => \L0|CS.s1~feeder_combout\);

-- Location: IOIBUF_X0_Y36_N15
\rst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: CLKCTRL_G1
\rst~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rst~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rst~inputclkctrl_outclk\);

-- Location: FF_X2_Y36_N27
\L0|CS.s1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L0|CS.s1~feeder_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L0|CS.s1~q\);

-- Location: LCCOMB_X2_Y36_N6
\L0|Selector4~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \L0|Selector4~5_combout\ = (\L0|Selector4~4_combout\) # ((\en~input_o\ & (\L0|CS.s1~q\ & !\rx~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L0|Selector4~4_combout\,
	datab => \en~input_o\,
	datac => \L0|CS.s1~q\,
	datad => \rx~input_o\,
	combout => \L0|Selector4~5_combout\);

-- Location: FF_X2_Y36_N7
\L0|CS.s2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L0|Selector4~5_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L0|CS.s2~q\);

-- Location: LCCOMB_X3_Y36_N6
\L1|counter~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \L1|counter~3_combout\ = (!\L1|counter\(0) & (((\L1|counter\(2)) # (!\L1|counter\(3))) # (!\L1|counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L1|counter\(1),
	datab => \L1|counter\(3),
	datac => \L1|counter\(0),
	datad => \L1|counter\(2),
	combout => \L1|counter~3_combout\);

-- Location: FF_X3_Y36_N7
\L1|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|rxck~clkctrl_outclk\,
	d => \L1|counter~3_combout\,
	clrn => \L0|ALT_INV_Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L1|counter\(0));

-- Location: LCCOMB_X3_Y36_N14
\L1|counter~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \L1|counter~0_combout\ = (\L1|counter\(1) & ((\L1|counter\(2) & (\L1|counter\(3) $ (\L1|counter\(0)))) # (!\L1|counter\(2) & (\L1|counter\(3) & \L1|counter\(0))))) # (!\L1|counter\(1) & (((\L1|counter\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L1|counter\(1),
	datab => \L1|counter\(2),
	datac => \L1|counter\(3),
	datad => \L1|counter\(0),
	combout => \L1|counter~0_combout\);

-- Location: FF_X3_Y36_N15
\L1|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|rxck~clkctrl_outclk\,
	d => \L1|counter~0_combout\,
	clrn => \L0|ALT_INV_Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L1|counter\(3));

-- Location: LCCOMB_X3_Y36_N22
\L1|counter~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \L1|counter~1_combout\ = (\L1|counter\(1) & (!\L1|counter\(0) & ((\L1|counter\(2)) # (!\L1|counter\(3))))) # (!\L1|counter\(1) & (((\L1|counter\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L1|counter\(2),
	datab => \L1|counter\(3),
	datac => \L1|counter\(1),
	datad => \L1|counter\(0),
	combout => \L1|counter~1_combout\);

-- Location: FF_X3_Y36_N23
\L1|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|rxck~clkctrl_outclk\,
	d => \L1|counter~1_combout\,
	clrn => \L0|ALT_INV_Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L1|counter\(1));

-- Location: LCCOMB_X3_Y36_N10
\L1|counter[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \L1|counter[2]~2_combout\ = \L1|counter\(2) $ (((\L1|counter\(0) & \L1|counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L1|counter\(0),
	datac => \L1|counter\(2),
	datad => \L1|counter\(1),
	combout => \L1|counter[2]~2_combout\);

-- Location: FF_X3_Y36_N11
\L1|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|rxck~clkctrl_outclk\,
	d => \L1|counter[2]~2_combout\,
	clrn => \L0|ALT_INV_Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L1|counter\(2));

-- Location: LCCOMB_X3_Y36_N12
\L1|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \L1|Equal0~0_combout\ = (!\L1|counter\(0) & (!\L1|counter\(2) & (\L1|counter\(3) & \L1|counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L1|counter\(0),
	datab => \L1|counter\(2),
	datac => \L1|counter\(3),
	datad => \L1|counter\(1),
	combout => \L1|Equal0~0_combout\);

-- Location: FF_X3_Y36_N13
\L1|rxf\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|rxck~clkctrl_outclk\,
	d => \L1|Equal0~0_combout\,
	clrn => \L0|ALT_INV_Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L1|rxf~q\);

-- Location: LCCOMB_X3_Y36_N30
\L0|NS.s3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \L0|NS.s3~0_combout\ = (\L0|CS.s2~q\ & \L1|rxf~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \L0|CS.s2~q\,
	datad => \L1|rxf~q\,
	combout => \L0|NS.s3~0_combout\);

-- Location: FF_X3_Y36_N31
\L0|CS.s3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \L0|NS.s3~0_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L0|CS.s3~q\);

-- Location: LCCOMB_X2_Y36_N20
\L0|Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \L0|Selector5~0_combout\ = (\L0|CS.s3~q\ & ((\L2|sr\(10)) # ((!\L2|sr\(1)) # (!\L2|sr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L2|sr\(10),
	datab => \L2|sr\(0),
	datac => \L0|CS.s3~q\,
	datad => \L2|sr\(1),
	combout => \L0|Selector5~0_combout\);

-- Location: LCCOMB_X2_Y36_N30
\L0|Selector5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \L0|Selector5~1_combout\ = (\L0|Selector5~0_combout\) # ((!\ack~input_o\ & \L0|CS.s4~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ack~input_o\,
	datac => \L0|CS.s4~q\,
	datad => \L0|Selector5~0_combout\,
	combout => \L0|Selector5~1_combout\);

-- Location: LCCOMB_X2_Y36_N14
\L0|CS.s4~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \L0|CS.s4~feeder_combout\ = \L0|Selector5~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \L0|Selector5~1_combout\,
	combout => \L0|CS.s4~feeder_combout\);

-- Location: FF_X2_Y36_N15
\L0|CS.s4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L0|CS.s4~feeder_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L0|CS.s4~q\);

-- Location: LCCOMB_X2_Y36_N0
\L0|Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \L0|Selector3~0_combout\ = (!\L0|CS.s2~q\ & (((\rx~input_o\) # (!\L0|CS.s1~q\)) # (!\en~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \en~input_o\,
	datab => \rx~input_o\,
	datac => \L0|CS.s1~q\,
	datad => \L0|CS.s2~q\,
	combout => \L0|Selector3~0_combout\);

-- Location: LCCOMB_X2_Y36_N18
\L0|Selector3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \L0|Selector3~1_combout\ = (\L0|CS.s4~q\ & (((\ack~input_o\)))) # (!\L0|CS.s4~q\ & (!\L0|CS.s3~q\ & ((\L0|Selector3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L0|CS.s3~q\,
	datab => \ack~input_o\,
	datac => \L0|CS.s4~q\,
	datad => \L0|Selector3~0_combout\,
	combout => \L0|Selector3~1_combout\);

-- Location: FF_X2_Y36_N11
\L2|sr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|rxck~q\,
	d => \L2|sr[0]~feeder_combout\,
	clrn => \L0|ALT_INV_Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L2|sr\(0));

-- Location: FF_X2_Y36_N17
\L2|sr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|rxck~q\,
	asdata => \L2|sr\(0),
	clrn => \L0|ALT_INV_Selector3~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L2|sr\(1));

-- Location: LCCOMB_X1_Y34_N28
\L2|sr[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \L2|sr[2]~feeder_combout\ = \L2|sr\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L2|sr\(1),
	combout => \L2|sr[2]~feeder_combout\);

-- Location: FF_X1_Y34_N29
\L2|sr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|rxck~clkctrl_outclk\,
	d => \L2|sr[2]~feeder_combout\,
	clrn => \L0|ALT_INV_Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L2|sr\(2));

-- Location: LCCOMB_X1_Y34_N10
\L2|sr[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \L2|sr[3]~feeder_combout\ = \L2|sr\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L2|sr\(2),
	combout => \L2|sr[3]~feeder_combout\);

-- Location: FF_X1_Y34_N11
\L2|sr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|rxck~clkctrl_outclk\,
	d => \L2|sr[3]~feeder_combout\,
	clrn => \L0|ALT_INV_Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L2|sr\(3));

-- Location: LCCOMB_X1_Y34_N16
\L2|sr[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \L2|sr[4]~feeder_combout\ = \L2|sr\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L2|sr\(3),
	combout => \L2|sr[4]~feeder_combout\);

-- Location: FF_X1_Y34_N17
\L2|sr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|rxck~clkctrl_outclk\,
	d => \L2|sr[4]~feeder_combout\,
	clrn => \L0|ALT_INV_Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L2|sr\(4));

-- Location: LCCOMB_X1_Y34_N6
\L2|sr[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \L2|sr[5]~feeder_combout\ = \L2|sr\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L2|sr\(4),
	combout => \L2|sr[5]~feeder_combout\);

-- Location: FF_X1_Y34_N7
\L2|sr[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|rxck~clkctrl_outclk\,
	d => \L2|sr[5]~feeder_combout\,
	clrn => \L0|ALT_INV_Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L2|sr\(5));

-- Location: LCCOMB_X1_Y34_N12
\L2|sr[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \L2|sr[6]~feeder_combout\ = \L2|sr\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L2|sr\(5),
	combout => \L2|sr[6]~feeder_combout\);

-- Location: FF_X1_Y34_N13
\L2|sr[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|rxck~clkctrl_outclk\,
	d => \L2|sr[6]~feeder_combout\,
	clrn => \L0|ALT_INV_Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L2|sr\(6));

-- Location: LCCOMB_X1_Y34_N2
\L2|sr[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \L2|sr[7]~feeder_combout\ = \L2|sr\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L2|sr\(6),
	combout => \L2|sr[7]~feeder_combout\);

-- Location: FF_X1_Y34_N3
\L2|sr[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|rxck~clkctrl_outclk\,
	d => \L2|sr[7]~feeder_combout\,
	clrn => \L0|ALT_INV_Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L2|sr\(7));

-- Location: LCCOMB_X1_Y34_N20
\L2|sr[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \L2|sr[8]~feeder_combout\ = \L2|sr\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L2|sr\(7),
	combout => \L2|sr[8]~feeder_combout\);

-- Location: FF_X1_Y34_N21
\L2|sr[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|rxck~clkctrl_outclk\,
	d => \L2|sr[8]~feeder_combout\,
	clrn => \L0|ALT_INV_Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L2|sr\(8));

-- Location: LCCOMB_X1_Y34_N18
\L2|sr[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \L2|sr[9]~feeder_combout\ = \L2|sr\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L2|sr\(8),
	combout => \L2|sr[9]~feeder_combout\);

-- Location: FF_X1_Y34_N19
\L2|sr[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|rxck~clkctrl_outclk\,
	d => \L2|sr[9]~feeder_combout\,
	clrn => \L0|ALT_INV_Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L2|sr\(9));

-- Location: LCCOMB_X2_Y36_N22
\L2|sr[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \L2|sr[10]~feeder_combout\ = \L2|sr\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L2|sr\(9),
	combout => \L2|sr[10]~feeder_combout\);

-- Location: FF_X2_Y36_N23
\L2|sr[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|rxck~q\,
	d => \L2|sr[10]~feeder_combout\,
	clrn => \L0|ALT_INV_Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L2|sr\(10));

-- Location: LCCOMB_X2_Y36_N24
\L0|NS.s5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \L0|NS.s5~0_combout\ = (\L2|sr\(0) & (\L2|sr\(1) & (\L0|CS.s3~q\ & !\L2|sr\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L2|sr\(0),
	datab => \L2|sr\(1),
	datac => \L0|CS.s3~q\,
	datad => \L2|sr\(10),
	combout => \L0|NS.s5~0_combout\);

-- Location: FF_X2_Y36_N5
\L0|CS.s5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \L0|NS.s5~0_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L0|CS.s5~q\);

-- Location: LCCOMB_X2_Y36_N4
\L0|dataReady\ : cycloneive_lcell_comb
-- Equation(s):
-- \L0|dataReady~combout\ = (\L0|CS.s1~q\ & (\L0|dataReady~combout\)) # (!\L0|CS.s1~q\ & ((\L0|CS.s5~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \L0|dataReady~combout\,
	datac => \L0|CS.s5~q\,
	datad => \L0|CS.s1~q\,
	combout => \L0|dataReady~combout\);

-- Location: LCCOMB_X2_Y36_N16
\L0|err~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \L0|err~0_combout\ = (\ack~input_o\) # (!\L0|CS.s4~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L0|CS.s4~q\,
	datab => \ack~input_o\,
	combout => \L0|err~0_combout\);

-- Location: LCCOMB_X1_Y36_N4
\L0|CS.s0~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \L0|CS.s0~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \L0|CS.s0~feeder_combout\);

-- Location: FF_X1_Y36_N5
\L0|CS.s0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L0|CS.s0~feeder_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L0|CS.s0~q\);

-- Location: LCCOMB_X1_Y36_N14
\L0|Selector1\ : cycloneive_lcell_comb
-- Equation(s):
-- \L0|Selector1~combout\ = LCELL((\L0|NS.s5~0_combout\) # (!\L0|CS.s0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \L0|CS.s0~q\,
	datad => \L0|NS.s5~0_combout\,
	combout => \L0|Selector1~combout\);

-- Location: CLKCTRL_G0
\L0|Selector1~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \L0|Selector1~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \L0|Selector1~clkctrl_outclk\);

-- Location: LCCOMB_X1_Y34_N24
\L3|OQ[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \L3|OQ[0]~feeder_combout\ = \L2|sr\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L2|sr\(2),
	combout => \L3|OQ[0]~feeder_combout\);

-- Location: FF_X1_Y34_N25
\L3|OQ[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|Selector1~clkctrl_outclk\,
	d => \L3|OQ[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L3|OQ\(0));

-- Location: LCCOMB_X1_Y34_N30
\L3|OQ[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \L3|OQ[1]~feeder_combout\ = \L2|sr\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L2|sr\(3),
	combout => \L3|OQ[1]~feeder_combout\);

-- Location: FF_X1_Y34_N31
\L3|OQ[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|Selector1~clkctrl_outclk\,
	d => \L3|OQ[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L3|OQ\(1));

-- Location: LCCOMB_X1_Y34_N0
\L3|OQ[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \L3|OQ[2]~feeder_combout\ = \L2|sr\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L2|sr\(4),
	combout => \L3|OQ[2]~feeder_combout\);

-- Location: FF_X1_Y34_N1
\L3|OQ[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|Selector1~clkctrl_outclk\,
	d => \L3|OQ[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L3|OQ\(2));

-- Location: LCCOMB_X1_Y34_N14
\L3|OQ[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \L3|OQ[3]~feeder_combout\ = \L2|sr\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L2|sr\(5),
	combout => \L3|OQ[3]~feeder_combout\);

-- Location: FF_X1_Y34_N15
\L3|OQ[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|Selector1~clkctrl_outclk\,
	d => \L3|OQ[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L3|OQ\(3));

-- Location: LCCOMB_X1_Y34_N4
\L3|OQ[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \L3|OQ[4]~feeder_combout\ = \L2|sr\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L2|sr\(6),
	combout => \L3|OQ[4]~feeder_combout\);

-- Location: FF_X1_Y34_N5
\L3|OQ[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|Selector1~clkctrl_outclk\,
	d => \L3|OQ[4]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L3|OQ\(4));

-- Location: LCCOMB_X1_Y34_N22
\L3|OQ[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \L3|OQ[5]~feeder_combout\ = \L2|sr\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L2|sr\(7),
	combout => \L3|OQ[5]~feeder_combout\);

-- Location: FF_X1_Y34_N23
\L3|OQ[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|Selector1~clkctrl_outclk\,
	d => \L3|OQ[5]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L3|OQ\(5));

-- Location: LCCOMB_X1_Y34_N8
\L3|OQ[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \L3|OQ[6]~feeder_combout\ = \L2|sr\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L2|sr\(8),
	combout => \L3|OQ[6]~feeder_combout\);

-- Location: FF_X1_Y34_N9
\L3|OQ[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|Selector1~clkctrl_outclk\,
	d => \L3|OQ[6]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L3|OQ\(6));

-- Location: LCCOMB_X1_Y34_N26
\L3|OQ[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \L3|OQ[7]~feeder_combout\ = \L2|sr\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L2|sr\(9),
	combout => \L3|OQ[7]~feeder_combout\);

-- Location: FF_X1_Y34_N27
\L3|OQ[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \L0|Selector1~clkctrl_outclk\,
	d => \L3|OQ[7]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L3|OQ\(7));

ww_dry <= \dry~output_o\;

ww_err <= \err~output_o\;

ww_OQ(0) <= \OQ[0]~output_o\;

ww_OQ(1) <= \OQ[1]~output_o\;

ww_OQ(2) <= \OQ[2]~output_o\;

ww_OQ(3) <= \OQ[3]~output_o\;

ww_OQ(4) <= \OQ[4]~output_o\;

ww_OQ(5) <= \OQ[5]~output_o\;

ww_OQ(6) <= \OQ[6]~output_o\;

ww_OQ(7) <= \OQ[7]~output_o\;
END structure;


