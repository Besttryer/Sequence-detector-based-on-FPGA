set_property SRC_FILE_INFO {cfile:e:/FPGA/730/key_led/key_led.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc rfile:../../../key_led.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc id:1 order:EARLY scoped_inst:system_clock/inst} [current_design]
set_property SRC_FILE_INFO {cfile:E:/FPGA/730/key_led/key_led.srcs/constrs_1/new/sys.xdc rfile:../../../key_led.srcs/constrs_1/new/sys.xdc id:2} [current_design]
current_instance system_clock/inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
current_instance
set_property src_info {type:XDC file:2 line:2 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN H4 IOSTANDARD LVCMOS33} [get_ports clk]
set_property src_info {type:XDC file:2 line:6 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN D14 IOSTANDARD LVCMOS33} [get_ports rst_n]
set_property src_info {type:XDC file:2 line:9 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN C3 IOSTANDARD LVCMOS33} [get_ports key_1]
set_property src_info {type:XDC file:2 line:10 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN M4 IOSTANDARD LVCMOS33} [get_ports key_2]
set_property src_info {type:XDC file:2 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN N11 IOSTANDARD LVCMOS33} [get_ports o_rgb_led]
