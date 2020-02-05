library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.all;
use IEEE.NUMERIC_STD.all;

entity subtractor is
    generic (N: integer := 8);
    Port (
        a : in STD_LOGIC_VECTOR (N-1 downto 0);
        b : in STD_LOGIC_VECTOR (N-1 downto 0);
        y : out STD_LOGIC_VECTOR (N-1 downto 0)
     );
end subtractor;

architecture subtractor of subtractor is

begin
    process(a, b)
    begin
        y <= a - b;
    end process;
end subtractor;
