library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SevenSegment is
    Port (
        an : out std_logic_vector(3 downto 0);  -- Anodes (activent chaque afficheur)
        seg : out std_logic_vector(6 downto 0); -- Segments A-G
        dp : out std_logic                     -- Point décimal
    );
end SevenSegment;

architecture Behavioral of SevenSegment is
begin
    process
    begin
        -- Activer le premier afficheur (AN0)
        an <= "1110";  -- AN0 activé (logique inverse sur Basys 3)

        -- Activer les segments pour afficher "0"
        seg <= "0000001";  -- A, B, C, D, E, F activés, G éteint
        dp <= '1';         -- Point décimal désactivé
        wait;              -- Rester dans cet état
    end process;
end Behavioral;
