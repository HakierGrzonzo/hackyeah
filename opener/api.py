from .types import OpenFileResponse, CensoredPDF, CensoredPDFreq
from .open_file import process_file, get_new_file_path, temp_dir
from .pdf_redact import redact_strings_from_pdf
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from os import unlink

app = FastAPI()

origins = [
    "http://localhost",
    "http://localhost:8080",
    "*"
]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app = FastAPI()

@app.post('/api/openfile', response_model=OpenFileResponse)
async def open_the_file(path_to_file: str) -> OpenFileResponse:
    return process_file(path_to_file)

@app.post("/api/pdf/submit_strings", response_model=CensoredPDF)
async def censor_pdf(file: CensoredPDFreq):
    new_path = get_new_file_path(temp_dir, file.path_to_file)
    res = CensoredPDF(return_path = new_path)
    redact_strings_from_pdf(file.path_to_file, file.strings, new_path)
    if file.can_i_delete_file_senpai:
        unlink(file.path_to_file)
    return res
