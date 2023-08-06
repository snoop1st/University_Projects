-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

-- DATE "06/07/2021 13:08:23"

-- 
-- Device: Altera 5M160ZT100C4 Package TQFP100
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXV;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXV.MAXV_COMPONENTS.ALL;

ENTITY 	alu_16_bit IS
    PORT (
	a : IN std_logic_vector(15 DOWNTO 0);
	b : IN std_logic_vector(15 DOWNTO 0);
	opcode : IN std_logic_vector(2 DOWNTO 0);
	res : BUFFER std_logic_vector(15 DOWNTO 0);
	overflow : BUFFER std_logic
	);
END alu_16_bit;

-- Design Ports Information


ARCHITECTURE structure OF alu_16_bit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_opcode : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_res : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_overflow : std_logic;
SIGNAL \Init|binv~0_combout\ : std_logic;
SIGNAL \Init|comb~0_combout\ : std_logic;
SIGNAL \Init|ainv~combout\ : std_logic;
SIGNAL \Stage0|Step4|s~0_combout\ : std_logic;
SIGNAL \Init|op[1]~0_combout\ : std_logic;
SIGNAL \Init|comb~1_combout\ : std_logic;
SIGNAL \Init|comb~2_combout\ : std_logic;
SIGNAL \Init|Equal0~0_combout\ : std_logic;
SIGNAL \Init|cin~combout\ : std_logic;
SIGNAL \Stage0|Step6|Mux0~0_combout\ : std_logic;
SIGNAL \Init|comb~3_combout\ : std_logic;
SIGNAL \Init|comb~4_combout\ : std_logic;
SIGNAL \Init|binv~combout\ : std_logic;
SIGNAL \Stage0|Step6|Mux0~1_combout\ : std_logic;
SIGNAL \Stage0|Step6|Mux0~2_combout\ : std_logic;
SIGNAL \Stage0|Step4|cout~0_combout\ : std_logic;
SIGNAL \Stage1|Step6|Mux0~0_combout\ : std_logic;
SIGNAL \Stage1|Step4|s~0_combout\ : std_logic;
SIGNAL \Stage1|Step6|Mux0~1_combout\ : std_logic;
SIGNAL \Stage1|Step6|Mux0~2_combout\ : std_logic;
SIGNAL \Stage1|Step6|Mux0~3_combout\ : std_logic;
SIGNAL \Stage2|Step4|s~0_combout\ : std_logic;
SIGNAL \Stage1|Step4|cout~0_combout\ : std_logic;
SIGNAL \Stage2|Step6|Mux0~0_combout\ : std_logic;
SIGNAL \Stage2|Step6|Mux0~1_combout\ : std_logic;
SIGNAL \Stage2|Step6|Mux0~2_combout\ : std_logic;
SIGNAL \Stage2|Step4|cout~0_combout\ : std_logic;
SIGNAL \Stage3|Step6|Mux0~0_combout\ : std_logic;
SIGNAL \Stage3|Step4|s~0_combout\ : std_logic;
SIGNAL \Stage3|Step6|Mux0~2_combout\ : std_logic;
SIGNAL \Stage3|Step6|Mux0~1_combout\ : std_logic;
SIGNAL \Stage3|Step6|Mux0~3_combout\ : std_logic;
SIGNAL \Stage4|Step4|s~0_combout\ : std_logic;
SIGNAL \Stage3|Step4|cout~0_combout\ : std_logic;
SIGNAL \Stage4|Step6|Mux0~0_combout\ : std_logic;
SIGNAL \Stage4|Step6|Mux0~1_combout\ : std_logic;
SIGNAL \Stage4|Step6|Mux0~2_combout\ : std_logic;
SIGNAL \Stage5|Step4|s~0_combout\ : std_logic;
SIGNAL \Stage4|Step4|cout~0_combout\ : std_logic;
SIGNAL \Stage5|Step6|Mux0~0_combout\ : std_logic;
SIGNAL \Stage5|Step6|Mux0~2_combout\ : std_logic;
SIGNAL \Stage5|Step6|Mux0~1_combout\ : std_logic;
SIGNAL \Stage5|Step6|Mux0~3_combout\ : std_logic;
SIGNAL \Stage5|Step4|cout~0_combout\ : std_logic;
SIGNAL \Stage6|Step6|Mux0~0_combout\ : std_logic;
SIGNAL \Stage6|Step6|Mux0~1_combout\ : std_logic;
SIGNAL \Stage6|Step4|s~0_combout\ : std_logic;
SIGNAL \Stage6|Step6|Mux0~2_combout\ : std_logic;
SIGNAL \Stage6|Step4|cout~0_combout\ : std_logic;
SIGNAL \Stage7|Step6|Mux0~0_combout\ : std_logic;
SIGNAL \Stage7|Step4|s~0_combout\ : std_logic;
SIGNAL \Stage7|Step6|Mux0~2_combout\ : std_logic;
SIGNAL \Stage7|Step6|Mux0~1_combout\ : std_logic;
SIGNAL \Stage7|Step6|Mux0~3_combout\ : std_logic;
SIGNAL \Stage7|Step4|cout~0_combout\ : std_logic;
SIGNAL \Stage8|Step6|Mux0~0_combout\ : std_logic;
SIGNAL \Stage8|Step6|Mux0~1_combout\ : std_logic;
SIGNAL \Stage8|Step4|s~0_combout\ : std_logic;
SIGNAL \Stage8|Step6|Mux0~2_combout\ : std_logic;
SIGNAL \Stage8|Step4|cout~0_combout\ : std_logic;
SIGNAL \Stage9|Step6|Mux0~0_combout\ : std_logic;
SIGNAL \Stage9|Step4|s~0_combout\ : std_logic;
SIGNAL \Stage9|Step6|Mux0~1_combout\ : std_logic;
SIGNAL \Stage9|Step6|Mux0~2_combout\ : std_logic;
SIGNAL \Stage9|Step6|Mux0~3_combout\ : std_logic;
SIGNAL \Stage9|Step4|cout~0_combout\ : std_logic;
SIGNAL \Stage10|Step6|Mux0~0_combout\ : std_logic;
SIGNAL \Stage10|Step6|Mux0~1_combout\ : std_logic;
SIGNAL \Stage10|Step4|s~0_combout\ : std_logic;
SIGNAL \Stage10|Step6|Mux0~2_combout\ : std_logic;
SIGNAL \Stage11|Step4|s~0_combout\ : std_logic;
SIGNAL \Stage10|Step4|cout~0_combout\ : std_logic;
SIGNAL \Stage11|Step6|Mux0~0_combout\ : std_logic;
SIGNAL \Stage11|Step6|Mux0~1_combout\ : std_logic;
SIGNAL \Stage11|Step6|Mux0~2_combout\ : std_logic;
SIGNAL \Stage11|Step6|Mux0~3_combout\ : std_logic;
SIGNAL \Stage12|Step4|s~0_combout\ : std_logic;
SIGNAL \Stage11|Step4|cout~0_combout\ : std_logic;
SIGNAL \Stage12|Step6|Mux0~0_combout\ : std_logic;
SIGNAL \Stage12|Step6|Mux0~1_combout\ : std_logic;
SIGNAL \Stage12|Step6|Mux0~2_combout\ : std_logic;
SIGNAL \Stage12|Step4|cout~0_combout\ : std_logic;
SIGNAL \Stage13|Step6|Mux0~0_combout\ : std_logic;
SIGNAL \Stage13|Step4|s~0_combout\ : std_logic;
SIGNAL \Stage13|Step6|Mux0~2_combout\ : std_logic;
SIGNAL \Stage13|Step6|Mux0~1_combout\ : std_logic;
SIGNAL \Stage13|Step6|Mux0~3_combout\ : std_logic;
SIGNAL \Stage14|Step4|s~0_combout\ : std_logic;
SIGNAL \Stage13|Step4|cout~0_combout\ : std_logic;
SIGNAL \Stage14|Step6|Mux0~0_combout\ : std_logic;
SIGNAL \Stage14|Step6|Mux0~1_combout\ : std_logic;
SIGNAL \Stage14|Step6|Mux0~2_combout\ : std_logic;
SIGNAL \Stage15|Step6|Mux0~0_combout\ : std_logic;
SIGNAL \Stage14|Step4|cout~0_combout\ : std_logic;
SIGNAL \Stage15|Step6|Mux0~2_combout\ : std_logic;
SIGNAL \Stage15|Step6|Mux0~1_combout\ : std_logic;
SIGNAL \Stage15|Step6|Mux0~3_combout\ : std_logic;
SIGNAL \overflow~2_combout\ : std_logic;
SIGNAL \a~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \Init|op\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \b~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \opcode~combout\ : std_logic_vector(2 DOWNTO 0);

