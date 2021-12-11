from typing import Optional, List
from pydantic import BaseModel
from .xmlbins import Signature

class OpenFileResponse(BaseModel):
    path_to_xml: Optional[str] = None
    signatures: Optional[List[Signature]] = None
    path_to_file: Optional[str] = None
    mime: str

class CensoredPDFreq(BaseModel):
    strings: List[str]
    path_to_file: str
    can_i_delete_file_senpai: Optional[bool]

class CensoredPDF(BaseModel):
    return_path: str
