import os
import sys
import re
import subprocess
import textwrap

PREFIX = 'mars'
AUTHOR = 'Kingsley'
ADDONS = '../addons/'
PREP = 'XEH_PREP.hpp'
EDITOR = 'C:/Program Files/Sublime Text 3/sublime_text.exe'

def getFunctionPath(addon, name):
    return "{}{}/functions/fnc_{}.sqf".format(ADDONS, addon, name)

def getPrepPath(addon):
    return "{}{}/{}".format(ADDONS, addon, PREP)

def appendPrep(addon, name):
    prepPath = getPrepPath(addon)
    prep = open(prepPath, "a")
    prep.write("PREP({});\n".format(name))
    prep.close()

def openFile(file):
    subprocess.Popen([EDITOR, file])

def createFunction(addon, name, contents=''):
    function = getFunctionPath(addon, name)

    if os.path.exists(function):
        print("Function already exists, exiting")
        return

    file = open(function, "w")

    if contents == '':
        file.write(textwrap.dedent('''\
            /*
             * Author: {0}
             * 
             *
             * Arguments:
             * 
             *
             * Return Value:
             * 
             *
             * Example:
             * [] call {3}_{1}_fnc_{2};
             *
             * Public: 
             */

            #include "script_component.hpp"
            ''').format(AUTHOR, addon, name, PREFIX))
    else:
        file.write(contents)

    file.close()

    appendPrep(addon, name)
    openFile(function)

def deleteFunction(addon, name):
    function = getFunctionPath(addon, name)

    if not os.path.exists(function):
        print("Function does not exist")
        return

    os.remove(function)

    file = open(getPrepPath(addon), 'r+')
    lines = file.readlines()
    file.seek(0)

    for line in lines:
        if line != "PREP({0});\n".format(name):
            file.write(line)

    file.truncate()
    file.close()

def moveFunction(addon, name, newAddon):
    contents = ''
    with open(getFunctionPath(addon, name)) as file:
        contents = file.read()
    deleteFunction(addon, name)
    createFunction(newAddon, name, contents)

def renameFunction(addon, name, newName):
    contents = ''
    with open(getFunctionPath(addon, name)) as file:
        contents = file.read()
    deleteFunction(addon, name)
    createFunction(addon, newName, contents)

def main():
    args = sys.argv

    if "-cf" in args:
        createFunction(args[2], args[3])
        sys.exit(2)

    if "-df" in args:
        deleteFunction(args[2], args[3])
        sys.exit(2)

    if "-rf" in args:
        renameFunction(args[2], args[3], args[4])
        sys.exit(2)

    if "-mf" in args:
        moveFunction(args[2], args[3], args[4])
        sys.exit(2)

if __name__ == '__main__':
    main()
