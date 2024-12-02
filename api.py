from flask import Flask, request, jsonify
import joblib

app = Flask(__name__)

# Load your AI model
model = joblib.load('Model/random_forest_model.pkl')

@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json(force=True)

    data = [[int(data['age']), int(data['sex']), int(data['chest pain type']), int(data['resting bp s']), int(data['exercise angina'])]]

    predict = model.predict(data)

    return jsonify({'prediction': predict.tolist()})   

if __name__ == '__main__':
    app.run(debug=True)