library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;



entity pseudo is
port ( 
	CLK: in std_logic;
	Q:	 inout std_logic_vector(4 downto 0)
	);
	
end entity;

architecture comportamental of pseudo is
signal Qt: std_logic_vector(4 downto 0) := "00001";
begin
	generare: process(CLK, Qt)
	variable tmp: std_logic := '0';
	begin
		if(CLK'EVENT and CLK ='1') then
			tmp:= Qt(4) XOR Qt(3) XOR Qt(0);
			Qt <= tmp & Qt(4 downto 1);
		end if;
	end process;
	cases: process(clk)
	begin
	case Qt is
			when "01100" => Qt <= "00101"; --12
			when "01101" => Qt <= "00111";
			when "01110" => Qt <= "00100";
			when "01111" => Qt <= "00011";
			when "10000" => Qt <= "00011";
			when "10001" => Qt <= "00111";
			when "10010" => Qt <= "00100";
			when "10011" => Qt <= "00011";
			when "10100" => Qt <= "01001";
			when "10101" => Qt <= "01011";
			when "10110" => Qt <= "00101";
			when "10111" => Qt <= "00111";
			when "11000" => Qt <= "00101";
			when "11001" => Qt <= "00011";
			when "11010" => Qt <= "00100";
			when "11011" => Qt <= "00101";
			when "11100" => Qt <= "00111";
			when "11101" => Qt <= "00011";
			when "11110" => Qt <= "00010";
			when "11111" => Qt <= "00101";
			when others => Qt <= Qt;
	end case;
	end process;
	Q <= Qt;
end architecture;