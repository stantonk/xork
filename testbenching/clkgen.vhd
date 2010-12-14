--xork framework
library ieee;
use ieee.std_logic_1164.all;

-- clkgen
-- generates a clock
-- generic map (PERIOD);
-- port map (clk);
entity clkgen is
	generic (PERIOD: time);
	port (clk : out std_logic);
end clkgen;

architecture beh of clkgen is
begin
	generateClk : process
	begin
		clk <= '0';
		wait for PERIOD/2;
		clk <= '1';
		wait for PERIOD/2;
	end process;
end architecture beh;
