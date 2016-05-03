set(MARS_EXTENSION_NAME "mars_editor")

file(GLOB SOURCES *.h *.hpp *.c *.cpp)

add_library( ${MARS_EXTENSION_NAME} SHARED ${SOURCES} ${GLOBAL_SOURCES})

target_link_libraries( ${MARS_EXTENSION_NAME} ${CMAKE_CURRENT_SOURCE_DIR}../../../tools/intercept/build/win32/intercept_client/Debug/intercept_client.lib)

include_directories( ${CMAKE_CURRENT_SOURCE_DIR}../../../tools/intercept/src/client/headers)
include_directories( ${CMAKE_CURRENT_SOURCE_DIR}../../../tools/intercept/src/client/headers/client/sqf)

set_target_properties( ${MARS_EXTENSION_NAME} PROPERTIES PREFIX "")
set_target_properties( ${MARS_EXTENSION_NAME} PROPERTIES FOLDER Extensions)

if (CMAKE_COMPILER_IS_GNUCXX)
	set_target_properties( ${MARS_EXTENSION_NAME} PROPERTIES LINK_SEARCH_START_STATIC 1)
	set_target_properties( ${MARS_EXTENSION_NAME} PROPERTIES LINK_SEARCH_END_STATIC 1)
endif()