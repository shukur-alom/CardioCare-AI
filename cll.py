import requests

url = 'https://lobster-crack-lion.ngrok-free.app/predict'

data = {"age": 49,
        "sex" : 0,
        "chest pain type" : 3,
        "resting bp s" : 160,
        "exercise angina" : 0,
        }


response = requests.post(url, json=data)
print(response.json())