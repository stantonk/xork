--xork framework
library ieee;
use ieee.std_logic_1164.all;

entity s2p_tb is
end s2p_tb;

architecture unittest of s2p_tb is
	constant PERIOD   : time := 10 ns;
	signal clk, rst   : std_logic;
	signal din, din_v : std_logic;
	signal dout_v     : std_logic;
	signal dout       : std_logic_vector;
begin

	--TODO:
	stim : process
	begin
		wait;
	end process;
	
	--TODO:
	verify : process
	begin
		wait;
	end process;
	
	dut : entity xork.s2p(rtl)
	generic map (WIDTH => 8)
	port map (clk, rst, din, din_v, dout, dout_v);
	
	clock : entity xork.clkgen(rtl)
	generic map (PERIOD)
	port map (clk);
	
	reset : entity xork.rstgen(rtl)
	generic map (DELAY => (3*PERIOD), POLARITY => '1')
	port map (rst);
	
end architecture unittest;
