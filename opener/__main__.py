from .xmlbins import get_bytes_from_xml
from .pdf_redact import redact_strings_from_pdf
import sys
import magic
import mimetypes
import tempfile
import os
import shutil
from zipfile import ZipFile
from tarfile import TarFile
import gzip
from py7zr import SevenZipFile

def get_new_file_path(root: str, source: str, extension = None):
    if extension is None:
        extension = source.split(".")[-1]
    if not extension.startswith("."):
        extension = "." + extension
    return os.path.join(root, str(abs(hash(source))) + extension)

def open_file_in_defult(file_path: str):
    if (system_name := os.name) == "posix":
        os.system(f"xdg-open {file_path}")
    elif system_name == "nt":
        os.system(f"start {file_path}")
    else:
        raise Exception("What OS for the love of god is this!")

if __name__ == "__main__":
    file = sys.argv[1]
    file_mime = magic.from_file(file, mime=True)
    with tempfile.TemporaryDirectory() as temp_dir:
        new_file_path = get_new_file_path(temp_dir, file)
        shutil.copy(file, new_file_path)
        file = new_file_path
        while True:
            print(file_mime)
            if not file.endswith(ext if (ext := mimetypes.guess_extension(file_mime)) is not None else ""):
                # Jeśli nie zgadza się rozszerzenie, zmień je
                new_file_path = get_new_file_path(temp_dir, file, ext)
                os.rename(file, new_file_path)
                file = new_file_path
            elif "text/xml" == file_mime:
                try:
                    with open(file, "r") as f:
                        if 'xmlns:wnio="http://epuap.gov.pl/fe-model-web/wzor_lokalny/EPUAP-----/podpisanyPlik/"' in f.read():
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
            elif file_mime in ["application/x-tar"]:
                # decompress tar
                zf = TarFile(file, "r")
                zf.extractall(temp_dir)
                for file in zf.getnames():
                    file = os.path.join(temp_dir, file)
                    file_mime = magic.from_file(file, mime=True)
            elif file_mime in ["application/gzip"]:
                # decompress gnuzip
                new_file_path = get_new_file_path(temp_dir, file)
                with gzip.open(file) as gz, open(new_file_path, "wb+") as f:
                    f.write(gz.read())
                file = new_file_path
                file_mime = magic.from_file(file, mime=True)
            elif file_mime in ["application/x-7z-compressed"]:
                # decompress 7z
                with SevenZipFile(file, mode="r") as z:
                    z.extractall(path=temp_dir)
                    for file in z.getnames():
                        file = os.path.join(temp_dir, file)
                        file_mime = magic.from_file(file, mime=True)
            elif file_mime == "application/pdf":
                # redact stuff
                new_file_path = get_new_file_path(temp_dir, file)
                redact_strings_from_pdf(file, ["z?weryfik"], new_file_path)
                file = new_file_path
                break
            else:
                break
        print(file, file_mime)
        open_file_in_defult(file)
        input()
        
