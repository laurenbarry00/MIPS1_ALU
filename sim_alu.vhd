library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sim_alu is
end sim_alu;

architecture Behavioral of sim_alu is
    component alu
        generic ( N : integer := 8 );
        port ( a, b : in STD_LOGIC_VECTOR( N-1 downto 0 );
               f : in STD_LOGIC_VECTOR( 3 downto 0 );
               alu_out : out STD_LOGIC_VECTOR( N-1 downto 0 )
           );
    end component;
    
    signal a, b, alu_out : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal f : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    
begin
    uut: alu generic map (N => 8) port map (
            a => a,
            b => b,
            f => f,
            alu_out => alu_out
    );
    
    stim_proc: process
        variable i, j: INTEGER range 1 to 255;
        variable k: INTEGER range 0 to 15;
    begin
        for i in 1 to 255 loop
            a <= STD_LOGIC_VECTOR(to_unsigned(i, 8));
            
            for j in 1 to 255 loop
                b <= STD_LOGIC_VECTOR(to_unsigned(j, 8));
                
                for k in 0 to 15 loop
                    f <= STD_LOGIC_VECTOR(to_unsigned(k, 4));
                    
                    wait for 2 ns;
                end loop;
            end loop;
        end loop;
        wait;
    end process;

end Behavioral;
