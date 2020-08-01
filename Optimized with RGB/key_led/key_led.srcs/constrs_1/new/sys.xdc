## Clock signal 100 MHz
set_property -dict {PACKAGE_PIN H4 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]

#RST
set_property -dict {PACKAGE_PIN D14 IOSTANDARD LVCMOS33} [get_ports rst_n]

#Key
set_property -dict {PACKAGE_PIN C3 IOSTANDARD LVCMOS33} [get_ports key_1]
set_property -dict {PACKAGE_PIN M4 IOSTANDARD LVCMOS33} [get_ports key_2]

#RGB LED
set_property -dict {PACKAGE_PIN N11 IOSTANDARD LVCMOS33} [get_ports o_rgb_led]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
