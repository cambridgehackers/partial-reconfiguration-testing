###############################################################
###   Tcl Variables
###############################################################
####Define location for "Tcl" directory. Defaults to "./Tcl"
set tclHome "./scripts/tcl"
if {[file exists $tclHome]} {
   set tclDir $tclHome
} elseif {[file exists "./tcl"]} {
   set tclDir  "./tcl"
} else {
   error "ERROR: No valid location found for required Tcl scripts. Set \$tclDir in design.tcl to a valid location."
}
puts "Setting TCL dir to $tclDir"

####Source required Tcl Procs
source $tclDir/design_utils.tcl
source $tclDir/log_utils.tcl
source $tclDir/synth_utils.tcl
source $tclDir/impl_utils.tcl
source $tclDir/hd_floorplan_utils.tcl

###############################################################
### Define Part, Package, Speedgrade 
###############################################################
set device       "xc7z020"
set package      "clg484"
set speed        "-1"
set part         $device$package$speed
check_part $part

###############################################################
###  Setup Variables
###############################################################
#set tclParams [list <param1> <value> <param2> <value> ... <paramN> <value>]
set tclParams [list hd.visual 1 \
              ]

####flow control
set run.rmSynth        1
set run.prImpl         1
set run.prVerify       1
set run.writeBitstream 1
set run.flatImpl       0

####Report and DCP controls - values: 0-required min; 1-few extra; 2-all
set verbose      1
set dcpLevel     1

####Output Directories
set synthDir  "./Synth"
set implDir   "./Implement"
set dcpDir    "./Checkpoint"
set bitDir    "./Bitstreams"

####Input Directories
set srcDir     "./srcs"
set xdcDir     "./constrs"
set rtlDir     "$srcDir/hdl"
set ipDir      "$srcDir/ip"
set prjDir     "$srcDir/prj"

###############################################################
### Top Definition
###############################################################
set top "system_top_wrapper"
set static "static"
add_module $static
set_attribute module $static moduleName      $top
set_attribute module $static top_level       1
set_attribute module $static synthCheckpoint $srcDir/dcp/system_top_wrapper.dcp

####################################################################
### RP Module Definitions
####################################################################
set module1 "system_top_image_filter_1_0"

set module1_variant1 "fast_corners"
set variant $module1_variant1
add_module $variant
set_attribute module $variant moduleName   $module1
set_attribute module $variant prj          $prjDir/$variant.prj
set_attribute module $variant xdc          $ipDir/$variant/constraints/image_filter_ooc.xdc
set_attribute module $variant synth        ${run.rmSynth}

set module1_variant2 "sobel"
set variant $module1_variant2
add_module $variant
set_attribute module $variant moduleName   $module1
set_attribute module $variant prj          $prjDir/$variant.prj
set_attribute module $variant xdc          $ipDir/$variant/constraints/image_filter_ooc.xdc
set_attribute module $variant synth        ${run.rmSynth}

set module1_variant3 "simple_posterize"
set variant $module1_variant3
add_module $variant
set_attribute module $variant moduleName   $module1
set_attribute module $variant prj          $prjDir/$variant.prj
set_attribute module $variant xdc          $ipDir/$variant/constraints/image_filter_ooc.xdc
set_attribute module $variant synth        ${run.rmSynth}

set module1_inst1 "system_top_i/processing/image_filter_1"

########################################################################
### Configuration (Implementation) Definition - Replicate for each Config
########################################################################
set config "Config_${module1_variant1}" 

add_implementation $config
set_attribute impl $config top             $top
set_attribute impl $config pr.impl         1
set_attribute impl $config implXDC         [list $xdcDir/system_top_timing.xdc \
                                                 $xdcDir/system_top_pin.xdc \
                                                 $xdcDir/system_top_pblock.xdc \
                                           ]
set_attribute impl $config impl            ${run.prImpl} 
set_attribute impl $config partitions      [list [list $static           $top           implement] \
                                                 [list $module1_variant1 $module1_inst1 implement] \
                                           ]
set_attribute impl $config verify          ${run.prVerify} 
set_attribute impl $config bitstream       ${run.writeBitstream} 
set_attribute impl $config cfgmem.pcap     1

########################################################################
### Configuration (Implementation) Definition - Replicate for each Config
########################################################################
set config "Config_${module1_variant2}" 

add_implementation $config
set_attribute impl $config top             $top
set_attribute impl $config pr.impl         1
set_attribute impl $config implXDC         [list $xdcDir/system_top_timing.xdc \
                                                 $xdcDir/system_top_pin.xdc \
                                                 $xdcDir/system_top_pblock.xdc \
                                           ]
set_attribute impl $config impl            ${run.prImpl} 
set_attribute impl $config partitions      [list [list $static           $top           import]    \
                                                 [list $module1_variant2 $module1_inst1 implement] \
                                           ]
set_attribute impl $config verify          ${run.prVerify} 
set_attribute impl $config bitstream       ${run.writeBitstream}
set_attribute impl $config cfgmem.pcap     1

########################################################################
### Configuration (Implementation) Definition - Replicate for each Config
########################################################################
set config "Config_${module1_variant3}"

add_implementation $config
set_attribute impl $config top             $top
set_attribute impl $config pr.impl         1
set_attribute impl $config implXDC         [list $xdcDir/system_top_timing.xdc \
                                                 $xdcDir/system_top_pin.xdc \
                                                 $xdcDir/system_top_pblock.xdc \
                                           ]
set_attribute impl $config impl            ${run.prImpl} 
set_attribute impl $config partitions      [list [list $static           $top           import]    \
                                                 [list $module1_variant3 $module1_inst1 implement] \
                                           ]
set_attribute impl $config verify          ${run.prVerify} 
set_attribute impl $config bitstream       ${run.writeBitstream} 
set_attribute impl $config cfgmem.pcap     1

####################################################################
### Create Flat implementation run 
####################################################################

add_implementation Flat
set_attribute impl Flat top          $top
set_attribute impl Flat implXDC      [list $xdcDir/system_top_timing.xdc \
                                           $xdcDir/system_top_pin.xdc \
                                           $xdcDir/system_top_pblock.xdc \
                                     ]
set_attribute impl Flat partitions   [list [list $static           $top           implement] \
                                           [list $module1_variant1 $module1_inst1 implement] \
                                     ]
set_attribute impl Flat impl         ${run.flatImpl}

########################################################################
### Task / flow portion
########################################################################
source $tclDir/run.tcl

exit
