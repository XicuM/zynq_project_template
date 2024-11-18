# Import configuration
source ./config.tcl

# Program the Zynq processor
open_hw_manager
connect_hw_server
open_hw_target

# Get the hardware device
current_hw_device [lindex [get_hw_devices] 0]

# Program the FPGA
set_property PROGRAM.FILE {./path/to/your/bitstream.bit} [current_hw_device]
program_hw_devices [current_hw_device]

# Refresh the hardware device
refresh_hw_device [current_hw_device]

# Load the software application
set_property PROGRAM.FILE {./path/to/your/bootloader.elf} [current_hw_device]
program_hw_devices [current_hw_device]

# Close the hardware server connection
close_hw_target
disconnect_hw_server
close_hw_manager