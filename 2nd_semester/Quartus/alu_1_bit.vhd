library IEEE;
use ieee.std_logic_1164.all;

library work;
use work.basic_components.all;

entity alu_1_bit is
	port (a, b, ainv, binv, cin: in std_logic; -- είσοδοι σύμφωνα με Εικ.7.
	op : in std_logic_vector(1 DOWNTO 0);
	cout, res: out std_logic); -- έξοδοι το κρατούμενο και το αποτέλεσμα της πράξης.
end alu_1_bit;

architecture structural of alu_1_bit is

	signal sig1, sig2, sig3, sig4, sig5, sig6: std_logic;	
	
begin
	Step0: mux2_to_1 port map (a, not a, ainv, sig1); 
	Step1: mux2_to_1 port map (b, not b, binv, sig2); 	
	Step2: sig3 <= (sig1 and sig2); -- αποτέλεσμα and πράξης.
	Step3: sig4 <= (sig1 or sig2); -- αποτέλεσμα or πράξης.
	Step4: one_bit_adder port map (sig1, sig2, cin, sig5, cout); -- το sig5 είναι το 
	-- αποτέλεσμα της πράξης (πρόσθεση ή αφαίρεση) και το cout το κρατούμενο.
	Step5: sig6 <= (sig1 xor sig2); -- αποτέλεσμα xor πράξης.
	Step6: mux4_to_1 port map (sig3, sig4, sig5, sig6, op, res); 	
end structural;	