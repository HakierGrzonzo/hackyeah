import sys
from .open_file import process_file

if __name__ == "__main__":
    file = process_file(sys.argv[1])
    print(file.path_to_file, file.path_to_xml, file.mime)
    input("Naciśnij enter by skasować")
