library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity comparator is
  port(	 
  	enable_comparator, clk : in std_logic;
   	A, B : in std_logic_vector(4 downto 0);
    winner : out std_logic_vector(4 downto 0));
end entity;	

architecture comportamental of comparator is
begin
	process(clk)
	begin
		if enable_comparator = '1' then
			if conv_integer(A) > conv_integer(B) then
				winner <= A;
			elsif conv_integer(A) = conv_integer(B) then
				winner <= A;
			elsif conv_integer(A) < conv_integer(B) then
				winner <= B;
			end if;
		end if;
	end process;
end architecture;
		
		

