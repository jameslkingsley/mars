cmake_minimum_required (VERSION 3.0)
project (MARS)

set_property(GLOBAL PROPERTY USE_FOLDERS ON) 

if (WIN32) 
	add_definitions(/DWINVER=0x0600 /D_WIN32_WINNT=0x0600)
endif()

if (NOT CMAKE_BUILD_TYPE AND CMAKE_COMPILER_IS_GNUCXX)
	message(STATUS "No build type selected, default to Debug")
	set(CMAKE_BUILD_TYPE "Debug")
endif()

option(USE_STATIC_LINKING "USE_STATIC_LINKING" ON)

if (CMAKE_COMPILER_IS_GNUCXX)
	SET(CMAKE_CXX_FLAGS "-std=c++11 -pedantic -pedantic-errors -march=i686 -m32 -O2 -s -fPIC -fpermissive")
	set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")
	set(CMAKE_SHARED_LINKER_FLAGS "-static-libgcc -static-libstdc++")
elseif (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    message(ERROR "SUPPORT NOT COMPLETE")
elseif (CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /Wall /arch:SSE2 /Qpar-report:2")
	set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS} /D _DEBUG /MDd /Zi /Ob0 /Od /RTC1")
	set(CMAKE_CXX_FLAGS_MINSIZEREL "${CMAKE_CXX_FLAGS} /MD /O1 /Ob1 /D NDEBUG")
	set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS} /MD /O2 /Ob2 /D NDEBUG")
	set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS} /MD /Zi /O2 /Ob1 /D NDEBUG")
endif()

set(OUTPUT_BINDIR ${PROJECT_SOURCE_DIR}../../intercept/)
set(OUTPUT_LIBDIR ${PROJECT_SOURCE_DIR}../../intercept/)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${OUTPUT_LIBDIR} CACHE PATH "build directory")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${OUTPUT_BINDIR} CACHE PATH "build directory")

if(WIN32)
	set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ${OUTPUT_BINDIR} CACHE PATH "build directory")
else(WIN32)
	set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${OUTPUT_LIBDIR} CACHE PATH "build directory")
endif(WIN32)

# For each configuration (Debug, Release, MinSizeRel... and/or anything the user chooses)
foreach(CONF ${CMAKE_CONFIGURATION_TYPES})
	string(TOUPPER "${CONF}" CONF)
	set("CMAKE_ARCHIVE_OUTPUT_DIRECTORY_${CONF}" "${OUTPUT_LIBDIR}")
	set("CMAKE_RUNTIME_OUTPUT_DIRECTORY_${CONF}" "${OUTPUT_BINDIR}")
	
	if(WIN32)
		set("CMAKE_LIBRARY_OUTPUT_DIRECTORY_${CONF}" "${OUTPUT_BINDIR}")
	else()
		set("CMAKE_LIBRARY_OUTPUT_DIRECTORY_${CONF}" "${OUTPUT_LIBDIR}")
	endif()
endforeach()

string(TIMESTAMP MARS_BUILDSTAMP "%Y-%m-%dT%H:%M:%SZ")
set(MARS_VERSION_MAJOR 1)
set(MARS_VERSION_MINOR 0)
set(MARS_VERSION_REVISION 0)
set(MARS_VERSION_BUILD 0)

message("Building for: " ${MARS_VERSION_MAJOR}.${MARS_VERSION_MINOR}.${MARS_VERSION_REVISION}-${MARS_VERSION_BUILD})

# Extensions
add_subdirectory(editor)
add_subdirectory(ai)

message("Build Type: ${CMAKE_BUILD_TYPE}")