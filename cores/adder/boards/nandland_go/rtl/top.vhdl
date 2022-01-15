library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
  port(
    -- Inputs
    i_Switch_1 : in std_logic;
    i_Switch_2 : in std_logic;
    i_Switch_3 : in std_logic;
    i_Switch_4 : in std_logic;
    i_Clk : in std_logic;
  
    -- Outputs
    o_LED : out std_logic_vector(3 downto 0) := (others => '0');
    o_Segment2_G: out std_logic := '1' -- inverted
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

  process(i_Switch_1, i_Switch_2, i_Switch_3, i_Switch_4, A, B, X) is
  begin
    if i_Switch_2 = '1' then
      o_LED(3 downto 0) <= std_logic_vector(B);
      o_Segment2_G <= '1';
      if rising_edge(i_Switch_3) then
        B <= B + 1;
      end if;
      if rising_edge(i_Switch_4) then
        B <= B - 1;
      end if;
    elsif i_Switch_1 = '1' then
      o_LED(3 downto 0) <= std_logic_vector(A);
      o_Segment2_G <= '1';
      if rising_edge(i_Switch_3) then
        A <= A + 1;
      end if;
      if rising_edge(i_Switch_4) then
        A <= A - 1;
      end if;
    else
      o_LED(3 downto 0) <= std_logic_vector(X(3 downto 0));
      o_Segment2_G <= not X(4);
    end if;
  end process;
end architecture;