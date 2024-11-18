# Import configuration
source ./config.tcl

# Create a new project
create_project $project_name ${project_path} -part $part
set_property target_language verilog [current_project]

# Close project
close_project