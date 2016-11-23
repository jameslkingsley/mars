import sys
import os
import time
from PIL import Image
from subprocess import call

def processFile(iconSrc, name):
    exportOff = "icons/png/{}_off_ca.png".format(name)
    exportOn = "icons/png/{}_on_ca.png".format(name)
    paaOff = "icons/paa/{}_off_ca.paa".format(name)
    paaOn = "icons/paa/{}_on_ca.paa".format(name)

    box = Image.new("RGBA", (64, 64))

    border = Image.open('../extras/toolbar/xxx_on_ca.png')
    border = border.convert("RGBA")

    icon = Image.open(iconSrc)
    icon = icon.convert("RGBA")
    iconData = icon.getdata()

    newData = []
    for item in iconData:
        if item[0] == 0 and item[1] == 0 and item[2] == 0:
            newData.append((255, 255, 255, 255))
        else:
            newData.append((255, 255, 255, 0))

    icon.putdata(newData)
    icon.thumbnail((48, 48), Image.ANTIALIAS)

    box.paste(icon, (8, 8))
    box.save(exportOff, "PNG")

    box.paste(border)
    box.paste(icon, (8, 8))
    box.save(exportOn, "PNG")

    call(["D:\SteamLibrary\steamapps\common\Arma 3 Tools\TexView2\Pal2PacE.exe", exportOff, paaOff])
    call(["D:\SteamLibrary\steamapps\common\Arma 3 Tools\TexView2\Pal2PacE.exe", exportOn, paaOn])

def main():
    method = sys.argv[1]

    if method == "-f":
        iconSrc = sys.argv[2]
        name = sys.argv[3]
        processFile(iconSrc, name)
        sys.exit(2)

    if method == "-d":
        folder = sys.argv[2]
        for file in os.listdir(folder):
            if file.endswith('.png'):
                fullPath = os.path.abspath(os.path.join(folder, file))
                name = os.path.basename(file).split('.')[0]
                name = name.replace("-", "_")
                # print(name)
                processFile(fullPath, name)
        sys.exit(2)

if __name__ == '__main__':
    main()
