library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
entity Shifter is
port (A:inout bit_vector(4 downto 0);
CLK:in std_logic);
end entity;



architecture ARH_Shift of Shifter is
signal A_xor:bit;
signal N : integer;
begin
process(CLK)
begin
if(CLK'event and CLK='1') then
if(A="00000") then A<="00001";
else
A_xor<=A(3) xor A(2);
A<=A sll 1;
A(0)<=A_xor;
N <= conv_integer(A);
if conv_integer(N)>11 then 
	A<="00101";
end if;
end if;	
end if;
end process;
end architecture;