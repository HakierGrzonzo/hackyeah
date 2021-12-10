from os import listdir
from os.path import isfile, join
import os
import magic
from pathlib import Path
ext =[ '.txt', '.rtf', '.pdf', '.xps', '.odt', '.ods', '.odp', '.doc', '.xls', '.ppt', '.docx', '.xlsx', '.pptx', '.csv', '.jpg', '.tif', 
'.geotif', '.png', '.svg', '.wav', '.mp3', '.avi', '.mpg', '.mp4', '.ogg', '.ogv', '.zip', '.tar', '.gz', '.7Z', '.html','.xhtml', '.css', 
'.xml', '.xsd','gml', '.rng', '.xsl', '.xslt','TSL', 'XMLsig', 'XAdES', 'PAdeES', 'CAdES', 'ASIC','XMLenc']

mime= magic.Magic(mime=True)

def extensionRepairSingle(dir,f):
    extensionRepair(dir,f)

def extensionRepairBulk(dir,files):
    print(files)
    for f in files:
         extensionRepair(dir,f)
         print(dir,f)
         
def extensionRepair(dir,f):
    p = Path(join(dir,f))
    x=(f,mime.from_file(join(dir,f))
    if((os.path.splitext(join(dir,f))[1]) not in ext):
        z=x[1].split("/")[1]
        if ('.'+z) not in ext:
            if "spreadsheet" in z:
                p.rename(p.with_suffix('.xls'))
            if "presentation" in z:
                p.rename(p.with_suffix('.ppt'))
            if "plain" in z:
                p.rename(p.with_suffix('.txt'))
            if "jpeg" in z:
                p.rename(p.with_suffix('.jpg'))
        else:
            p.rename(p.with_suffix('.'+z))
