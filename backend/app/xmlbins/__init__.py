from bs4 import BeautifulSoup as Soup
import base64
import tempfile

def get_bytes_from_xml(file_name: str):
    """
    Returns file created from base64 encoded data in XML
    """
    soup = Soup(open(file_name, "rb").read(), features="lxml")
    file = tempfile.NamedTemporaryFile(suffix=base64.b64decode(soup.find("str:zalacznik")['nazwapliku']).decode())
    file.write(base64.b64decode(soup.find("str:danezalacznika").string))
    file.flush()
    file.seek(0)
    return file

if __name__ == "__main__":
    print(get_bytes_from_xml("/home/hakiergrzonzo/Downloads/test_2.txt"))
