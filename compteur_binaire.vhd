library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SevenSegmentCounter is
    Port (
        clk : in std_logic;  -- Horloge d'entrée
        an : out std_logic_vector(3 downto 0);  -- Anodes
        seg : out std_logic_vector(6 downto 0); -- Segments
        dp : out std_logic                      -- Point décimal
    );
end SevenSegmentCounter;

architecture Behavioral of SevenSegmentCounter is
    signal count : integer range 0 to 9 := 0; -- Compteur pour les chiffres
begin
    process(clk)
    begin
        if rising_edge(clk) then
            count <= count + 1;
            if count = 10 then
                count <= 0; -- Revenir à 0 après 9
            end if;
        end if;
    end process;

    -- Activer le premier afficheur uniquement
    an <= "1110";

    -- Définir les segments pour chaque chiffre
    process(count)
    begin
        case count is
            when 0 => seg <= "0000001"; -- 0
            when 1 => seg <= "1001111"; -- 1
            when 2 => seg <= "0010010"; -- 2
            when 3 => seg <= "0000110"; -- 3
            when 4 => seg <= "1001100"; -- 4
            when 5 => seg <= "0100100"; -- 5
            when 6 => seg <= "0100000"; -- 6
            when 7 => seg <= "0001111"; -- 7
            when 8 => seg <= "0000000"; -- 8
            when 9 => seg <= "0000100"; -- 9
            when others => seg <= "1111111"; -- Rien
        end case;
    end process;

    -- Désactiver le point décimal
    dp <= '1';
end Behavioral;
