from os import listdir
from os.path import isfile, join
import os
import magic
from pathlib import Path
ext =[ '.txt', '.rtf', '.pdf', '.xps', '.odt', '.ods', '.odp', '.doc', '.xls', '.ppt', '.docx', '.xlsx', '.pptx', '.csv', '.jpg', '.tif', 
'.geotif', '.png', '.svg', '.wav', '.mp3', '.avi', '.mpg', '.mp4', '.ogg', '.ogv', '.zip', '.tar', '.gz', '.7Z', '.html','.xhtml', '.css', 
'.xml', '.xsd','gml', '.rng', '.xsl', '.xslt','TSL', 'XMLsig', 'XAdES', 'PAdeES', 'CAdES', 'ASIC','XMLenc']
alt = {
    'spreadsheet':'.xls',
    'presentation':'.ppt',
    'plain':'.txt',
    'jpeg':'.jpg',
}
def extensionRepairSingle(dir,f):
    extensionRepair(dir,f)

def extensionRepairBulk(dir,files):
    for f in files:
         extensionRepair(dir,f)
         
def extensionRepair(dir,f):
    mime= magic.Magic(mime=True)
    path=join(dir,f)
    x=(f,mime.from_file(path))
    p = Path(path)
    if(os.path.splitext(path)[1]) not in ext:
        z=x[1].split("/")[1]
        if '.'+z not in ext:
            p.rename(p.with_suffix(alt[z.split('.')[-1]]))
        else:
            p.rename(p.with_suffix('.'+z))
