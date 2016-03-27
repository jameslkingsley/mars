import sys
import os
import re
import glob
import time

rptdir = 'C:\\Users\\James\\AppData\\Local\\Arma 3\\*.rpt'
current = ''

while True:
    newest = max(glob.iglob(rptdir), key=os.path.getctime)
    
    if newest != current:
        current = newest
    
    f = open(current, "r")
    
    while True:
        line = f.readline()
        if line:
            print(line.strip('\n'))
        else:
            time.sleep(0.1)
            
    time.sleep(1)

input()