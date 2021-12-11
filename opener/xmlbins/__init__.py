from typing import Tuple, Optional
from bs4 import BeautifulSoup as Soup
import base64
import os
from pydantic import BaseModel
from hashlib import sha256

class Signature(BaseModel):
    author: Optional[str]
    date: Optional[str]
    isValid: bool

def very_professional_signer_thigny(file_content) -> bool:
    return hash(file_content.read()) > 0

def get_bytes_from_xml(file_content, destination_folder: str) -> Tuple[str, Signature]:
    """
    Returns file created from base64 encoded data in XML
    """
    soup = Soup(file_content, features="lxml")
    file_path = os.path.join(
        destination_folder,
        base64.b64decode(soup.find("str:zalacznik")['nazwapliku']).decode())
    file = open(file_path, "wb+")
    content = base64.b64decode(soup.find("str:danezalacznika").string)
    file.seek(0)
    valid = very_professional_signer_thigny(file)
    file.write(content)
    file.close()
    try:
        author = f"{soup.find('os:imie').string} {soup.find('os:nazwisko').string}"
    except:
        author = None
        valid = False
    try:
        date = soup.find("xades:signingtime").string
    except:
        date = None
        valid = False
    res = Signature(author = author, date=date, isValid=valid)
    return (file_path, res)

