#
# Copyright by The HDF Group.
# All rights reserved.
#
# This file is part of HDF5.  The full HDF5 copyright notice, including
# terms governing use, modification, and redistribution, is contained in
# the COPYING file, which can be found at the root of the source code
# distribution tree, or in https://support.hdfgroup.org/ftp/HDF5/releases.
# If you do not have access to either file, you may request a copy from
# help@hdfgroup.org.
#
#############################################################################################
####  Change default configuration of options in config/cmake/cacheinit.cmake file        ###
####  format: set(ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DXXX:YY=ZZZZ")                 ###
#############################################################################################

### uncomment/comment and change the following lines for other configuration options

#############################################################################################
### enable parallel builds
if (DEFINED MPI)
  # maximum parallel processor count for build and test       ####
  set (MAX_PROC_COUNT 8)
  set (ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DHDF5_ENABLE_PARALLEL:BOOL=ON")
  set (ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DHDF5_BUILD_CPP_LIB:BOOL=OFF")
  set (ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DHDF5_BUILD_JAVA:BOOL=OFF")
  set (ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DHDF5_ENABLE_THREADSAFE:BOOL=OFF")
endif ()
#############################################################################################
### options to run test scripts in batch commands
set (LOCAL_BATCH_SCRIPT_COMMAND "sbatch")
set (LOCAL_BATCH_TEST "TRUE")
set (LOCAL_BATCH_SCRIPT_NAME "ctestS.sl")
set (LOCAL_BATCH_SCRIPT_PARALLEL_NAME "ctestP.sl")
set (ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DLOCAL_BATCH_TEST:BOOL=ON")
set (ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DLOCAL_BATCH_SCRIPT_NAME:STRING=ctestS.sl")
set (ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DLOCAL_BATCH_SCRIPT_PARALLEL_NAME:STRING=ctestP.sl")
set (ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DMPIEXEC_EXECUTABLE:STRING=srun")
set (ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DMPIEXEC_NUMPROC_FLAG:STRING=-n")
set (ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DMPIEXEC_MAX_NUMPROCS:STRING=6")

#############################################################################################
### some additions and alternatives to cross compile on haswell for knl
#set (COMPILENODE_HWCOMPILE_MODULE "craype-haswell")
#set (COMPUTENODE_HWCOMPILE_MODULE "craype-mic-knl")
#set (SITE_BUILDNAME_SUFFIX "knl-intel17-SHARED"
#set (ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DLOCAL_BATCH_SCRIPT_NAME:STRING=knl_ctestS.sl")
#set (ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DLOCAL_BATCH_SCRIPT_PARALLEL_NAME:STRING=knl_ctestP.sl")
#############################################################################################