----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/07/2023 03:03:06 PM
-- Design Name: 
-- Module Name: FEB - Behavioral
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

entity func is
  Port (
  x_in: in std_logic_vector(15 downto 0);
  y_in: in std_logic_vector(15 downto 0);
   f : out STD_LOGIC_VECTOR(15 downto 0);
  clk: in std_logic
  
   );
end func;

architecture Behavioral of func is
Component MAC 
PORT (
    aclk : IN STD_LOGIC;
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tready : OUT STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tready : OUT STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    s_axis_c_tvalid : IN STD_LOGIC;
    s_axis_c_tready : OUT STD_LOGIC;
    s_axis_c_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) 
  );
END COMPONENT;

COMPONENT FPU_MUL
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tready : OUT STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tready : OUT STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) 
  );
END COMPONENT;

signal s_axis_a_tvalid: std_logic := '1';
signal s_axis_b_tvalid: std_logic := '1';
signal s_axis_a_tready1: std_logic := '1';
signal s_axis_b_tready1: std_logic := '1';
signal s_axis_a_tready2: std_logic := '1';
signal s_axis_b_tready2: std_logic := '1';
signal s_axis_c_tvalid: std_logic := '1';
signal s_axis_c_tready1: std_logic := '1';
signal m_axis_result_tvalid1: std_logic := '1';
signal m_axis_result_tvalid2: std_logic := '1';
signal p_in: std_logic_vector(15 downto 0) := x"4000";
signal r_in: std_logic_vector(15 downto 0);
signal q_in: std_logic_vector(15 downto 0) := x"BC00";

begin
uut1: MAC port map (
  aclk => clk,
    s_axis_a_tvalid => s_axis_a_tvalid,
    s_axis_a_tready => s_axis_a_tready1,
    s_axis_a_tdata => p_in,
    s_axis_b_tvalid => s_axis_b_tvalid,
    s_axis_b_tready => s_axis_b_tready1,
    s_axis_b_tdata => x_in,
    s_axis_c_tvalid => s_axis_c_tvalid,
    s_axis_c_tready => s_axis_c_tready1,
    s_axis_c_tdata => y_in,
    m_axis_result_tvalid => m_axis_result_tvalid1,
    m_axis_result_tdata => r_in
);

uut2: FPU_MUL port map (
     aclk => clk,
    s_axis_a_tvalid => s_axis_a_tvalid,
    s_axis_a_tready => s_axis_a_tready2,
    s_axis_a_tdata => r_in,
    s_axis_b_tvalid => s_axis_b_tvalid,
    s_axis_b_tready => s_axis_b_tready2,
    s_axis_b_tdata => q_in,
    m_axis_result_tvalid => m_axis_result_tvalid2,
    m_axis_result_tdata => f
);





end Behavioral;
