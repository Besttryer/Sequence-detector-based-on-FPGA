# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param synth.incrementalSynthesisCache C:/Users/lv/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado-19472-LAPTOP-B2R9HB2C/incrSyn
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7s15ftgb196-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir E:/FPGA/730/key_led/key_led.cache/wt [current_project]
set_property parent.project_path E:/FPGA/730/key_led/key_led.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo e:/FPGA/730/key_led/key_led.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  E:/FPGA/730/key_led/key_led.srcs/sources_1/new/Driver_Breath_LED.v
  E:/FPGA/730/key_led/key_led.srcs/sources_1/new/Driver_RGB_LED.v
  E:/FPGA/730/key_led/key_led.srcs/sources_1/new/Key_Test_Color.v
  E:/FPGA/730/key_led/key_led.srcs/sources_1/new/RGB.v
  E:/FPGA/730/key_led/key_led.srcs/sources_1/new/XLJC.v
  E:/FPGA/730/key_led/key_led.srcs/sources_1/new/clk_division.v
  E:/FPGA/730/key_led/key_led.srcs/sources_1/new/en_out.v
  E:/FPGA/730/key_led/key_led.srcs/sources_1/new/key_filter.v
  E:/FPGA/730/key_led/key_led.srcs/sources_1/new/top.v
}
read_ip -quiet e:/FPGA/730/key_led/key_led.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
set_property used_in_implementation false [get_files -all e:/FPGA/730/key_led/key_led.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
set_property used_in_implementation false [get_files -all e:/FPGA/730/key_led/key_led.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
set_property used_in_implementation false [get_files -all e:/FPGA/730/key_led/key_led.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc E:/FPGA/730/key_led/key_led.srcs/constrs_1/new/sys.xdc
set_property used_in_implementation false [get_files E:/FPGA/730/key_led/key_led.srcs/constrs_1/new/sys.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top top -part xc7s15ftgb196-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]