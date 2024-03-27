library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity adder is
  port(
    A, B : in std_logic_vector(4 downto 0);
    SUM : out std_logic_vector(5 downto 0));
end adder;		

architecture archi of adder is
signal tmp: std_logic_vector(5 downto 0);		 
  begin
    tmp <= conv_std_logic_vector((conv_integer(A) + conv_integer(B)),6);
    SUM <= tmp(5 downto 0);
end archi; 	 