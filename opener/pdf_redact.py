from .pdf_redactor import RedactorOptions, redactor
from typing import List
import re
from random import randrange

def redact_strings_from_pdf(file_path: str, strings: List[str], target_file: str):
    options = RedactorOptions()
    options.content_filters = [(re.compile(x, re.IGNORECASE), lambda w: ("*" * randrange(max(0, len(x) - 2), len(x) + 2))) for x in strings]
    options.xmp_filters = [lambda m: None]
    #infile = open(file_path, "rb")
    options.input_stream = file_path
    #outfile = open(file_path, "wb+")
    options.output_stream = target_file 
    redactor(options)
