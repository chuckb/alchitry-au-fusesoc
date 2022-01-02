library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity au_top is
  port(
    -- Inputs
    io_dip_sw : in std_logic_vector(23 downto 0);
    io_sw : in std_logic_vector(4 downto 0);
    clk : in std_logic;
  
    -- Outputs
    led : out std_logic_vector(7 downto 0) := (others => '0');
    io_led : out std_logic_vector(23 downto 0) := (others => '0');
    io_ss_led : out std_logic_vector(7 downto 0) := (others => '1');
    io_ss_en : out std_logic_vector(3 downto 0) := (others => '1')
  );
end au_top;

architecture rtl of au_top is
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

  process(io_dip_sw) is
  begin
    A <= unsigned(io_dip_sw(3 downto 0));
    B <= unsigned(io_dip_sw(11 downto 8));
  end process;
  
  process(A) is
  begin
    io_led(3 downto 0) <= std_logic_vector(A);
  end process;

  process(B) is
  begin
    io_led(11 downto 8) <= std_logic_vector(B);
  end process;
  
  process(X) is
  begin
    io_led(20 downto 16) <= std_logic_vector(X);
  end process;
end architecture;