BEGIN

ww_a <= a;
ww_b <= b;
ww_opcode <= opcode;
res <= ww_res;
overflow <= ww_overflow;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_69,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\opcode[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_opcode(2),
	combout => \opcode~combout\(2));

-- Location: PIN_39,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\opcode[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_opcode(1),
	combout => \opcode~combout\(1));

-- Location: LC_X6_Y3_N1
\Init|binv~0\ : maxv_lcell
-- Equation(s):
-- \Init|binv~0_combout\ = ((\opcode~combout\(2) & (!\opcode~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0c0c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Init|binv~0_combout\);

-- Location: PIN_67,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\opcode[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_opcode(0),
	combout => \opcode~combout\(0));

-- Location: LC_X6_Y3_N5
\Init|comb~0\ : maxv_lcell
-- Equation(s):
-- \Init|comb~0_combout\ = (((\opcode~combout\(1) & !\opcode~combout\(0))) # (!\opcode~combout\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33f3",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	datad => \opcode~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Init|comb~0_combout\);

-- Location: LC_X6_Y3_N8
\Init|ainv\ : maxv_lcell
-- Equation(s):
-- \Init|ainv~combout\ = ((!\Init|comb~0_combout\ & ((\Init|binv~0_combout\) # (\Init|ainv~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f0c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Init|binv~0_combout\,
	datac => \Init|comb~0_combout\,
	datad => \Init|ainv~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Init|ainv~combout\);

-- Location: PIN_89,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(0),
	combout => \a~combout\(0));

-- Location: LC_X4_Y4_N5
\Stage0|Step4|s~0\ : maxv_lcell
-- Equation(s):
-- \Stage0|Step4|s~0_combout\ = (\Init|ainv~combout\ $ ((\a~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3c3c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Init|ainv~combout\,
	datac => \a~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage0|Step4|s~0_combout\);

-- Location: LC_X5_Y3_N7
\Init|op[1]~0\ : maxv_lcell
-- Equation(s):
-- \Init|op[1]~0_combout\ = (((!\opcode~combout\(0)) # (!\opcode~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0fff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \opcode~combout\(2),
	datad => \opcode~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Init|op[1]~0_combout\);

-- Location: LC_X5_Y3_N2
\Init|op[1]\ : maxv_lcell
-- Equation(s):
-- \Init|op\(1) = ((\opcode~combout\(1) & ((\Init|op[1]~0_combout\) # (\Init|op\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Init|op[1]~0_combout\,
	datac => \opcode~combout\(1),
	datad => \Init|op\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Init|op\(1));

-- Location: LC_X6_Y3_N4
\Init|comb~1\ : maxv_lcell
-- Equation(s):
-- \Init|comb~1_combout\ = ((\opcode~combout\(1) & (!\opcode~combout\(2))) # (!\opcode~combout\(1) & ((!\opcode~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "303f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	datad => \opcode~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Init|comb~1_combout\);

-- Location: LC_X5_Y3_N4
\Init|comb~2\ : maxv_lcell
-- Equation(s):
-- \Init|comb~2_combout\ = ((\opcode~combout\(1) & (\opcode~combout\(2) & !\opcode~combout\(0))) # (!\opcode~combout\(1) & ((\opcode~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0fc0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	datad => \opcode~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Init|comb~2_combout\);

-- Location: LC_X5_Y3_N9
\Init|op[0]\ : maxv_lcell
-- Equation(s):
-- \Init|op\(0) = ((!\Init|comb~1_combout\ & ((\Init|comb~2_combout\) # (\Init|op\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3330",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Init|comb~1_combout\,
	datac => \Init|comb~2_combout\,
	datad => \Init|op\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Init|op\(0));

-- Location: LC_X6_Y3_N7
\Init|Equal0~0\ : maxv_lcell
-- Equation(s):
-- \Init|Equal0~0_combout\ = (((\opcode~combout\(1) & \opcode~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \opcode~combout\(1),
	datad => \opcode~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Init|Equal0~0_combout\);

-- Location: LC_X6_Y3_N9
\Init|cin\ : maxv_lcell
-- Equation(s):
-- \Init|cin~combout\ = ((\Init|Equal0~0_combout\ & ((\Init|cin~combout\) # (!\opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f030",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(2),
	datac => \Init|Equal0~0_combout\,
	datad => \Init|cin~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Init|cin~combout\);

-- Location: LC_X6_Y4_N5
\Stage0|Step6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \Stage0|Step6|Mux0~0_combout\ = (\Init|op\(0) & (\Init|ainv~combout\ $ (((\a~combout\(0)))))) # (!\Init|op\(0) & (((\Init|cin~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5cac",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|ainv~combout\,
	datab => \Init|cin~combout\,
	datac => \Init|op\(0),
	datad => \a~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage0|Step6|Mux0~0_combout\);

-- Location: LC_X6_Y3_N3
\Init|comb~3\ : maxv_lcell
-- Equation(s):
-- \Init|comb~3_combout\ = ((\opcode~combout\(1) & ((!\opcode~combout\(0)))) # (!\opcode~combout\(1) & (!\opcode~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "03f3",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	datad => \opcode~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Init|comb~3_combout\);

-- Location: LC_X6_Y3_N6
\Init|comb~4\ : maxv_lcell
-- Equation(s):
-- \Init|comb~4_combout\ = ((\opcode~combout\(2) & (!\opcode~combout\(1))) # (!\opcode~combout\(2) & (\opcode~combout\(1) & \opcode~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3c0c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	datad => \opcode~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Init|comb~4_combout\);

-- Location: LC_X6_Y3_N2
\Init|binv\ : maxv_lcell
-- Equation(s):
-- \Init|binv~combout\ = (!\Init|comb~3_combout\ & (((\Init|comb~4_combout\) # (\Init|binv~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5550",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|comb~3_combout\,
	datac => \Init|comb~4_combout\,
	datad => \Init|binv~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Init|binv~combout\);

-- Location: PIN_82,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(0),
	combout => \b~combout\(0));

-- Location: LC_X6_Y4_N2
\Stage0|Step6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \Stage0|Step6|Mux0~1_combout\ = \Init|binv~combout\ $ (\b~combout\(0) $ (((\Stage0|Step6|Mux0~0_combout\ & \Init|op\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8778",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage0|Step6|Mux0~0_combout\,
	datab => \Init|op\(1),
	datac => \Init|binv~combout\,
	datad => \b~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage0|Step6|Mux0~1_combout\);

-- Location: LC_X6_Y4_N0
\Stage0|Step6|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \Stage0|Step6|Mux0~2_combout\ = (\Stage0|Step6|Mux0~1_combout\ & ((\Init|op\(0)) # (\Stage0|Step4|s~0_combout\ $ (\Init|op\(1))))) # (!\Stage0|Step6|Mux0~1_combout\ & (\Stage0|Step4|s~0_combout\ & (\Init|op\(1) $ (\Init|op\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f628",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage0|Step4|s~0_combout\,
	datab => \Init|op\(1),
	datac => \Init|op\(0),
	datad => \Stage0|Step6|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage0|Step6|Mux0~2_combout\);

-- Location: LC_X6_Y4_N9
\Stage0|Step4|cout~0\ : maxv_lcell
-- Equation(s):
-- \Stage0|Step4|cout~0_combout\ = (\Stage0|Step4|s~0_combout\ & ((\Init|cin~combout\) # (\Init|binv~combout\ $ (\b~combout\(0))))) # (!\Stage0|Step4|s~0_combout\ & (\Init|cin~combout\ & (\Init|binv~combout\ $ (\b~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8ee8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage0|Step4|s~0_combout\,
	datab => \Init|cin~combout\,
	datac => \Init|binv~combout\,
	datad => \b~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage0|Step4|cout~0_combout\);

-- Location: PIN_71,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(1),
	combout => \a~combout\(1));

-- Location: LC_X6_Y4_N4
\Stage1|Step6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \Stage1|Step6|Mux0~0_combout\ = (\Init|op\(1) & (\Stage0|Step4|cout~0_combout\)) # (!\Init|op\(1) & ((\Init|ainv~combout\ $ (\a~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8dd8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|op\(1),
	datab => \Stage0|Step4|cout~0_combout\,
	datac => \Init|ainv~combout\,
	datad => \a~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage1|Step6|Mux0~0_combout\);

-- Location: LC_X6_Y4_N8
\Stage1|Step4|s~0\ : maxv_lcell
-- Equation(s):
-- \Stage1|Step4|s~0_combout\ = ((\Init|ainv~combout\ $ (\a~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \Init|ainv~combout\,
	datad => \a~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage1|Step4|s~0_combout\);

-- Location: LC_X6_Y4_N6
\Stage1|Step6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \Stage1|Step6|Mux0~1_combout\ = (\Init|op\(1)) # ((\Init|op\(0) & ((!\Stage1|Step4|s~0_combout\))) # (!\Init|op\(0) & (\Stage1|Step6|Mux0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cefe",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage1|Step6|Mux0~0_combout\,
	datab => \Init|op\(1),
	datac => \Init|op\(0),
	datad => \Stage1|Step4|s~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage1|Step6|Mux0~1_combout\);

-- Location: LC_X6_Y4_N1
\Stage1|Step6|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \Stage1|Step6|Mux0~2_combout\ = (\Init|op\(0) & (((\Stage1|Step4|s~0_combout\)))) # (!\Init|op\(0) & (\Init|op\(1) & (\Stage1|Step6|Mux0~0_combout\ $ (\Stage1|Step4|s~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f408",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage1|Step6|Mux0~0_combout\,
	datab => \Init|op\(1),
	datac => \Init|op\(0),
	datad => \Stage1|Step4|s~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage1|Step6|Mux0~2_combout\);

-- Location: PIN_75,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(1),
	combout => \b~combout\(1));

-- Location: LC_X6_Y4_N3
\Stage1|Step6|Mux0~3\ : maxv_lcell
-- Equation(s):
-- \Stage1|Step6|Mux0~3_combout\ = \Stage1|Step6|Mux0~2_combout\ $ (((\Stage1|Step6|Mux0~1_combout\ & (\Init|binv~combout\ $ (\b~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c66c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage1|Step6|Mux0~1_combout\,
	datab => \Stage1|Step6|Mux0~2_combout\,
	datac => \Init|binv~combout\,
	datad => \b~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage1|Step6|Mux0~3_combout\);

-- Location: PIN_37,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(2),
	combout => \a~combout\(2));

-- Location: LC_X4_Y3_N7
\Stage2|Step4|s~0\ : maxv_lcell
-- Equation(s):
-- \Stage2|Step4|s~0_combout\ = (\Init|ainv~combout\ $ ((\a~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3c3c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Init|ainv~combout\,
	datac => \a~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage2|Step4|s~0_combout\);

-- Location: LC_X6_Y4_N7
\Stage1|Step4|cout~0\ : maxv_lcell
-- Equation(s):
-- \Stage1|Step4|cout~0_combout\ = (\Stage1|Step4|s~0_combout\ & ((\Stage0|Step4|cout~0_combout\) # (\Init|binv~combout\ $ (\b~combout\(1))))) # (!\Stage1|Step4|s~0_combout\ & (\Stage0|Step4|cout~0_combout\ & (\Init|binv~combout\ $ (\b~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8ee8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage1|Step4|s~0_combout\,
	datab => \Stage0|Step4|cout~0_combout\,
	datac => \Init|binv~combout\,
	datad => \b~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage1|Step4|cout~0_combout\);

-- Location: LC_X4_Y3_N9
\Stage2|Step6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \Stage2|Step6|Mux0~0_combout\ = (\Init|op\(0) & (\a~combout\(2) $ (((\Init|ainv~combout\))))) # (!\Init|op\(0) & (((\Stage1|Step4|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "74b8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \a~combout\(2),
	datab => \Init|op\(0),
	datac => \Stage1|Step4|cout~0_combout\,
	datad => \Init|ainv~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage2|Step6|Mux0~0_combout\);

-- Location: PIN_61,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(2),
	combout => \b~combout\(2));

-- Location: LC_X4_Y3_N2
\Stage2|Step6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \Stage2|Step6|Mux0~1_combout\ = \Init|binv~combout\ $ (\b~combout\(2) $ (((\Stage2|Step6|Mux0~0_combout\ & \Init|op\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "956a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|binv~combout\,
	datab => \Stage2|Step6|Mux0~0_combout\,
	datac => \Init|op\(1),
	datad => \b~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage2|Step6|Mux0~1_combout\);

-- Location: LC_X4_Y3_N3
\Stage2|Step6|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \Stage2|Step6|Mux0~2_combout\ = (\Stage2|Step6|Mux0~1_combout\ & ((\Init|op\(0)) # (\Init|op\(1) $ (\Stage2|Step4|s~0_combout\)))) # (!\Stage2|Step6|Mux0~1_combout\ & (\Stage2|Step4|s~0_combout\ & (\Init|op\(1) $ (\Init|op\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "de60",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|op\(1),
	datab => \Init|op\(0),
	datac => \Stage2|Step4|s~0_combout\,
	datad => \Stage2|Step6|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage2|Step6|Mux0~2_combout\);

-- Location: PIN_42,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(3),
	combout => \b~combout\(3));

-- Location: LC_X4_Y3_N0
\Stage2|Step4|cout~0\ : maxv_lcell
-- Equation(s):
-- \Stage2|Step4|cout~0_combout\ = (\Stage1|Step4|cout~0_combout\ & ((\Stage2|Step4|s~0_combout\) # (\Init|binv~combout\ $ (\b~combout\(2))))) # (!\Stage1|Step4|cout~0_combout\ & (\Stage2|Step4|s~0_combout\ & (\Init|binv~combout\ $ (\b~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b2e8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage1|Step4|cout~0_combout\,
	datab => \Init|binv~combout\,
	datac => \Stage2|Step4|s~0_combout\,
	datad => \b~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage2|Step4|cout~0_combout\);

-- Location: PIN_40,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(3),
	combout => \a~combout\(3));

-- Location: LC_X5_Y2_N9
\Stage3|Step6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \Stage3|Step6|Mux0~0_combout\ = (\Init|op\(1) & (((\Stage2|Step4|cout~0_combout\)))) # (!\Init|op\(1) & (\Init|ainv~combout\ $ (((\a~combout\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c5ca",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|ainv~combout\,
	datab => \Stage2|Step4|cout~0_combout\,
	datac => \Init|op\(1),
	datad => \a~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage3|Step6|Mux0~0_combout\);

-- Location: LC_X5_Y2_N2
\Stage3|Step4|s~0\ : maxv_lcell
-- Equation(s):
-- \Stage3|Step4|s~0_combout\ = \Init|ainv~combout\ $ ((((\a~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "55aa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|ainv~combout\,
	datad => \a~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage3|Step4|s~0_combout\);

-- Location: LC_X5_Y2_N5
\Stage3|Step6|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \Stage3|Step6|Mux0~2_combout\ = (\Init|op\(0) & (((\Stage3|Step4|s~0_combout\)))) # (!\Init|op\(0) & (\Init|op\(1) & (\Stage3|Step6|Mux0~0_combout\ $ (\Stage3|Step4|s~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ba40",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|op\(0),
	datab => \Stage3|Step6|Mux0~0_combout\,
	datac => \Init|op\(1),
	datad => \Stage3|Step4|s~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage3|Step6|Mux0~2_combout\);

-- Location: LC_X5_Y2_N8
\Stage3|Step6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \Stage3|Step6|Mux0~1_combout\ = (\Init|op\(1)) # ((\Init|op\(0) & ((!\Stage3|Step4|s~0_combout\))) # (!\Init|op\(0) & (\Stage3|Step6|Mux0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f4fe",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|op\(0),
	datab => \Stage3|Step6|Mux0~0_combout\,
	datac => \Init|op\(1),
	datad => \Stage3|Step4|s~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage3|Step6|Mux0~1_combout\);

-- Location: LC_X5_Y2_N4
\Stage3|Step6|Mux0~3\ : maxv_lcell
-- Equation(s):
-- \Stage3|Step6|Mux0~3_combout\ = \Stage3|Step6|Mux0~2_combout\ $ (((\Stage3|Step6|Mux0~1_combout\ & (\Init|binv~combout\ $ (\b~combout\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "96f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|binv~combout\,
	datab => \b~combout\(3),
	datac => \Stage3|Step6|Mux0~2_combout\,
	datad => \Stage3|Step6|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage3|Step6|Mux0~3_combout\);

-- Location: PIN_14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(4),
	combout => \a~combout\(4));

-- Location: LC_X2_Y2_N2
\Stage4|Step4|s~0\ : maxv_lcell
-- Equation(s):
-- \Stage4|Step4|s~0_combout\ = (\Init|ainv~combout\ $ (((\a~combout\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Init|ainv~combout\,
	datad => \a~combout\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage4|Step4|s~0_combout\);

-- Location: PIN_18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(4),
	combout => \b~combout\(4));

-- Location: LC_X5_Y2_N6
\Stage3|Step4|cout~0\ : maxv_lcell
-- Equation(s):
-- \Stage3|Step4|cout~0_combout\ = (\Stage2|Step4|cout~0_combout\ & ((\Stage3|Step4|s~0_combout\) # (\Init|binv~combout\ $ (\b~combout\(3))))) # (!\Stage2|Step4|cout~0_combout\ & (\Stage3|Step4|s~0_combout\ & (\Init|binv~combout\ $ (\b~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "de48",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|binv~combout\,
	datab => \Stage2|Step4|cout~0_combout\,
	datac => \b~combout\(3),
	datad => \Stage3|Step4|s~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage3|Step4|cout~0_combout\);

-- Location: LC_X3_Y2_N2
\Stage4|Step6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \Stage4|Step6|Mux0~0_combout\ = (\Init|op\(0) & (\Init|ainv~combout\ $ ((\a~combout\(4))))) # (!\Init|op\(0) & (((\Stage3|Step4|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7b48",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|ainv~combout\,
	datab => \Init|op\(0),
	datac => \a~combout\(4),
	datad => \Stage3|Step4|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage4|Step6|Mux0~0_combout\);

-- Location: LC_X2_Y2_N0
\Stage4|Step6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \Stage4|Step6|Mux0~1_combout\ = \Init|binv~combout\ $ (\b~combout\(4) $ (((\Stage4|Step6|Mux0~0_combout\ & \Init|op\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9666",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|binv~combout\,
	datab => \b~combout\(4),
	datac => \Stage4|Step6|Mux0~0_combout\,
	datad => \Init|op\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage4|Step6|Mux0~1_combout\);

-- Location: LC_X2_Y2_N3
\Stage4|Step6|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \Stage4|Step6|Mux0~2_combout\ = (\Stage4|Step6|Mux0~1_combout\ & ((\Init|op\(0)) # (\Stage4|Step4|s~0_combout\ $ (\Init|op\(1))))) # (!\Stage4|Step6|Mux0~1_combout\ & (\Stage4|Step4|s~0_combout\ & (\Init|op\(0) $ (\Init|op\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b4e8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|op\(0),
	datab => \Stage4|Step4|s~0_combout\,
	datac => \Stage4|Step6|Mux0~1_combout\,
	datad => \Init|op\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage4|Step6|Mux0~2_combout\);

-- Location: PIN_17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(5),
	combout => \a~combout\(5));

-- Location: LC_X2_Y2_N4
\Stage5|Step4|s~0\ : maxv_lcell
-- Equation(s):
-- \Stage5|Step4|s~0_combout\ = (\Init|ainv~combout\ $ ((\a~combout\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3c3c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Init|ainv~combout\,
	datac => \a~combout\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage5|Step4|s~0_combout\);

-- Location: LC_X2_Y2_N1
\Stage4|Step4|cout~0\ : maxv_lcell
-- Equation(s):
-- \Stage4|Step4|cout~0_combout\ = (\Stage3|Step4|cout~0_combout\ & ((\Stage4|Step4|s~0_combout\) # (\b~combout\(4) $ (\Init|binv~combout\)))) # (!\Stage3|Step4|cout~0_combout\ & (\Stage4|Step4|s~0_combout\ & (\b~combout\(4) $ (\Init|binv~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "be28",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage3|Step4|cout~0_combout\,
	datab => \b~combout\(4),
	datac => \Init|binv~combout\,
	datad => \Stage4|Step4|s~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage4|Step4|cout~0_combout\);

-- Location: LC_X2_Y2_N9
\Stage5|Step6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \Stage5|Step6|Mux0~0_combout\ = (\Init|op\(1) & (((\Stage4|Step4|cout~0_combout\)))) # (!\Init|op\(1) & (\a~combout\(5) $ ((\Init|ainv~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f606",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \a~combout\(5),
	datab => \Init|ainv~combout\,
	datac => \Init|op\(1),
	datad => \Stage4|Step4|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage5|Step6|Mux0~0_combout\);

-- Location: LC_X2_Y2_N6
\Stage5|Step6|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \Stage5|Step6|Mux0~2_combout\ = (\Init|op\(0) & (((\Stage5|Step4|s~0_combout\)))) # (!\Init|op\(0) & (\Init|op\(1) & (\Stage5|Step4|s~0_combout\ $ (\Stage5|Step6|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a4e0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|op\(0),
	datab => \Init|op\(1),
	datac => \Stage5|Step4|s~0_combout\,
	datad => \Stage5|Step6|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage5|Step6|Mux0~2_combout\);

-- Location: PIN_16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(5),
	combout => \b~combout\(5));

-- Location: LC_X2_Y2_N8
\Stage5|Step6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \Stage5|Step6|Mux0~1_combout\ = (\Init|op\(1)) # ((\Init|op\(0) & (!\Stage5|Step4|s~0_combout\)) # (!\Init|op\(0) & ((\Stage5|Step6|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "dfce",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|op\(0),
	datab => \Init|op\(1),
	datac => \Stage5|Step4|s~0_combout\,
	datad => \Stage5|Step6|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage5|Step6|Mux0~1_combout\);

-- Location: LC_X2_Y2_N7
\Stage5|Step6|Mux0~3\ : maxv_lcell
-- Equation(s):
-- \Stage5|Step6|Mux0~3_combout\ = \Stage5|Step6|Mux0~2_combout\ $ (((\Stage5|Step6|Mux0~1_combout\ & (\b~combout\(5) $ (\Init|binv~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "96aa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage5|Step6|Mux0~2_combout\,
	datab => \b~combout\(5),
	datac => \Init|binv~combout\,
	datad => \Stage5|Step6|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage5|Step6|Mux0~3_combout\);

-- Location: PIN_3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(6),
	combout => \b~combout\(6));

-- Location: PIN_99,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(6),
	combout => \a~combout\(6));

-- Location: LC_X2_Y2_N5
\Stage5|Step4|cout~0\ : maxv_lcell
-- Equation(s):
-- \Stage5|Step4|cout~0_combout\ = (\Stage5|Step4|s~0_combout\ & ((\Stage4|Step4|cout~0_combout\) # (\b~combout\(5) $ (\Init|binv~combout\)))) # (!\Stage5|Step4|s~0_combout\ & (\Stage4|Step4|cout~0_combout\ & (\b~combout\(5) $ (\Init|binv~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "be28",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage5|Step4|s~0_combout\,
	datab => \b~combout\(5),
	datac => \Init|binv~combout\,
	datad => \Stage4|Step4|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage5|Step4|cout~0_combout\);

-- Location: LC_X2_Y4_N1
\Stage6|Step6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \Stage6|Step6|Mux0~0_combout\ = (\Init|op\(0) & (\Init|ainv~combout\ $ ((\a~combout\(6))))) # (!\Init|op\(0) & (((\Stage5|Step4|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7d28",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|op\(0),
	datab => \Init|ainv~combout\,
	datac => \a~combout\(6),
	datad => \Stage5|Step4|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage6|Step6|Mux0~0_combout\);

-- Location: LC_X2_Y4_N6
\Stage6|Step6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \Stage6|Step6|Mux0~1_combout\ = \Init|binv~combout\ $ (\b~combout\(6) $ (((\Init|op\(1) & \Stage6|Step6|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "965a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|binv~combout\,
	datab => \Init|op\(1),
	datac => \b~combout\(6),
	datad => \Stage6|Step6|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage6|Step6|Mux0~1_combout\);

-- Location: LC_X4_Y4_N4
\Stage6|Step4|s~0\ : maxv_lcell
-- Equation(s):
-- \Stage6|Step4|s~0_combout\ = (\Init|ainv~combout\ $ (((\a~combout\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Init|ainv~combout\,
	datad => \a~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage6|Step4|s~0_combout\);

-- Location: LC_X2_Y4_N9
\Stage6|Step6|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \Stage6|Step6|Mux0~2_combout\ = (\Stage6|Step6|Mux0~1_combout\ & ((\Init|op\(0)) # (\Init|op\(1) $ (\Stage6|Step4|s~0_combout\)))) # (!\Stage6|Step6|Mux0~1_combout\ & (\Stage6|Step4|s~0_combout\ & (\Init|op\(0) $ (\Init|op\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b6e0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|op\(0),
	datab => \Init|op\(1),
	datac => \Stage6|Step6|Mux0~1_combout\,
	datad => \Stage6|Step4|s~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage6|Step6|Mux0~2_combout\);

-- Location: LC_X2_Y4_N8
\Stage6|Step4|cout~0\ : maxv_lcell
-- Equation(s):
-- \Stage6|Step4|cout~0_combout\ = (\Stage5|Step4|cout~0_combout\ & ((\Stage6|Step4|s~0_combout\) # (\Init|binv~combout\ $ (\b~combout\(6))))) # (!\Stage5|Step4|cout~0_combout\ & (\Stage6|Step4|s~0_combout\ & (\Init|binv~combout\ $ (\b~combout\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "de48",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|binv~combout\,
	datab => \Stage5|Step4|cout~0_combout\,
	datac => \b~combout\(6),
	datad => \Stage6|Step4|s~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage6|Step4|cout~0_combout\);

-- Location: PIN_100,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(7),
	combout => \a~combout\(7));

-- Location: LC_X2_Y4_N7
\Stage7|Step6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \Stage7|Step6|Mux0~0_combout\ = (\Init|op\(1) & (\Stage6|Step4|cout~0_combout\)) # (!\Init|op\(1) & ((\Init|ainv~combout\ $ (\a~combout\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a3ac",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage6|Step4|cout~0_combout\,
	datab => \Init|ainv~combout\,
	datac => \Init|op\(1),
	datad => \a~combout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage7|Step6|Mux0~0_combout\);

-- Location: LC_X2_Y4_N4
\Stage7|Step4|s~0\ : maxv_lcell
-- Equation(s):
-- \Stage7|Step4|s~0_combout\ = (\Init|ainv~combout\ $ (((\a~combout\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Init|ainv~combout\,
	datad => \a~combout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage7|Step4|s~0_combout\);

-- Location: LC_X2_Y4_N3
\Stage7|Step6|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \Stage7|Step6|Mux0~2_combout\ = (\Init|op\(0) & (((\Stage7|Step4|s~0_combout\)))) # (!\Init|op\(0) & (\Init|op\(1) & (\Stage7|Step6|Mux0~0_combout\ $ (\Stage7|Step4|s~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b4a0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|op\(0),
	datab => \Stage7|Step6|Mux0~0_combout\,
	datac => \Stage7|Step4|s~0_combout\,
	datad => \Init|op\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage7|Step6|Mux0~2_combout\);

-- Location: LC_X2_Y4_N0
\Stage7|Step6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \Stage7|Step6|Mux0~1_combout\ = (\Init|op\(1)) # ((\Init|op\(0) & ((!\Stage7|Step4|s~0_combout\))) # (!\Init|op\(0) & (\Stage7|Step6|Mux0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff4e",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|op\(0),
	datab => \Stage7|Step6|Mux0~0_combout\,
	datac => \Stage7|Step4|s~0_combout\,
	datad => \Init|op\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage7|Step6|Mux0~1_combout\);

-- Location: PIN_98,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(7),
	combout => \b~combout\(7));

-- Location: LC_X2_Y4_N2
\Stage7|Step6|Mux0~3\ : maxv_lcell
-- Equation(s):
-- \Stage7|Step6|Mux0~3_combout\ = \Stage7|Step6|Mux0~2_combout\ $ (((\Stage7|Step6|Mux0~1_combout\ & (\Init|binv~combout\ $ (\b~combout\(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a66a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage7|Step6|Mux0~2_combout\,
	datab => \Stage7|Step6|Mux0~1_combout\,
	datac => \Init|binv~combout\,
	datad => \b~combout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage7|Step6|Mux0~3_combout\);

-- Location: PIN_38,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[8]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(8),
	combout => \b~combout\(8));

-- Location: LC_X2_Y4_N5
\Stage7|Step4|cout~0\ : maxv_lcell
-- Equation(s):
-- \Stage7|Step4|cout~0_combout\ = (\Stage6|Step4|cout~0_combout\ & ((\Stage7|Step4|s~0_combout\) # (\b~combout\(7) $ (\Init|binv~combout\)))) # (!\Stage6|Step4|cout~0_combout\ & (\Stage7|Step4|s~0_combout\ & (\b~combout\(7) $ (\Init|binv~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "be28",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage6|Step4|cout~0_combout\,
	datab => \b~combout\(7),
	datac => \Init|binv~combout\,
	datad => \Stage7|Step4|s~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage7|Step4|cout~0_combout\);

-- Location: PIN_91,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[8]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(8),
	combout => \a~combout\(8));

-- Location: LC_X4_Y3_N8
\Stage8|Step6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \Stage8|Step6|Mux0~0_combout\ = (\Init|op\(0) & ((\Init|ainv~combout\ $ (\a~combout\(8))))) # (!\Init|op\(0) & (\Stage7|Step4|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3aca",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage7|Step4|cout~0_combout\,
	datab => \Init|ainv~combout\,
	datac => \Init|op\(0),
	datad => \a~combout\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage8|Step6|Mux0~0_combout\);

-- Location: LC_X4_Y3_N6
\Stage8|Step6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \Stage8|Step6|Mux0~1_combout\ = \b~combout\(8) $ (\Init|binv~combout\ $ (((\Init|op\(1) & \Stage8|Step6|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9666",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b~combout\(8),
	datab => \Init|binv~combout\,
	datac => \Init|op\(1),
	datad => \Stage8|Step6|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage8|Step6|Mux0~1_combout\);

-- Location: LC_X4_Y3_N1
\Stage8|Step4|s~0\ : maxv_lcell
-- Equation(s):
-- \Stage8|Step4|s~0_combout\ = (\Init|ainv~combout\ $ (((\a~combout\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Init|ainv~combout\,
	datad => \a~combout\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage8|Step4|s~0_combout\);

-- Location: LC_X4_Y3_N5
\Stage8|Step6|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \Stage8|Step6|Mux0~2_combout\ = (\Stage8|Step6|Mux0~1_combout\ & ((\Init|op\(0)) # (\Init|op\(1) $ (\Stage8|Step4|s~0_combout\)))) # (!\Stage8|Step6|Mux0~1_combout\ & (\Stage8|Step4|s~0_combout\ & (\Init|op\(0) $ (\Init|op\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9ea8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage8|Step6|Mux0~1_combout\,
	datab => \Init|op\(0),
	datac => \Init|op\(1),
	datad => \Stage8|Step4|s~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage8|Step6|Mux0~2_combout\);

-- Location: LC_X4_Y3_N4
\Stage8|Step4|cout~0\ : maxv_lcell
-- Equation(s):
-- \Stage8|Step4|cout~0_combout\ = (\Stage8|Step4|s~0_combout\ & ((\Stage7|Step4|cout~0_combout\) # (\b~combout\(8) $ (\Init|binv~combout\)))) # (!\Stage8|Step4|s~0_combout\ & (\Stage7|Step4|cout~0_combout\ & (\b~combout\(8) $ (\Init|binv~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f660",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b~combout\(8),
	datab => \Init|binv~combout\,
	datac => \Stage8|Step4|s~0_combout\,
	datad => \Stage7|Step4|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage8|Step4|cout~0_combout\);

-- Location: PIN_87,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[9]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(9),
	combout => \a~combout\(9));

-- Location: LC_X5_Y3_N3
\Stage9|Step6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \Stage9|Step6|Mux0~0_combout\ = (\Init|op\(1) & (\Stage8|Step4|cout~0_combout\)) # (!\Init|op\(1) & ((\Init|ainv~combout\ $ (\a~combout\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a3ac",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage8|Step4|cout~0_combout\,
	datab => \Init|ainv~combout\,
	datac => \Init|op\(1),
	datad => \a~combout\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage9|Step6|Mux0~0_combout\);

-- Location: LC_X5_Y3_N5
\Stage9|Step4|s~0\ : maxv_lcell
-- Equation(s):
-- \Stage9|Step4|s~0_combout\ = (\Init|ainv~combout\ $ (((\a~combout\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Init|ainv~combout\,
	datad => \a~combout\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage9|Step4|s~0_combout\);

-- Location: LC_X5_Y3_N6
\Stage9|Step6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \Stage9|Step6|Mux0~1_combout\ = (\Init|op\(1)) # ((\Init|op\(0) & ((!\Stage9|Step4|s~0_combout\))) # (!\Init|op\(0) & (\Stage9|Step6|Mux0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff2e",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage9|Step6|Mux0~0_combout\,
	datab => \Init|op\(0),
	datac => \Stage9|Step4|s~0_combout\,
	datad => \Init|op\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage9|Step6|Mux0~1_combout\);

-- Location: LC_X5_Y3_N0
\Stage9|Step6|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \Stage9|Step6|Mux0~2_combout\ = (\Init|op\(0) & (((\Stage9|Step4|s~0_combout\)))) # (!\Init|op\(0) & (\Init|op\(1) & (\Stage9|Step6|Mux0~0_combout\ $ (\Stage9|Step4|s~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d2c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage9|Step6|Mux0~0_combout\,
	datab => \Init|op\(0),
	datac => \Stage9|Step4|s~0_combout\,
	datad => \Init|op\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage9|Step6|Mux0~2_combout\);

-- Location: PIN_68,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[9]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(9),
	combout => \b~combout\(9));

-- Location: LC_X5_Y3_N1
\Stage9|Step6|Mux0~3\ : maxv_lcell
-- Equation(s):
-- \Stage9|Step6|Mux0~3_combout\ = \Stage9|Step6|Mux0~2_combout\ $ (((\Stage9|Step6|Mux0~1_combout\ & (\Init|binv~combout\ $ (\b~combout\(9))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c66c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage9|Step6|Mux0~1_combout\,
	datab => \Stage9|Step6|Mux0~2_combout\,
	datac => \Init|binv~combout\,
	datad => \b~combout\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage9|Step6|Mux0~3_combout\);

-- Location: LC_X5_Y3_N8
\Stage9|Step4|cout~0\ : maxv_lcell
-- Equation(s):
-- \Stage9|Step4|cout~0_combout\ = (\Stage9|Step4|s~0_combout\ & ((\Stage8|Step4|cout~0_combout\) # (\Init|binv~combout\ $ (\b~combout\(9))))) # (!\Stage9|Step4|s~0_combout\ & (\Stage8|Step4|cout~0_combout\ & (\Init|binv~combout\ $ (\b~combout\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8ee8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage9|Step4|s~0_combout\,
	datab => \Stage8|Step4|cout~0_combout\,
	datac => \Init|binv~combout\,
	datad => \b~combout\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage9|Step4|cout~0_combout\);

-- Location: PIN_86,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[10]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(10),
	combout => \a~combout\(10));

-- Location: LC_X5_Y4_N1
\Stage10|Step6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \Stage10|Step6|Mux0~0_combout\ = (\Init|op\(0) & (\Init|ainv~combout\ $ (((\a~combout\(10)))))) # (!\Init|op\(0) & (((\Stage9|Step4|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5cac",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|ainv~combout\,
	datab => \Stage9|Step4|cout~0_combout\,
	datac => \Init|op\(0),
	datad => \a~combout\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage10|Step6|Mux0~0_combout\);

-- Location: PIN_85,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[10]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(10),
	combout => \b~combout\(10));

-- Location: LC_X5_Y4_N3
\Stage10|Step6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \Stage10|Step6|Mux0~1_combout\ = \Init|binv~combout\ $ (\b~combout\(10) $ (((\Stage10|Step6|Mux0~0_combout\ & \Init|op\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "965a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|binv~combout\,
	datab => \Stage10|Step6|Mux0~0_combout\,
	datac => \b~combout\(10),
	datad => \Init|op\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage10|Step6|Mux0~1_combout\);

-- Location: LC_X5_Y4_N8
\Stage10|Step4|s~0\ : maxv_lcell
-- Equation(s):
-- \Stage10|Step4|s~0_combout\ = \Init|ainv~combout\ $ ((((\a~combout\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "55aa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|ainv~combout\,
	datad => \a~combout\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage10|Step4|s~0_combout\);

-- Location: LC_X5_Y4_N5
\Stage10|Step6|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \Stage10|Step6|Mux0~2_combout\ = (\Stage10|Step6|Mux0~1_combout\ & ((\Init|op\(0)) # (\Init|op\(1) $ (\Stage10|Step4|s~0_combout\)))) # (!\Stage10|Step6|Mux0~1_combout\ & (\Stage10|Step4|s~0_combout\ & (\Init|op\(0) $ (\Init|op\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9ea8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage10|Step6|Mux0~1_combout\,
	datab => \Init|op\(0),
	datac => \Init|op\(1),
	datad => \Stage10|Step4|s~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage10|Step6|Mux0~2_combout\);

-- Location: PIN_88,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[11]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(11),
	combout => \a~combout\(11));

-- Location: LC_X5_Y2_N7
\Stage11|Step4|s~0\ : maxv_lcell
-- Equation(s):
-- \Stage11|Step4|s~0_combout\ = ((\a~combout\(11) $ (\Init|ainv~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \a~combout\(11),
	datad => \Init|ainv~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage11|Step4|s~0_combout\);

-- Location: LC_X5_Y4_N0
\Stage10|Step4|cout~0\ : maxv_lcell
-- Equation(s):
-- \Stage10|Step4|cout~0_combout\ = (\Stage9|Step4|cout~0_combout\ & ((\Stage10|Step4|s~0_combout\) # (\Init|binv~combout\ $ (\b~combout\(10))))) # (!\Stage9|Step4|cout~0_combout\ & (\Stage10|Step4|s~0_combout\ & (\Init|binv~combout\ $ (\b~combout\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "de48",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|binv~combout\,
	datab => \Stage9|Step4|cout~0_combout\,
	datac => \b~combout\(10),
	datad => \Stage10|Step4|s~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage10|Step4|cout~0_combout\);

-- Location: LC_X5_Y4_N2
\Stage11|Step6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \Stage11|Step6|Mux0~0_combout\ = (\Init|op\(1) & (((\Stage10|Step4|cout~0_combout\)))) # (!\Init|op\(1) & (\Init|ainv~combout\ $ (((\a~combout\(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c5ca",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|ainv~combout\,
	datab => \Stage10|Step4|cout~0_combout\,
	datac => \Init|op\(1),
	datad => \a~combout\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage11|Step6|Mux0~0_combout\);

-- Location: LC_X5_Y4_N9
\Stage11|Step6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \Stage11|Step6|Mux0~1_combout\ = (\Init|op\(1)) # ((\Init|op\(0) & (!\Stage11|Step4|s~0_combout\)) # (!\Init|op\(0) & ((\Stage11|Step6|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f7f4",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage11|Step4|s~0_combout\,
	datab => \Init|op\(0),
	datac => \Init|op\(1),
	datad => \Stage11|Step6|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage11|Step6|Mux0~1_combout\);

-- Location: LC_X5_Y4_N4
\Stage11|Step6|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \Stage11|Step6|Mux0~2_combout\ = (\Init|op\(0) & (\Stage11|Step4|s~0_combout\)) # (!\Init|op\(0) & (\Init|op\(1) & (\Stage11|Step4|s~0_combout\ $ (\Stage11|Step6|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "98a8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage11|Step4|s~0_combout\,
	datab => \Init|op\(0),
	datac => \Init|op\(1),
	datad => \Stage11|Step6|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage11|Step6|Mux0~2_combout\);

-- Location: PIN_83,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[11]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(11),
	combout => \b~combout\(11));

-- Location: LC_X5_Y4_N6
\Stage11|Step6|Mux0~3\ : maxv_lcell
-- Equation(s):
-- \Stage11|Step6|Mux0~3_combout\ = \Stage11|Step6|Mux0~2_combout\ $ (((\Stage11|Step6|Mux0~1_combout\ & (\Init|binv~combout\ $ (\b~combout\(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b478",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|binv~combout\,
	datab => \Stage11|Step6|Mux0~1_combout\,
	datac => \Stage11|Step6|Mux0~2_combout\,
	datad => \b~combout\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage11|Step6|Mux0~3_combout\);

-- Location: PIN_92,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[12]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(12),
	combout => \a~combout\(12));

-- Location: LC_X4_Y4_N2
\Stage12|Step4|s~0\ : maxv_lcell
-- Equation(s):
-- \Stage12|Step4|s~0_combout\ = (\Init|ainv~combout\ $ (((\a~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Init|ainv~combout\,
	datad => \a~combout\(12),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage12|Step4|s~0_combout\);

-- Location: PIN_8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[12]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(12),
	combout => \b~combout\(12));

-- Location: LC_X5_Y4_N7
\Stage11|Step4|cout~0\ : maxv_lcell
-- Equation(s):
-- \Stage11|Step4|cout~0_combout\ = (\Stage11|Step4|s~0_combout\ & ((\Stage10|Step4|cout~0_combout\) # (\Init|binv~combout\ $ (\b~combout\(11))))) # (!\Stage11|Step4|s~0_combout\ & (\Stage10|Step4|cout~0_combout\ & (\Init|binv~combout\ $ (\b~combout\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d4e8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|binv~combout\,
	datab => \Stage11|Step4|s~0_combout\,
	datac => \Stage10|Step4|cout~0_combout\,
	datad => \b~combout\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage11|Step4|cout~0_combout\);

-- Location: LC_X3_Y3_N8
\Stage12|Step6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \Stage12|Step6|Mux0~0_combout\ = (\Init|op\(0) & (\Init|ainv~combout\ $ ((\a~combout\(12))))) # (!\Init|op\(0) & (((\Stage11|Step4|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7b48",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|ainv~combout\,
	datab => \Init|op\(0),
	datac => \a~combout\(12),
	datad => \Stage11|Step4|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage12|Step6|Mux0~0_combout\);

-- Location: LC_X3_Y3_N1
\Stage12|Step6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \Stage12|Step6|Mux0~1_combout\ = \Init|binv~combout\ $ (\b~combout\(12) $ (((\Init|op\(1) & \Stage12|Step6|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9666",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|binv~combout\,
	datab => \b~combout\(12),
	datac => \Init|op\(1),
	datad => \Stage12|Step6|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage12|Step6|Mux0~1_combout\);

-- Location: LC_X3_Y3_N9
\Stage12|Step6|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \Stage12|Step6|Mux0~2_combout\ = (\Stage12|Step6|Mux0~1_combout\ & ((\Init|op\(0)) # (\Stage12|Step4|s~0_combout\ $ (\Init|op\(1))))) # (!\Stage12|Step6|Mux0~1_combout\ & (\Stage12|Step4|s~0_combout\ & (\Init|op\(0) $ (\Init|op\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "de28",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage12|Step4|s~0_combout\,
	datab => \Init|op\(0),
	datac => \Init|op\(1),
	datad => \Stage12|Step6|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage12|Step6|Mux0~2_combout\);

-- Location: PIN_12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[13]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(13),
	combout => \a~combout\(13));

-- Location: LC_X3_Y3_N2
\Stage12|Step4|cout~0\ : maxv_lcell
-- Equation(s):
-- \Stage12|Step4|cout~0_combout\ = (\Stage12|Step4|s~0_combout\ & ((\Stage11|Step4|cout~0_combout\) # (\b~combout\(12) $ (\Init|binv~combout\)))) # (!\Stage12|Step4|s~0_combout\ & (\Stage11|Step4|cout~0_combout\ & (\b~combout\(12) $ (\Init|binv~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "be28",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage12|Step4|s~0_combout\,
	datab => \b~combout\(12),
	datac => \Init|binv~combout\,
	datad => \Stage11|Step4|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage12|Step4|cout~0_combout\);

-- Location: LC_X3_Y3_N3
\Stage13|Step6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \Stage13|Step6|Mux0~0_combout\ = (\Init|op\(1) & (((\Stage12|Step4|cout~0_combout\)))) # (!\Init|op\(1) & (\Init|ainv~combout\ $ ((\a~combout\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f606",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|ainv~combout\,
	datab => \a~combout\(13),
	datac => \Init|op\(1),
	datad => \Stage12|Step4|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage13|Step6|Mux0~0_combout\);

-- Location: LC_X3_Y3_N0
\Stage13|Step4|s~0\ : maxv_lcell
-- Equation(s):
-- \Stage13|Step4|s~0_combout\ = \Init|ainv~combout\ $ ((((\a~combout\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "55aa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|ainv~combout\,
	datad => \a~combout\(13),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage13|Step4|s~0_combout\);

-- Location: LC_X3_Y3_N6
\Stage13|Step6|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \Stage13|Step6|Mux0~2_combout\ = (\Init|op\(0) & (((\Stage13|Step4|s~0_combout\)))) # (!\Init|op\(0) & (\Init|op\(1) & (\Stage13|Step6|Mux0~0_combout\ $ (\Stage13|Step4|s~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d2c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage13|Step6|Mux0~0_combout\,
	datab => \Init|op\(0),
	datac => \Stage13|Step4|s~0_combout\,
	datad => \Init|op\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage13|Step6|Mux0~2_combout\);

-- Location: LC_X3_Y3_N7
\Stage13|Step6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \Stage13|Step6|Mux0~1_combout\ = (\Init|op\(1)) # ((\Init|op\(0) & ((!\Stage13|Step4|s~0_combout\))) # (!\Init|op\(0) & (\Stage13|Step6|Mux0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff2e",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage13|Step6|Mux0~0_combout\,
	datab => \Init|op\(0),
	datac => \Stage13|Step4|s~0_combout\,
	datad => \Init|op\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage13|Step6|Mux0~1_combout\);

-- Location: PIN_66,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[13]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(13),
	combout => \b~combout\(13));

-- Location: LC_X3_Y3_N4
\Stage13|Step6|Mux0~3\ : maxv_lcell
-- Equation(s):
-- \Stage13|Step6|Mux0~3_combout\ = \Stage13|Step6|Mux0~2_combout\ $ (((\Stage13|Step6|Mux0~1_combout\ & (\Init|binv~combout\ $ (\b~combout\(13))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a66a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage13|Step6|Mux0~2_combout\,
	datab => \Stage13|Step6|Mux0~1_combout\,
	datac => \Init|binv~combout\,
	datad => \b~combout\(13),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage13|Step6|Mux0~3_combout\);

-- Location: PIN_36,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[14]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(14),
	combout => \a~combout\(14));

-- Location: LC_X3_Y4_N7
\Stage14|Step4|s~0\ : maxv_lcell
-- Equation(s):
-- \Stage14|Step4|s~0_combout\ = (\Init|ainv~combout\ $ (((\a~combout\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Init|ainv~combout\,
	datad => \a~combout\(14),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage14|Step4|s~0_combout\);

-- Location: LC_X3_Y3_N5
\Stage13|Step4|cout~0\ : maxv_lcell
-- Equation(s):
-- \Stage13|Step4|cout~0_combout\ = (\Stage12|Step4|cout~0_combout\ & ((\Stage13|Step4|s~0_combout\) # (\Init|binv~combout\ $ (\b~combout\(13))))) # (!\Stage12|Step4|cout~0_combout\ & (\Stage13|Step4|s~0_combout\ & (\Init|binv~combout\ $ (\b~combout\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d4e8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|binv~combout\,
	datab => \Stage12|Step4|cout~0_combout\,
	datac => \Stage13|Step4|s~0_combout\,
	datad => \b~combout\(13),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage13|Step4|cout~0_combout\);

-- Location: LC_X3_Y4_N1
\Stage14|Step6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \Stage14|Step6|Mux0~0_combout\ = (\Init|op\(0) & (\Init|ainv~combout\ $ (((\a~combout\(14)))))) # (!\Init|op\(0) & (((\Stage13|Step4|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "72d8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|op\(0),
	datab => \Init|ainv~combout\,
	datac => \Stage13|Step4|cout~0_combout\,
	datad => \a~combout\(14),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage14|Step6|Mux0~0_combout\);

-- Location: PIN_95,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[14]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(14),
	combout => \b~combout\(14));

-- Location: LC_X3_Y4_N4
\Stage14|Step6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \Stage14|Step6|Mux0~1_combout\ = \Init|binv~combout\ $ (\b~combout\(14) $ (((\Stage14|Step6|Mux0~0_combout\ & \Init|op\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "956a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|binv~combout\,
	datab => \Stage14|Step6|Mux0~0_combout\,
	datac => \Init|op\(1),
	datad => \b~combout\(14),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage14|Step6|Mux0~1_combout\);

-- Location: LC_X3_Y4_N8
\Stage14|Step6|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \Stage14|Step6|Mux0~2_combout\ = (\Stage14|Step6|Mux0~1_combout\ & ((\Init|op\(0)) # (\Init|op\(1) $ (\Stage14|Step4|s~0_combout\)))) # (!\Stage14|Step6|Mux0~1_combout\ & (\Stage14|Step4|s~0_combout\ & (\Init|op\(1) $ (\Init|op\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "de60",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Init|op\(1),
	datab => \Init|op\(0),
	datac => \Stage14|Step4|s~0_combout\,
	datad => \Stage14|Step6|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage14|Step6|Mux0~2_combout\);

-- Location: PIN_33,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[15]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(15),
	combout => \a~combout\(15));

-- Location: LC_X3_Y4_N6
\Stage15|Step6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \Stage15|Step6|Mux0~0_combout\ = (\Init|ainv~combout\ $ ((\a~combout\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3c3c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Init|ainv~combout\,
	datac => \a~combout\(15),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage15|Step6|Mux0~0_combout\);

-- Location: LC_X3_Y4_N5
\Stage14|Step4|cout~0\ : maxv_lcell
-- Equation(s):
-- \Stage14|Step4|cout~0_combout\ = (\Stage13|Step4|cout~0_combout\ & ((\Stage14|Step4|s~0_combout\) # (\Init|binv~combout\ $ (\b~combout\(14))))) # (!\Stage13|Step4|cout~0_combout\ & (\Stage14|Step4|s~0_combout\ & (\Init|binv~combout\ $ (\b~combout\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8ee8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage13|Step4|cout~0_combout\,
	datab => \Stage14|Step4|s~0_combout\,
	datac => \Init|binv~combout\,
	datad => \b~combout\(14),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage14|Step4|cout~0_combout\);

-- Location: LC_X3_Y4_N9
\Stage15|Step6|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \Stage15|Step6|Mux0~2_combout\ = ((\Init|op\(0) & ((!\Init|op\(1)))) # (!\Init|op\(0) & (\Stage14|Step4|cout~0_combout\ & \Init|op\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "30cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Init|op\(0),
	datac => \Stage14|Step4|cout~0_combout\,
	datad => \Init|op\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage15|Step6|Mux0~2_combout\);

-- Location: PIN_96,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[15]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(15),
	combout => \b~combout\(15));

-- Location: LC_X3_Y4_N2
\Stage15|Step6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \Stage15|Step6|Mux0~1_combout\ = ((\Init|binv~combout\ $ (\b~combout\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \Init|binv~combout\,
	datad => \b~combout\(15),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage15|Step6|Mux0~1_combout\);

-- Location: LC_X3_Y4_N3
\Stage15|Step6|Mux0~3\ : maxv_lcell
-- Equation(s):
-- \Stage15|Step6|Mux0~3_combout\ = (\Init|op\(1) & (\Stage15|Step6|Mux0~0_combout\ $ (\Stage15|Step6|Mux0~2_combout\ $ (\Stage15|Step6|Mux0~1_combout\)))) # (!\Init|op\(1) & ((\Stage15|Step6|Mux0~0_combout\ & ((\Stage15|Step6|Mux0~2_combout\) # 
-- (\Stage15|Step6|Mux0~1_combout\))) # (!\Stage15|Step6|Mux0~0_combout\ & (\Stage15|Step6|Mux0~2_combout\ & \Stage15|Step6|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9e68",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage15|Step6|Mux0~0_combout\,
	datab => \Stage15|Step6|Mux0~2_combout\,
	datac => \Init|op\(1),
	datad => \Stage15|Step6|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Stage15|Step6|Mux0~3_combout\);

-- Location: LC_X3_Y4_N0
\overflow~2\ : maxv_lcell
-- Equation(s):
-- \overflow~2_combout\ = (\Stage13|Step4|cout~0_combout\ & (!\Stage14|Step4|s~0_combout\ & (\Init|binv~combout\ $ (!\b~combout\(14))))) # (!\Stage13|Step4|cout~0_combout\ & (\Stage14|Step4|s~0_combout\ & (\Init|binv~combout\ $ (\b~combout\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "2442",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Stage13|Step4|cout~0_combout\,
	datab => \Stage14|Step4|s~0_combout\,
	datac => \Init|binv~combout\,
	datad => \b~combout\(14),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \overflow~2_combout\);

-- Location: PIN_84,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\res[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Stage0|Step6|Mux0~2_combout\,
	oe => VCC,
	padio => ww_res(0));

-- Location: PIN_81,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\res[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Stage1|Step6|Mux0~3_combout\,
	oe => VCC,
	padio => ww_res(1));

-- Location: PIN_7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\res[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Stage2|Step6|Mux0~2_combout\,
	oe => VCC,
	padio => ww_res(2));

-- Location: PIN_62,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\res[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Stage3|Step6|Mux0~3_combout\,
	oe => VCC,
	padio => ww_res(3));

-- Location: PIN_15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\res[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Stage4|Step6|Mux0~2_combout\,
	oe => VCC,
	padio => ww_res(4));

-- Location: PIN_6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\res[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Stage5|Step6|Mux0~3_combout\,
	oe => VCC,
	padio => ww_res(5));

-- Location: PIN_5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\res[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Stage6|Step6|Mux0~2_combout\,
	oe => VCC,
	padio => ww_res(6));

-- Location: PIN_2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\res[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Stage7|Step6|Mux0~3_combout\,
	oe => VCC,
	padio => ww_res(7));

-- Location: PIN_90,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\res[8]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Stage8|Step6|Mux0~2_combout\,
	oe => VCC,
	padio => ww_res(8));

-- Location: PIN_77,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\res[9]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Stage9|Step6|Mux0~3_combout\,
	oe => VCC,
	padio => ww_res(9));

-- Location: PIN_76,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\res[10]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Stage10|Step6|Mux0~2_combout\,
	oe => VCC,
	padio => ww_res(10));

-- Location: PIN_74,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\res[11]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Stage11|Step6|Mux0~3_combout\,
	oe => VCC,
	padio => ww_res(11));

-- Location: PIN_30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\res[12]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Stage12|Step6|Mux0~2_combout\,
	oe => VCC,
	padio => ww_res(12));

-- Location: PIN_21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\res[13]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Stage13|Step6|Mux0~3_combout\,
	oe => VCC,
	padio => ww_res(13));

-- Location: PIN_70,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\res[14]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Stage14|Step6|Mux0~2_combout\,
	oe => VCC,
	padio => ww_res(14));

-- Location: PIN_4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\res[15]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Stage15|Step6|Mux0~3_combout\,
	oe => VCC,
	padio => ww_res(15));

-- Location: PIN_97,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\overflow~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \overflow~2_combout\,
	oe => VCC,
	padio => ww_overflow);
END structure;


