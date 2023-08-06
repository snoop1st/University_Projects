library IEEE;
use ieee.std_logic_1164.all;

library work;
use work.basic_components.all;

-- είσοδοι οι δύο 16-bit αριθμοί και το opcode (Εικόνα 8).
-- έξοδοι το αποτέλεσμα της πράξης και το overflow bit.
entity alu_16_bit is
	port (a, b : in std_logic_vector(15 DOWNTO 0);
			opcode : in std_logic_vector(2 DOWNTO 0);
			res : out std_logic_vector(15 DOWNTO 0);
			overflow: out std_logic);
end alu_16_bit;

architecture structural of alu_16_bit is
	-- χρησιμοποιούμε το alu_1_bit component.
	component alu_1_bit
		port (a, b, ainv, binv, cin: in std_logic;
		op : in std_logic_vector(1 DOWNTO 0);
		cout, res: out std_logic);
	end component;
	
	signal carry : std_logic_vector(1 TO 16); -- Μεταβλητή για τα 16 εσωτερικά κρατούμενα.
	signal a_inv, b_inv, c_in : std_logic;
	signal op : std_logic_vector(1 DOWNTO 0);
	
begin
	Init: control_circuit port map (opcode, op, a_inv, b_inv, c_in); -- δημιουργία των op, 
	-- ainv, binv, cin σημάτων για την alu_1_bit.
	Stage0: alu_1_bit port map (a(0), b(0), a_inv, b_inv, c_in, op, carry(1), res(0)); 
	Stage1: alu_1_bit port map (a(1), b(1), a_inv, b_inv, carry(1), op, carry(2), res(1));
	Stage2: alu_1_bit port map (a(2), b(2), a_inv, b_inv, carry(2), op, carry(3), res(2));
	Stage3: alu_1_bit port map (a(3), b(3), a_inv, b_inv, carry(3), op, carry(4), res(3));
	Stage4: alu_1_bit port map (a(4), b(4), a_inv, b_inv, carry(4), op, carry(5), res(4));	
	Stage5: alu_1_bit port map (a(5), b(5), a_inv, b_inv, carry(5), op, carry(6), res(5));
	Stage6: alu_1_bit port map (a(6), b(6), a_inv, b_inv, carry(6), op, carry(7), res(6));
	Stage7: alu_1_bit port map (a(7), b(7), a_inv, b_inv, carry(7), op, carry(8), res(7));	
	Stage8: alu_1_bit port map (a(8), b(8), a_inv, b_inv, carry(8), op, carry(9), res(8));
	Stage9: alu_1_bit port map (a(9), b(9), a_inv, b_inv, carry(9), op, carry(10), res(9));	
	Stage10: alu_1_bit port map (a(10), b(10), a_inv, b_inv, carry(10), op, carry(11), res(10));
	Stage11: alu_1_bit port map (a(11), b(11), a_inv, b_inv, carry(11), op, carry(12), res(11));
	Stage12: alu_1_bit port map (a(12), b(12), a_inv, b_inv, carry(12), op, carry(13), res(12));
	Stage13: alu_1_bit port map (a(13), b(13), a_inv, b_inv, carry(13), op, carry(14), res(13));
	Stage14: alu_1_bit port map (a(14), b(14), a_inv, b_inv, carry(14), op, carry(15), res(14));
	Stage15: alu_1_bit port map (a(15), b(15), a_inv, b_inv, carry(15), op, carry(16), res(15));
	overflow <= (carry(15) xor carry(14));
end structural;	