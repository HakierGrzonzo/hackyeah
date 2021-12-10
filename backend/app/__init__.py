from fastapi import FastAPI

def create_app():
    app = FastAPI(title="test")

    @app.get("/")
    def index():
        return {"hello": "world"}

    return app
