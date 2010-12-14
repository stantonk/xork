--xork framework
library ieee;
use ieee.std_logic_1164.all;

-- rstgen
-- reset generator
-- generic map (DELAY, POLARITY);
-- port map (rst);
entity rstgen is
	generic (DELAY: time; POLARITY: std_logic);
	port (rst: out std_logic);
end rstgen;

architecture beh of rstgen is
begin
	generateRst : process
	begin
		rst <= POLARITY;
		wait for DELAY;
		rst <= not POLARITY;
		wait;
	end process;
end architecture beh;
