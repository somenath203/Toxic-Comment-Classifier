from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from detoxify import Detoxify

app = FastAPI()


origins = ["*"]


app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


class inputTextModel(BaseModel):
    inputText: str


@app.get('/')
def welcome():
    return {
        'success': True,
        'message': "the server of 'toxic comment classifier is up and running successfully'"
    }


@app.post('/predict')
async def predict_comment(input_txt: inputTextModel):

    text_from_user = input_txt.inputText

    results = Detoxify('original').predict(text_from_user)

    final_result = {
        'toxicity': f"{round(float(results['toxicity']) * 100, 2)}",
        'severe_toxicity': f"{round(float(results['severe_toxicity']) * 100, 2)}",
        'obscene': f"{round(float(results['obscene']) * 100, 2)}",
        'threat': f"{round(float(results['threat']) * 100, 2)}",
        'insult': f"{round(float(results['insult']) * 100, 2)}",
        'identity_attack': f"{round(float(results['identity_attack']) * 100, 2)}",
    }
    
    print("prediction made successfully")

    return {
        'final_result': final_result
    }

    