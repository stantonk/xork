-- xork framework
library ieee;
use ieee.std_logic_1164.all;

-- s2p
-- serial to parallel conversion
-- port(clk, rst, din, din_v, dout, dout_v);
entity s2p is
	generic (WIDTH: natural);
	port (
		clk, rst   : in std_logic;
		din, din_v : in std_logic;
		dout       : out std_logic_vector(WIDTH-1 downto 0);
		dout_v     : out std_logic
	);
end entity;

architecture rtl of s2p is
	signal dout_i : std_logic_vector(WIDTH-1 downto 0);
	signal count  : natural range 0 to WIDTH;
begin

	serialToParallel : process(clk)
	begin
		if (rising_edge(clk)) then
			if (rst = '1') then
				dout_i <= (others => '0');
				dout_v <= '0';
				count <= 0;
			else
				if (count = WIDTH-1) then
					count <= 0;
					dout_v <= '1';
				else
					dout_v <= '0';
				end if;
				
				if (din_v = '1') then
					dout_i <= dout_i(WIDTH-2 downto 0) & din;
					count <= count + 1;
				end if;
			end if;
		end if;
	end process;
	
	dout <= dout_i;
	
end architecture rtl;