## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0 5} [get_ports clk]

## Reset button
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

## LEDs for final_result[7:0]
set_property PACKAGE_PIN U16 [get_ports {final_result[0]}]
set_property PACKAGE_PIN E19 [get_ports {final_result[1]}]
set_property PACKAGE_PIN U19 [get_ports {final_result[2]}]
set_property PACKAGE_PIN V19 [get_ports {final_result[3]}]
set_property PACKAGE_PIN W18 [get_ports {final_result[4]}]
set_property PACKAGE_PIN U15 [get_ports {final_result[5]}]
set_property PACKAGE_PIN U14 [get_ports {final_result[6]}]
set_property PACKAGE_PIN V14 [get_ports {final_result[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports {final_result[*]}]