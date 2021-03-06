# This file is NOT licensed under the GPLv3, which is the license for the rest
# of YouCompleteMe.
#
# Here's the license text for this file:
#
# This is free and unencumbered software released into the public domain.
#
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
#
# In jurisdictions that recognize copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# For more information, please refer to <http://unlicense.org/>

import os
import ycm_core

# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.
flags = [
'-Wall',
'-Wextra',
'-Werror',
'-Wc++98-compat',
'-Wno-long-long',
'-Wno-variadic-macros',
'-fexceptions',
'-DNDEBUG',
# You 100% do NOT need -DUSE_CLANG_COMPLETER in your flags; only the YCM
# source code needs it.
#'-DUSE_CLANG_COMPLETER',
# THIS IS IMPORTANT! Without a "-std=<something>" flag, clang won't know which
# language to use when compiling headers. So it will guess. Badly. So C++
# headers will be compiled as C headers. You don't want that so ALWAYS specify
# a "-std=<something>".
# For a C project, you would set this to something like 'c99' instead of
# 'c++11'.
'-std=c++11',
# ...and the same thing goes for the magic -x option which specifies the
# language that the files to be compiled are written in. This is mostly
# relevant for c++ headers.
# For a C project, you would set this to 'c' instead of 'c++'.
'-x',
'c++',
'-isystem',
'../BoostParts',
'-isystem',
# This path will only work on OS X, but extra paths that don't exist are not
# harmful
'/System/Library/Frameworks/Python.framework/Headers',
'-isystem',
'../llvm/include',
'-isystem',
'../llvm/tools/clang/include',
'-I',
'.',
'-I',
'./ClangCompleter',
'-I', './src/',
'-I', './src/include/',
'-I', './include/',
'-I', './ocean_libraries/OceanLIB/Branches/OceanLIB_Commercial/OceanLIB_.NET2008/dep/gsl/1.8/include/',
'-I', './ocean_libraries/OceanLIB/Trunk/OceanLIB/include/',
'-I', './event_bus/src/event_bus/include/',
'-I', './solar/src/seebyte_sensor/include/',
'-I', './solar/src/seebyte_capabilities/include/',
'-I', './solar/src/node_interface/include/',
'-I', './solar/src/vehicle_interface/include/',
'-I', './dock-manager/catkin_ws/src/dock_controller_interface/include/',
'-I', './dock-manager/catkin_ws/src/dock_manager/include/',
'-I', './vehicle_interfaces/arcims_node/src/ois_usv/include/',
'-I', './vehicle_interfaces/arcims_node/src/arcims_usv/include/',
'-I', './vehicle_interfaces/arcims_node/src/solar_vehicle_interface/include/',
'-I', './vehicle_interfaces/iver_node/src/remote_helm/include/',
'-I', './vehicle_interfaces/iver_node/src/oceanserver_iver/include/',
'-I', './vehicle_interfaces/remus_node/src/remus_node/include/',
'-I', './vehicle_interfaces/halcyon_node/src/halcyon_node/include/',
'-I', './vehicle_interfaces/oceanscan/ros-imc-broker/workspace/src/ros_imc_broker/include/',
'-I', './vehicle_interfaces/halcyon_interface/src/halcyon_interace/include/',
'-I', './vehicle_interfaces/lauv_node/src/oceanscan_lauv/include/',
'-I', './neptune_simulator/src/seebyte_simulator_manager/include/',
'-I', './neptune_simulator/src/seebyte_atr_simulator/include/',
'-I', './neptune_simulator/src/seebyte_event_manager/include/',
'-I', './neptune_simulator/src/seebyte_simulator_clock/include/',
'-I', './neptune_simulator/src/seebyte_internal_simulator/include/',
'-I', './SeeByteToolkit/Branches/sbtk-planning-new-framework/src/include/',
'-I', './SeeByteToolkit/Misc/ProofOfConcept/sbtk-sonar-file-readers/trunk/src/include/',
'-I', './SeeByteToolkit/Misc/ProofOfConcept/sbtk-types/trunk/include/',
'-I', './SeeByteToolkit/Misc/ProofOfConcept/sbtk-geometry/trunk/include/',
'-I', './SeeByteToolkit/Misc/ProofOfConcept/sbtk-nav/trunk/include/',
'-I', './SeeByteToolkit/Misc/ProofOfConcept/sbtk-mshdf/trunk/src/include/',
'-I', './seebyte_feature_follow/src/seebyte_feature_follow/include/',
'-I', './seebyte_uuv_transit/src/seebyte_uuv_transit/include/',
'-I', './neptune/src/seebyte_comms/seebyte_acomms_udp_bridge/include/',
'-I', './neptune/src/seebyte_comms/seebyte_world_model_interface/include/',
'-I', './neptune/src/seebyte_exclusion_zone/seebyte_exclusion_zone_server/include/',
'-I', './neptune/src/seebyte_exclusion_zone/seebyte_exclusion_zone_interface/include/',
'-I', './neptune/src/seebyte_behavior/seebyte_behavior_core/include/',
'-I', './neptune/src/seebyte_behavior/seebyte_behaviors/seebyte_survey_area/include/',
'-I', './neptune/src/seebyte_behavior/seebyte_behaviors/seebyte_wait/include/',
'-I', './neptune/src/seebyte_behavior/seebyte_behaviors/seebyte_survey_target/include/',
'-I', './neptune/src/seebyte_behavior/seebyte_behaviors/seebyte_spiral/include/',
'-I', './neptune/src/seebyte_behavior/seebyte_behaviors/seebyte_go_to/include/',
'-I', './neptune/src/seebyte_quadtree/include/',
'-I', './neptune/src/seebyte_toolkit_interface/include/',
'-I', './neptune/src/seebyte_neptune/seebyte_arbiter/seebyte_arbiters/seebyte_arbiter/include/',
'-I', './neptune/src/seebyte_neptune/seebyte_arbiter/seebyte_arbiter_core/include/',
'-I', './neptune/src/seebyte_support/seebyte_seetrack_nav/include/',
'-I', './neptune/src/seebyte_visualisation/seebyte_mission_visualiser/include/',
'-I', './sonar/src/seebyte_sidescan_ftp/include/',
'-I', './whoi_modem/src/seebyte_whoi_modem/include/',
'-I', './whoi_modem/src/seebyte_whoi_modem_msgs/include/',
'-I', './neptune_tutorials/src/tutorial_subtask_delegation/subtask_delegation/include/',
'-I', './neptune_tutorials/src/tutorial_subtask_delegation/simple_transit/include/',
'-I', './neptune_tutorials/src/tutorial_zone_injection/zone_injection_function/include/',
'-I', './neptune_tutorials/src/tutorial_leg_callbacks/include/',
'-I', './neptune_tutorials/src/tutorial_vehicle_interface/simple_vehicle_interface/include/',
'-I', './neptune_tutorials/src/tutorial_leg_requests/include/',
'-I', './neptune_tutorials/src/tutorial_01_simple_survey/simple_survey/include/',
'-I', './neptune_tutorials/src/tutorial_custom_action_survey/custom_action_survey/include/',
'-I', './neptune_tutorials/src/tutorial_override/override_behavior/include/',
'-isystem', '/opt/seebyte/include',
'-isystem', '/opt/ros/indigo/include',
'-isystem', '/usr/lib/gcc/x86_64-linux-gnu/4.8/include',
'-isystem', '/usr/local/include',
'-isystem', '/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed',
'-isystem', '/usr/include/x86_64-linux-gnu',
'-isystem', '/usr/include',
'-isystem',
'./tests/gmock/gtest',
'-isystem',
'./tests/gmock/gtest/include',
'-isystem',
'./tests/gmock',
'-isystem',
'./tests/gmock/include',
]


# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
#
# You can get CMake to generate this file for you by adding:
#   set( CMAKE_EXPORT_COMPILE_COMMANDS 1 )
# to your CMakeLists.txt file.
#
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags. Notice that YCM itself uses that approach.
compilation_database_folder = ''

if os.path.exists( compilation_database_folder ):
  database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
  database = None

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ]

def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )


def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):
  if not working_directory:
    return list( flags )
  new_flags = []
  make_next_absolute = False
  path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]
  for flag in flags:
    new_flag = flag

    if make_next_absolute:
      make_next_absolute = False
      if not flag.startswith( '/' ):
        new_flag = os.path.join( working_directory, flag )

    for path_flag in path_flags:
      if flag == path_flag:
        make_next_absolute = True
        break

      if flag.startswith( path_flag ):
        path = flag[ len( path_flag ): ]
        new_flag = path_flag + os.path.join( working_directory, path )
        break

    if new_flag:
      new_flags.append( new_flag )
  return new_flags


def IsHeaderFile( filename ):
  extension = os.path.splitext( filename )[ 1 ]
  return extension in [ '.h', '.hxx', '.hpp', '.hh' ]


def GetCompilationInfoForFile( filename ):
  # The compilation_commands.json file generated by CMake does not have entries
  # for header files. So we do our best by asking the db for flags for a
  # corresponding source file, if any. If one exists, the flags for that file
  # should be good enough.
  if IsHeaderFile( filename ):
    basename = os.path.splitext( filename )[ 0 ]
    for extension in SOURCE_EXTENSIONS:
      replacement_file = basename + extension
      if os.path.exists( replacement_file ):
        compilation_info = database.GetCompilationInfoForFile(
          replacement_file )
        if compilation_info.compiler_flags_:
          return compilation_info
    return None
  return database.GetCompilationInfoForFile( filename )


def FlagsForFile( filename, **kwargs ):
  if database:
    # Bear in mind that compilation_info.compiler_flags_ does NOT return a
    # python list, but a "list-like" StringVec object
    compilation_info = GetCompilationInfoForFile( filename )
    if not compilation_info:
      return None

    final_flags = MakeRelativePathsInFlagsAbsolute(
      compilation_info.compiler_flags_,
      compilation_info.compiler_working_dir_ )

    # NOTE: This is just for YouCompleteMe; it's highly likely that your project
    # does NOT need to remove the stdlib flag. DO NOT USE THIS IN YOUR
    # ycm_extra_conf IF YOU'RE NOT 100% SURE YOU NEED IT.
    try:
      final_flags.remove( '-stdlib=libc++' )
    except ValueError:
      pass
  else:
    relative_to = DirectoryOfThisScript()
    final_flags = MakeRelativePathsInFlagsAbsolute( flags, relative_to )

  return { 'flags': final_flags }
