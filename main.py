from flask import Flask, request, jsonify
import joblib
import random

advice = ['''Take immediate action to consult a healthcare professional for a thorough evaluation and confirmation of the diagnosis. Early intervention is critical; follow the doctor's advice, which may include lifestyle changes such as adopting a low-sodium diet, increasing physical activity under guidance, and managing stress levels. Ensure medications, if prescribed, are taken as directed and attend regular check-ups to monitor your heart health. Avoid self-diagnosis or panic, and rely on the expertise of medical professionals to guide your care. Staying informed and proactive can significantly improve outcomes and quality of life.''',
'''Prioritize seeking medical attention immediately to confirm the diagnosis and understand the severity. Follow the recommendations of your healthcare provider, which may involve lifestyle changes like adopting a heart-healthy diet, engaging in light, supervised physical activity, and avoiding substances that strain the heart, such as alcohol and tobacco. Keep a close eye on symptoms, such as swelling, shortness of breath, or fatigue, and report any changes promptly. Adhere to prescribed medications or treatments and consider creating a support system of family and friends to help manage your condition. Staying calm, informed, and proactive can significantly impact your well-being and help manage the condition effectively.''',
'''Act immediately by consulting a healthcare provider to confirm the diagnosis and begin appropriate treatment. Follow their guidance closely, which may include lifestyle modifications such as reducing salt intake, maintaining a healthy weight, engaging in regular light exercise, and avoiding smoking or alcohol. Take prescribed medications on time, monitor symptoms like shortness of breath, swelling, or fatigue, and attend all follow-up appointments to track your condition. Educate yourself about heart failure to better understand and manage it, and lean on a support network of family, friends, or support groups for emotional and practical help. Early intervention and consistent care are key to managing the condition effectively.''',
'''Seek immediate medical attention to confirm the diagnosis and start the appropriate treatment plan. Follow your healthcare provider's advice carefully, which may involve lifestyle adjustments such as reducing sodium in your diet, managing weight, engaging in light, supervised exercise, and avoiding smoking and alcohol. Take all prescribed medications as directed, and monitor your symptoms closely for changes like swelling, fatigue, or shortness of breath, reporting any worsening to your doctor. Stay informed about your condition, attend regular check-ups, and lean on a support network of family, friends, or support groups for emotional and practical help. Early intervention, consistent care, and a proactive approach can greatly improve your quality of life.''',
'''it's crucial to seek immediate medical attention to confirm the diagnosis and discuss treatment options. Follow your healthcare provider's guidance carefully, which may include lifestyle changes such as reducing sodium intake, managing weight, avoiding smoking and alcohol, and engaging in regular, gentle exercise. Take any prescribed medications as directed, monitor your symptoms like shortness of breath or swelling, and report any changes to your doctor. Stay proactive in managing your health by attending follow-up appointments, educating yourself about heart failure, and reaching out to family, friends, or support groups for help. Timely intervention and consistent care are essential for better outcomes.''']


app = Flask(__name__)

# Load your AI model
model = joblib.load('Model/random_forest_model.pkl')

@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json(force=True)

    data = [[int(data['age']), int(data['sex']), int(data['chest pain type']), int(data['resting bp s']), int(data['exercise angina'])]]

    predict = model.predict(data)

    if predict == 1:
        ans = f"Your Heart Is Abnormal\n{advice[random.randint(0,4)]}"
    
    else:

        ans = "Your Heart Is Normal\nNo need to worry. Continue to maintain a healthy lifestyle, including a balanced diet, regular exercise, and stress management, to support your heart health. Remember to attend regular check-ups and screenings to monitor your well-being and catch any potential issues early. Stay informed about heart health and make informed choices to protect your heart for the long term."

    return jsonify({'ans': ans})   

if __name__ == '__main__':
    app.run(debug=True, port=os.getenv("PORT", default=5000))