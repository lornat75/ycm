#.rst:
# FindPortAudio
# -------------
#
# Try to find the PortAudio library.

#=============================================================================
# Copyright 2008 RobotCub Consortium
#   Authors: Paul Fitzpatrick <paulfitz@alum.mit.edu>
#            Hatice Kose-Bagci
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

# hacked together for unix by Paul Fitzpatrick
# updated to work on windows by Hatice Kose-Bagci

IF(PKGCONFIG_EXECUTABLE)
	PKGCONFIG(portaudio-2.0 PORTAUDIO_INCLUDE_DIR PORTAUDIO_LINK_DIRECTORIES
			        PORTAUDIO_LIBRARIES PORTAUDIO_CFLAGS)
ENDIF(PKGCONFIG_EXECUTABLE)


IF (NOT PORTAUDIO_LIBRARIES)
  IF (WIN32)
	FIND_LIBRARY(PORTAUDIO_LIBRARY NAMES portaudio_x86 PATHS C:/portaudio/build/msvc/Debug_x86)
	GET_FILENAME_COMPONENT(PORTAUDIO_LINK_DIRECTORIES ${PORTAUDIO_LIBRARY} PATH)
	FIND_PATH(PORTAUDIO_INCLUDE_DIR portaudio.h C:/portaudio/include)

	SET(PORTAUDIO_LIBRARIES ${PORTAUDIO_LIBRARY})
  ENDIF (WIN32)
ENDIF (NOT PORTAUDIO_LIBRARIES)

#message(STATUS "inc: -${PORTAUDIO_INCLUDE_DIR}")
#message(STATUS "link flags: -${PORTAUDIO_LINK_FLAGS}")
#message(STATUS "cflags: -${PORTAUDIO_CFLAGS}")
#message(STATUS "link libs: -${PORTAUDIO_LIBRARIES}")

IF (PORTAUDIO_LIBRARIES)
	SET(PortAudio_FOUND TRUE)
ELSE (PORTAUDIO_LIBRARIES)
	SET(PortAudio_FOUND FALSE)
ENDIF (PORTAUDIO_LIBRARIES)

SET(PortAudio_LIBRARIES ${PORTAUDIO_LIBRARIES})
SET(PortAudio_INCLUDE_DIR ${PORTAUDIO_INCLUDE_DIR})
