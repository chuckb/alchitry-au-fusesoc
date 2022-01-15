library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
  port(
    -- Inputs
    i_DPSwitch : in std_logic_vector(7 downto 0);
  
    -- Outputs
    o_LED : out std_logic_vector(7 downto 0) := (others => '0');
    o_SevenSegmentEnable : out std_logic_vector(2 downto 0) := (others => '1') -- Disabled
  );
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

  process(i_DPSwitch) is
  begin
    A <= not unsigned(i_DPSwitch(3 downto 0));
    B <= not unsigned(i_DPSwitch(7 downto 4));
  end process;

  process(X) is
  begin
    o_LED(7 downto 5) <= "000";
    o_LED(4 downto 0) <= std_logic_vector(X);
  end process;
end architecture;