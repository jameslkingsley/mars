import os
import sys
import re
import subprocess

AUTHOR = 'Kingsley'
ADDONS = '../addons/'
PREP = 'XEH_PREP.hpp'
EDITOR = 'C:/Program Files/Sublime Text 3/sublime_text.exe'

def createFunction(addon, name):
    funcPath = "{}{}/functions/fnc_{}.sqf".format(ADDONS, addon, name)
    prepPath = "{}{}/{}".format(ADDONS, addon, PREP)

    if os.path.exists(funcPath):
        print("Function already exists, exiting")
        return

    func = open(funcPath, "w")
    func.write('\
/*\n\
 * Author: {}\n\
 * \n\
 *\n\
 * Arguments:\n\
 * \n\
 *\n\
 * Return Value:\n\
 * \n\
 *\n\
 * Example:\n\
 * \n\
 *\n\
 * Public: \n\
 */\n\
\n\
#include "script_component.hpp"\n\
\n'.format(AUTHOR))
    func.close()

    prep = open(prepPath, "a")
    prep.write("PREP({});\n".format(name))
    prep.close()

    subprocess.Popen([EDITOR, funcPath])

def main():
    args = sys.argv
    
    if len(args) != 4:
        print('Usage: mars.py -f <addon> <function name>')
        sys.exit(2)
    
    method = args[-3]
    addon = args[-2]
    name = args[-1]

    {
        '-f': createFunction(addon, name)
    }.get(method, -1)

if __name__ == '__main__':
    main()
