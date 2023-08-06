library ieee;
use ieee.std_logic_1164.all;

package basic_components is
	-- Υλοποιεί τον 1-bit αθροιστή.
	component one_bit_adder
		port (in1, in2, cin: in std_logic; 
				s: out std_logic;
				cout: out std_logic);
	end component;

	-- Υλοποιεί 2-1 πολυπλέκτη.	
	component mux2_to_1
		port (in1, in2: in std_logic; 
				op : in std_logic;
				out1: out std_logic);
	end component;

	-- Υλοποιεί 4-1 πολυπλέκτη.		
	component mux4_to_1
		port (in1, in2, in3, in4: in std_logic; 
				op : in std_logic_vector(1 DOWNTO 0);
				out1: out std_logic);
	end component;
	
	-- Υλοποιεί το control_circuit (Πίνακας 1).		
	component control_circuit
		port (opcode : in std_logic_vector(2 DOWNTO 0); 
				op : out std_logic_vector(1 DOWNTO 0);
				ainv, binv, cin: out std_logic);
	end component;
end package basic_components;


library ieee;
use ieee.std_logic_1164.all;

entity one_bit_adder is
	port (in1, in2, cin: in std_logic; -- είσοδοι τα δύο bits και το κρατούμενο.
			s: out std_logic; -- ΄έξοδος το άθροισμα των 2 bits και το κρατούμενο.
			cout: out std_logic);
end one_bit_adder;

architecture model_conc of one_bit_adder is
begin
	s <= (in1 and not in2 and not cin) or (not in1 and in2 and not cin) 
		or (not in1 and not in2 and cin) or (in1 and in2 and cin); -- άθροισμα των 2 bits.
	cout <= (in2 and cin) or (in1 and cin) or (in1 and in2); -- κρατούμενο εξοδου.
end model_conc;

library ieee;
use ieee.std_logic_1164.all;

entity mux2_to_1 is
	port (in1, in2: in std_logic; 
			op : in std_logic;
			out1: out std_logic);
end mux2_to_1;

architecture model_conc of mux2_to_1 is
begin
	with op select
		out1 <= in1 WHEN '0',
				in2 WHEN '1';
end model_conc;

library ieee;
use ieee.std_logic_1164.all;

entity mux4_to_1 is
	port (in1, in2, in3, in4: in std_logic; 
			op : in std_logic_vector(1 DOWNTO 0); -- είσοδος τα 2 bits του operation.
			out1: out std_logic);
end mux4_to_1;

architecture model_conc of mux4_to_1 is
begin
	with op select
		out1 <= in1 WHEN "00",
				in2 WHEN "01",
				in3 WHEN "10",
				in4 WHEN "11";
end model_conc;

library ieee;
use ieee.std_logic_1164.all;

entity control_circuit is
	port (opcode : in std_logic_vector(2 DOWNTO 0);
			op : out std_logic_vector(1 DOWNTO 0);
			ainv, binv, cin: out std_logic);
end control_circuit;

architecture model_conc of control_circuit is
begin
	process (opcode)
	begin 
		if opcode = "000" then 
			op <= "00"; ainv <= '0'; binv <= '0'; cin <= '0'; 
		elsif opcode = "001" then 
			op <= "01"; ainv <= '0'; binv <= '0'; cin <= '0';
		elsif opcode = "010" then 
			op <= "10"; ainv <= '0'; binv <= '0'; cin <= '0';
		elsif opcode = "011" then 
			op <= "10"; ainv <= '0'; binv <= '1'; cin <= '1';
		elsif opcode = "100" then 
			op <= "00"; ainv <= '1'; binv <= '1'; cin <= '0';
		elsif opcode = "101" then 
			op <= "01"; ainv <= '1'; binv <= '1'; cin <= '0';			
		elsif opcode = "110" then 
			op <= "11"; ainv <= '0'; binv <= '0'; cin <= '0';			
		end if;
	end process;
end model_conc;
