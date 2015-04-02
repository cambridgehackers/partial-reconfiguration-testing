####################
# Partial Reconfig #
####################

create_pblock pblock_image_filter_1
add_cells_to_pblock [get_pblocks pblock_image_filter_1] [get_cells -quiet [list system_top_i/processing/image_filter_1]]
resize_pblock [get_pblocks pblock_image_filter_1] -add {SLICE_X50Y0:SLICE_X109Y49}
resize_pblock [get_pblocks pblock_image_filter_1] -add {DSP48_X3Y0:DSP48_X4Y19}
resize_pblock [get_pblocks pblock_image_filter_1] -add {RAMB18_X3Y0:RAMB18_X5Y19}
resize_pblock [get_pblocks pblock_image_filter_1] -add {RAMB36_X3Y0:RAMB36_X5Y9}
set_property RESET_AFTER_RECONFIG true [get_pblocks pblock_image_filter_1]
set_property HD.RECONFIGURABLE true [get_cells system_top_i/processing/image_filter_1]
