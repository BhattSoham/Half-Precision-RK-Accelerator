
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2023 08:02:34 PM
-- Design Name: 
-- Module Name: Top_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_TB is
--  Port ( );
end Top_TB;

architecture Behavioral of Top_TB is
component Top is
 Port (
 clock: in std_logic;
 inst: in std_logic_vector(31 downto 0);
 cont: out std_logic_vector(15 downto 0);
 addr: out std_logic_vector(11 downto 0);
 x_out: out std_logic_vector(15 downto 0);
 y_out: out std_logic_vector(15 downto 0); 
 initial: out std_logic 
 
 );
end component;

signal clock: std_logic;
signal x_out:  std_logic_vector(15 downto 0);
signal y_out:  std_logic_vector(15 downto 0);
signal initial: std_logic;
signal cont:  std_logic_vector(15 downto 0);
signal inst:  std_logic_vector(31 downto 0);
signal  addr :  std_logic_vector(11 downto 0);

--signal  x_in:  STD_LOGIC_VECTOR(31 downto 0);
--signal            y_in :  STD_LOGIC_VECTOR(31 downto 0);
--signal            h :  STD_LOGIC_VECTOR(31 downto 0);
--signal            p_in :  STD_LOGIC_VECTOR(31 downto 0);
--signal           p1_in :  STD_LOGIC_VECTOR(31 downto 0);
--signal           c_in : STD_LOGIC_VECTOR(31 downto 0);




constant clock_period : time := 10 ns;

begin

uut: Top port map (

inst => inst,
x_out => x_out,
y_out => y_out,
initial => initial,
clock => clock,
cont => cont,
addr => addr
--x_in => x_in,
--y_in => y_in,
--h => h,
--c_in => c_in,
--p_in => p_in,
--p1_in => p1_in
);

rclock: process
begin

clock <= '0';
wait for clock_period/2;
  clock <= '1';
wait for clock_period/2;
   end process;

proc: process 
begin

--write_en <= '1';

inst <= "000000000000" &  "00001" & "000" & "00000" & "0001100";
wait for clock_period;
--write_en <= '1';

inst <= "000000000100" &  "00010" & "000" & "00000" & "0001100";
wait for clock_period;

--write_en <= '1';

inst <= "000000001000" &  "00011" & "000" & "00000" & "0001100";
wait for clock_period;

--write_en <= '1';

inst <= "000000001100" &  "00100" & "000" & "00000" & "0001100";
wait for clock_period;

--write_en <= '1';

inst <= "000000010000" &  "00101" & "000" & "00000" & "0001100";
wait for clock_period;

--write_en <= '1';

inst <= "000000010100" &  "00110" & "000" & "00000" & "0001100"; --
wait for clock_period;
--write_en <= '1';

inst <= "000000011000" &  "00111" & "000" & "00000" & "0001100";
wait for clock_period;

inst <= "000000000000"  &  "00001" & "110" & "00000" & "0001100";
wait for clock_period * 100;

inst <= "000000000000"  &  "00001" & "100" & "00000" & "0001100";
wait for clock_period * 100;

inst <= "000000000000"  &  "00001" & "110" & "00000" & "0001100";
wait for clock_period * 100;

inst <= "000000000000"  &  "00001" & "100" & "00000" & "0001100";
wait for clock_period * 100;

inst <= "000000000000"  &  "00001" & "110" & "00000" & "0001100";
wait for clock_period * 100;

inst <= "000000000000"  &  "00001" & "100" & "00000" & "0001100";
wait for clock_period * 100;


--inst <= "000000000100" &  "00010" & "010" & "00000" & "0001100";
--wait for clock_period;
--inst <= "000000001000" &  "00011" & "010" & "00000" & "0001100";
--wait for clock_period;
--inst <= "000000001100" &  "00100" & "010" & "00000" & "0001100";
--wait for clock_period;
--inst <= "000000010000" &  "00101" & "010" & "00000" & "0001100";
--wait for clock_period;
--inst <= "000000010100" &  "00110" & "010" & "00000" & "0001100";
--wait for clock_period;




wait;

end process;



end Behavioral;