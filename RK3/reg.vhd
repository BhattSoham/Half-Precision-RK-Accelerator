----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/08/2023 05:36:37 PM
-- Design Name: 
-- Module Name: reg - Behavioral
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
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg is
Port (
        clk: in std_logic;
        rs1 : in std_logic_vector(4 downto 0);
        write_en : in std_logic;
        cont: out std_logic_vector(15 downto 0)

        );
 end reg;
 


architecture Behavioral of reg is

type regfile is array(7 downto 0) of std_logic_vector(15 downto 0);
signal r : regfile;
signal wridata: std_logic_vector(15 downto 0);

begin

writedata: process(clk, rs1, write_en, wridata)
begin
 if rising_edge(clk) then 
  if  write_en = '1' then 
     r(TO_INTEGER(unsigned(rs1))) <= wridata;
     end if;
   end if;    
  
 
    case rs1  is
      when "00001" =>
      wridata <= x"4000";
       cont <= wridata; --- x
       
      when "00010" =>
       wridata <= x"3C00";
       cont <=  wridata; --- y
       
      when "00011" => 
      wridata <= x"2E66";
       cont <=  wridata; --- h
       
        when "00100" => 
      wridata <= x"3800";
       cont <=  wridata; --- p_in
       
      when "00101" => 
      wridata <= x"4000";
       cont <=  wridata; --- p1_in
       
       when "00110" => 
      wridata <= x"4400";
       cont <=  wridata; --- c_in
       
        when "00111" => 
      wridata <= x"3155";
       cont <=  wridata; --- r_in 
      
      when others => null;
   
     end case;

 end process;

 
          



end Behavioral;
