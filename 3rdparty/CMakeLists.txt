#=============================================================================
# Copyright 2013-2014 iCub Facility, Istituto Italiano di Tecnologia
#   Authors: Daniele E. Domenichelli <daniele.domenichelli@iit.it>
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distribute this file outside of YCM, substitute the full
#  License text for the above reference.)


option(YCM_NO_3RDPARTY "Disable 3rd party modules." FALSE)
mark_as_advanced(YCM_NO_3RDPARTY)

# Useful 3rd party modules
if(NOT YCM_NO_3RDPARTY)
    # FindEigen3.cmake is installed automatically by libeigen3-dev on some
    # Debian and Ubuntu releases
    if(NOT EXISTS ${CMAKE_ROOT}/FindEigen3.cmake)
        set(_files COPYING.BSD             8fa159b3e41e0a44e10ea224cbb83e66ae02885e
                   cmake/FindEigen3.cmake  cb8ad72f9a74e9f214f0d5dd58af78dec68664b5)
        set(_ref 3.2.1)
        set(_dir ${CMAKE_CURRENT_BINARY_DIR}/eigen3)

        _ycm_download(3rdparty-eigen "Eigen mercurial repository"
                      "https://bitbucket.org/eigen/eigen/raw/<REF>/<FILE>"
                      ${_ref} ${_dir} "${_files}")
        file(WRITE ${_dir}/README.Eigen
"Files in this folder and its subfolder come from Eigen mercurial repository
(ref ${_ref}):

  https://bitbucket.org/eigen/eigen

They were imported exactly as they are on the original repository, in
order to import new features.

Redistribution and use is allowed according to the terms of the 2-clause
BSD license. See accompanying file COPYING.Eigen for details.
")


        _ycm_install(3rdparty-eigen FILES ${CMAKE_CURRENT_BINARY_DIR}/eigen3/cmake/FindEigen3.cmake
                                    DESTINATION ${YCM_INSTALL_MODULE_DIR}/3rdparty)

        _ycm_install(3rdparty-eigen FILES ${CMAKE_CURRENT_BINARY_DIR}/eigen3/COPYING.BSD
                                    DESTINATION ${YCM_INSTALL_MODULE_DIR}/3rdparty
                                    RENAME COPYING.Eigen)
    endif()
endif()
