library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity unitate_control is 
	port(
		CLK: in std_logic;
		enable: in std_logic;
		RESET: in std_logic;
		CARD:in std_logic_vector(4 downto 0);
		TAKE1, TAKE2 : in std_logic;
		Suma1, Suma2 : inout std_logic_vector(4 downto 0);
		enable_comparator: out std_logic
		);
end entity ;



architecture comportamentala of unitate_control is
	type STARE_T is (A, B, B1, C, C1, D);
	signal STARE, NXSTARE: STARE_T;
	signal tmp1, tmp2: std_logic_vector(4 downto 0);
	begin
	ACTUALIZEAZA_STARE: process (clk,enable)
		begin
		if enable='0' then
			STARE <= a;
		elsif rising_edge(clk) then
			STARE <= NXSTARE;
		end if;
	end process ACTUALIZEAZA_STARE;
	tranzitii: process (clk,stare)
	begin
		case stare is
			when a=> 
				if enable = '0' then
					NXSTARE <= a;
				elsif enable = '1' then
					Suma1 <= "00000";
					Suma2 <= "00000";
					NXSTARE <= b;
				end if;
			when b=>
				if TAKE1 = '1' then	
					tmp1 <= conv_std_logic_vector((conv_integer(Suma1) + conv_integer(CARD)),5);
    				Suma1 <= tmp1(4 downto 0);	
					NXSTARE <= b;
				elsif TAKE1 = '0' then
					NXSTARE <= b1;  
				end if;
			when b1=>
				if Suma1 > "10101" then
					Suma1 <= "00000";
				end if;
				NXSTARE <= c;
			when c=>
				if TAKE2 = '1' then	
					tmp2 <= conv_std_logic_vector((conv_integer(Suma2) + conv_integer(CARD)),5);
    				Suma2 <= tmp2(4 downto 0);	
					NXSTARE <= c;
				elsif TAKE2 = '0' then
					NXSTARE <= c1;
				end if;
			when c1 =>
				if Suma2 > "10101" then
					Suma2 <= "00000";
				end if;
				enable_comparator <= '1';
				NXSTARE <= d;
			when d=>
				enable_comparator <= '0';
				if RESET = '1' then
					NXSTARE <= a;
				elsif RESET = '0' then
					NXSTARE <= d;
				end if;
		end case;
	end process;
end architecture;

	
