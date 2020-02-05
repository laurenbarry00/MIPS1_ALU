library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.all;
use IEEE.NUMERIC_STD.all;

entity divider is
    generic (N: integer := 8);
    Port (
        a : in STD_LOGIC_VECTOR (N-1 downto 0);
        b : in STD_LOGIC_VECTOR (N-1 downto 0);
        y : out STD_LOGIC_VECTOR (N-1 downto 0)
     );
end divider;

architecture divider of divider is

begin
    process(a, b)
    begin
        y <= std_logic_vector(to_signed(to_integer(signed(a)) / to_integer(signed(b)), N-1));
    end process;
end divider;
