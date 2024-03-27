library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all; 

entity unitate_executie is
	port(
		CLK : in STD_LOGIC;
		SUM1 : in std_logic_vector (4 downto 0);
		SUM2 : in std_logic_vector (4 downto 0);
		WINNER : out std_logic_vector (4 downto 0);
		enable_comparator : in std_logic
	);
end entity;

architecture ue of unitate_executie is
	component comparator is
  		port(	 
   			enable_comparator, clk : in std_logic;
    		A, B : in std_logic_vector(4 downto 0);
    		winner : out std_logic_vector(4 downto 0)
			);
	end component;
	begin
		poarta: comparator port map(enable_comparator, clk, sum1, sum2, winner);
end architecture;