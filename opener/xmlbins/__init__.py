from bs4 import BeautifulSoup as Soup
import base64
import os

def get_bytes_from_xml(file_content, destination_folder: str):
    """
    Returns file created from base64 encoded data in XML
    """
    soup = Soup(file_content, features="lxml")
    file_path = os.path.join(
        destination_folder,
        base64.b64decode(soup.find("str:zalacznik")['nazwapliku']).decode())
    file = open(file_path, "wb+")
    file.write(base64.b64decode(soup.find("str:danezalacznika").string))
    file.close()
    return file

