# Import configuration
source ./config.tcl

# Open project
open_project ${project_path}/${project_name}.xpr

# Add sources and constraints, and set the top module
add_files -fileset sources_1 ${rtl_files}
add_files -fileset constrs_1 ${constraints_file}
set_property top $top_module [current_fileset]