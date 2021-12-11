from .xmlbins import get_bytes_from_xml
import sys
import magic
import mimetypes
import tempfile
import os
import shutil
from zipfile import ZipFile


if __name__ == "__main__":
    file = sys.argv[1]
    file_mime = magic.from_file(file, mime=True)
    with tempfile.TemporaryDirectory() as temp_dir:
        new_file_path = os.path.join(temp_dir, f"{hash(file)}." + file.split(".")[-1])
        shutil.copy(file, new_file_path)
        file = new_file_path
        while True:
            if not file.endswith(ext := mimetypes.guess_extension(file_mime)):
                # Jeśli nie zgadza się rozszerzenie, zmień je
                new_file_path = os.path.join(temp_dir, f"{hash(file)}" + ext)
                os.rename(file, new_file_path)
                file = new_file_path
            elif "text/xml" == file_mime:
                try:
                    with open(file, "r") as f:
                        if 'xmlns:wnio="http://epuap.gov.pl/fe-model-web/wzor_lokalny/EPUAP-----/podpisanyPlik/"' in f.readlines()[0]:
                            # mamy plik podpisany
                            f.seek(0)
                            # TODO(hakiergrzonzo): sprawdzanie podpisu
                            finalFile = get_bytes_from_xml(f.read(), temp_dir)
                            file = finalFile.name
                            file_mime = magic.from_file(file, mime=True)
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
        
