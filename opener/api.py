from .types import OpenFileResponse
from .open_file import process_file
from fastapi import FastAPI

app = FastAPI()

@app.post('/api/openfile', response_model=OpenFileResponse)
async def openfile(path_to_file: str) -> OpenFileResponse:
    return process_file(path_to_file)
