from fastapi import FastAPI
from app.db import Base, engine
from app.routes import files

Base.metadata.create_all(bind=engine)

app = FastAPI()

app.include_router(files.router)