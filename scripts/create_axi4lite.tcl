# Import configuration
source ./config.tcl

# Open project
open_project ${project_path}/${project_name}.xpr

# Create a new block design
create_bd_design "design_1"

# Create a processing system (PS) block
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 ps7
apply_bd_automation \
    -rule xilinx.com:bd_rule:processing_system7 \
    -config { \
        make_external "FIXED_IO, DDR" \
        apply_board_preset "1" \
        Master "Disable" \
        Slave "Disable" \
    } [get_bd_cells ps7]

# Add and configure AXI4Lite IP core
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_lite_ipif:3.0 axi4lite
set_property -dict [ \
    list CONFIG.C_S_AXI_ADDR_WIDTH {32} \
    CONFIG.C_S_AXI_DATA_WIDTH {32} \
] [get_bd_cells axi4lite]


# Make connections between PS and AXI4Lite
connect_bd_intf_net [get_bd_intf_pins ps7/M_AXI_GP0] \
    [get_bd_intf_pins axi4lite/S_AXI]

# Validate and save the design
regenerate_bd_layout
validate_bd_design
save_bd_design

# Create HDL wrapper
make_wrapper -files [ \
    get_files ./my_axi4lite_project.srcs/sources_1/bd/design_1/design_1.bd \
] -top