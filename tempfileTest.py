import tempfile
import os
from os.path import join

import subprocess, os, platform


with tempfile.NamedTemporaryFile(dir="tmp/",mode="w+b",delete=False,prefix="TEST",suffix=".pdf") as fp:
    with open ("a/03_hackaton_task.pdf","r") as file:
        x=file.read().replace('\n','')
        print(x)
        fp.write(bytes(x,"UTF8"))
        fp.seek(0)
        print(fp.read())
    if platform.system() == 'Darwin':      
        subprocess.call(('open', fp.name))
    elif platform.system() == 'Windows':  
        os.startfile(fp.name)
    else:                                 
        subprocess.call(('xdg-open', fp.name)) 
