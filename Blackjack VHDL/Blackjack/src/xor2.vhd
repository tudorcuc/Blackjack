-------------------------------- POARTA XOR ----------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR2 is -- Entitate
port ( A, B: in STD_LOGIC;
Y: out STD_LOGIC);
end XOR2;



architecture comportamental of XOR2 is -- Arhitectura
begin
Y <= A xor B;
end architecture;