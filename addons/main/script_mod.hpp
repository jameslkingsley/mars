// COMPONENT should be defined in the script_component.hpp and included BEFORE this hpp

#define MAINPREFIX z
#define PREFIX mars
#define QMODNAME "Mars"

#define MAJOR 1
#define MINOR 0
#define PATCHLVL 0
#define BUILD 0

#define VERSION MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR MAJOR,MINOR,PATCHLVL,BUILD

#define REQUIRED_VERSION 1.56
#define REQUIRED_CBA_VERSION {2,3,1}

#define SIDE_WEST 1
#define SIDE_EAST 0
#define SIDE_GUER 2
#define SIDE_CIV 3
#define SIDE_EMPTY -1
