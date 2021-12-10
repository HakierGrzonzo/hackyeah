from .xmlbins import get_bytes_from_xml
import sys
import magic
import mimetypes
import tempfile
import os
from zipfile import ZipFile


if __name__ == "__main__":
    file = sys.argv[1]
    file_mime = magic.from_file(file, mime=True)
    with tempfile.TemporaryDirectory() as temp_dir:
        while True:
            if "text/xml" == file_mime:
                try:
                    with open(file, "r") as f:
                        if 'xmlns:wnio="http://epuap.gov.pl/fe-model-web/wzor_lokalny/EPUAP-----/podpisanyPlik/"' in f.readlines()[0]:
                            # mamy plik podpisany
                            f.seek(0)
                            # TODO(hakiergrzonzo): sprawdzanie podpisu
                            finalFile = get_bytes_from_xml(f.read(), temp_dir)
                            file = finalFile.name
                            file_mime = magic.from_file(file, mime=True)
                            print(file_mime, mimetypes.guess_extension(file_mime))
                        else:
                            # mamy jakiś poprawny, aczkolwiek nie podpisany xml
                            break
                except UnicodeDecodeError:
                    # mamy xml ale nie utf8
                    break
                        
            elif file_mime in ["application/zip"]:
                # decompress zip
                zf = ZipFile(file, "r")
                zf.extractall(temp_dir)
                for file in zf.namelist():
                    file = os.path.join(temp_dir, file)
                    file_mime = magic.from_file(file, mime=True)
            else:
                break
        print(file, file_mime)
        
