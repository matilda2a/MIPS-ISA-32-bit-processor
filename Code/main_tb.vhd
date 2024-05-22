library IEEE;
use IEEE.std_logic_1164.all;

entity main_tb is
end main_tb;

architecture tb_arch of main_tb is
    -- Constants
    constant CLOCK_PERIOD: time := 10 ns; -- Example clock period

    -- Signals
    signal clk: std_logic := '0'; -- Clock signal
    signal reset: std_logic := '0'; -- Reset signal
    signal ck_tb: std_logic := '0'; -- Clock for the testbench

begin
    -- Clock process
    clk_process: process
    begin
        while now < 1000 ns loop -- Simulation duration (adjust as needed)
            clk <= not clk;
            wait for CLOCK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Main entity instantiation
    dut: entity work.main
        port map (
            ck => clk
        );

    -- Stimulus process
    stimulus_process: process
    begin
        -- Apply reset
        reset <= '1';
        wait for 20 ns; -- Reset duration
        reset <= '0';
	   
        wait;
    end process;

end tb_arch;
