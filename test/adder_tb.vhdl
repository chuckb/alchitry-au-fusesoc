library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library vunit_lib;
context vunit_lib.vunit_context;

library rtl_lib;

entity adder_tb is
  generic (runner_cfg : string);
end entity;

architecture tb of adder_tb is
  signal A : unsigned(3 downto 0);
  signal B : unsigned(3 downto 0);
  signal X : unsigned(4 downto 0);
  
begin
  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    while test_suite loop

      if run("should add") then
        A <= "0010";
        B <= "0010";
        wait on X;
        check_equal(X, 4);
      end if;
    end loop;

    test_runner_cleanup(runner);
    wait;
  end process;

  dut : entity rtl_lib.adder(rtl)
  port map (
    A => A,
    B => B,
    X => X
  );

end architecture;