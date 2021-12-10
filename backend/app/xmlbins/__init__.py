from bs4 import BeautifulSoup as Soup
import base64

def get_bytes_from_xml(file_name: str):
    """
    Returns filename and bytes of a signed file from xml
    """
    soup = Soup(open(file_name, "rb").read(), features="lxml")
    return base64.b64decode(soup.find("str:zalacznik")['nazwapliku']).decode(), \
        base64.b64decode(soup.find("str:danezalacznika").string)

if __name__ == "__main__":
    print(get_bytes_from_xml("/home/hakiergrzonzo/Downloads/test_2.txt"))
