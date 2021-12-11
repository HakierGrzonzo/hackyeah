from .types import OpenFileResponse
from .open_file import process_file
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

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
async def openfile(path_to_file: str) -> OpenFileResponse:
    return process_file(path_to_file)
