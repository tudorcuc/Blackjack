library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity blackjack is
	port(
		clk, enable, reset: in std_logic;
		card: in std_logic_vector (4 downto 0);
		TAKE1, TAKE2 : in std_logic;
		winner : out std_logic_vector (4 downto 0)
	);
end entity;

architecture bjack of blackjack	is
	component unitate_control is 
		port(
			clk: in std_logic;
			enable: in std_logic;
			enable_comparator: out std_logic;
			RESET: in std_logic;
			CARD:in std_logic_vector(4 downto 0);
			TAKE1, TAKE2 : in std_logic;
			Suma1, Suma2 : inout std_logic_vector(4 downto 0)
			);
	end component;

	component unitate_executie is
		port(
			CLK : in STD_LOGIC;
			SUM1 : in std_logic_vector (4 downto 0);		
			SUM2 : in std_logic_vector (4 downto 0);
			WINNER : out std_logic_vector (4 downto 0);
			enable_comparator : in std_logic	
		);
	end component;	

	signal sumaA, sumaB		 : std_logic_vector (4 downto 0);
	signal enable_comparator1: std_logic;

	begin
		unitate_c: unitate_control port map(clk, enable, enable_comparator1, reset, card, take1, take2, sumaA, sumaB);
		unitate_e: unitate_executie port map(clk, sumaA, sumaB, winner, enable_comparator1);
end architecture;





