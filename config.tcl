# Vivado configuration
set project_name "hello_world"
set project_path "./vivado/project"
set part "xc7z010clg400-1"
set rtl_files "./vivado/src"
set constraints_file "./vivado/constraints/cora.xdc"
set top_module "leds"

# Vitis configuration
set app_name "hello_world"
set hw_platform "./vivado/project/${project_name}.bit"
set sw_platform "xilinx.com:standalone:1.0"
set domain "standalone"
set app_files "./vitis/src"