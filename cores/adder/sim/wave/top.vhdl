library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
end top;

architecture rtl of top is
  -- Define signals to access adder ports
  signal A : unsigned(3 downto 0);
  signal B : unsigned(3 downto 0);
  signal X : unsigned(4 downto 0);

begin

  i_Adder : entity work.adder(rtl)
  port map (
    A => A,
    B => B,
    X => X
  );

	process is
	begin
		A <= "0000";
		B <= "0000";
		wait for 10 ns;
		report "A=" & integer'image(to_integer(A)) & "; B=" & integer'image(to_integer(B)) & "; X=" & integer'image(to_integer(X));

		A <= "0010";
		wait for 10 ns;
		report "A=" & integer'image(to_integer(A)) & "; B=" & integer'image(to_integer(B)) & "; X=" & integer'image(to_integer(X));

		B <= "0010";
		wait for 10 ns;
		report "A=" & integer'image(to_integer(A)) & "; B=" & integer'image(to_integer(B)) & "; X=" & integer'image(to_integer(X));

		wait;
	end process;
end architecture;