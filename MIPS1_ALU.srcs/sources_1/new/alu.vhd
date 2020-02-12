library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    generic ( N : integer := 8 );
    port ( a, b : in STD_LOGIC_VECTOR( N-1 downto 0 );
	   f : in STD_LOGIC_VECTOR( 3 downto 0 );
	   alu_out : out STD_LOGIC_VECTOR( N-1 downto 0 )
	   );
end alu;

architecture Behavioral of alu is

    signal add_result, sub_result, div_result, mult_result, ander_result, orer_result : STD_LOGIC_VECTOR( N-1 downto 0);
    signal alu_result : STD_LOGIC_VECTOR (N-1 downto 0);
    
begin
    
    process ( a, b, f(3 downto 0) )
    begin
        case f(3 downto 0) is 
            when "0000" => alu_result <= a + b; -- addition
            when "0001" => alu_result <= a - b; -- subtraction 
            when "0010" => alu_result <= std_logic_vector(to_unsigned(to_integer(unsigned(a)) / to_integer(unsigned(b)), N)); -- division
            when "0011" => alu_result <= std_logic_vector(to_unsigned((to_integer(unsigned(a)) * to_integer(unsigned(b))), N)); -- multiplication
            when "0100" => alu_result <= a and b; -- and
            when "0101" => alu_result <= a or b; -- or
            when "0110" => alu_result <= a nor b; -- nor
            when "0111" => alu_result <= a xor b; -- xor
            when "1000" => alu_result <= a xnor b; -- xnor
            when "1001" => alu_result <= a nand b; -- nand
            when "1010" => -- a greater than b
                if(a > b) then
                    alu_result <= x"01";
                else
                    alu_result <= x"00";
                end if;
            when "1011" => -- a equal to b
                if(a = b) then
                    alu_result <= x"01";
                else
                    alu_result <= x"00";
                end if;
            when "1100" => alu_result <= std_logic_vector(unsigned(a) sll N); -- logical shift left
            when "1101" => alu_result <= std_logic_vector(unsigned(a) srl N); -- logical shift right
            when "1110" => alu_result <= std_logic_vector(unsigned(a) rol N); -- rotate left
            when "1111" => alu_result <= std_logic_vector(unsigned(a) ror N); -- rotate right
            when others => alu_result <= a + b; -- default operation is add
        end case;
    end process;
    
    alu_out <= alu_result;

end Behavioral;
