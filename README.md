# CardioCare-AI

Welcome to the CardioCare-AI project! This project is divided into three main components:

1. **CardioCare-AI/App**: Our mobile application.
2. **CardioCare-AI/IoT**: Our IoT device.
3. **CardioCare-AI/Artificial-Intelligence**: Our AI module.

## Overview

CardioCare-AI is an innovative solution designed to monitor and analyze heart rate and oxygen levels (O3) using a combination of an IoT device and an advanced AI module. The system is composed of three main components: a mobile application, an IoT device, and an AI module, each playing a crucial role in delivering comprehensive health monitoring and analysis.

The IoT device is equipped with sensors that measure heart rate and oxygen levels in real-time. This data is then transmitted to the mobile application, where users can view their health metrics in an intuitive and user-friendly interface. The mobile app not only displays real-time data but also connects to the AI module for advanced analysis.

The AI module processes the data collected by the IoT device, providing predictive insights and alerts based on the user's health metrics. This advanced analysis helps in identifying potential health issues before they become critical, enabling proactive healthcare management.

Additionally, the mobile app offers a feature for users to connect with a doctor for further consultation. This ensures that users have access to professional medical advice whenever needed, enhancing the overall healthcare experience.

CardioCare-AI is currently in its Minimum Viable Product (MVP) stage, focusing on delivering essential features and gathering user feedback for future enhancements. The project aims to integrate more health monitoring sensors, improve AI algorithms for better predictive insights, and expand mobile app features to provide a more comprehensive and user-friendly experience.

Overall, CardioCare-AI represents a significant step forward in personal health monitoring, combining cutting-edge technology with user-centric design to deliver a powerful tool for managing heart health.

## Components

### 1. CardioCare-AI/App

The mobile application allows users to:
- View real-time heart rate and O3 levels.
- Connect to the AI module for advanced analysis.
- Communicate with a doctor for medical advice.

![App Screenshot 1](https://github.com/shukur-alom/CardioCare-AI/blob/main/Media/CardioCareAi%20(1)_page-0008.jpg)
![App Screenshot 2](https://github.com/shukur-alom/CardioCare-AI/blob/main/Media/CardioCareAi%20(1)_page-0009.jpg)

### 2. CardioCare-AI/IoT

The IoT device is responsible for:
- Measuring heart rate and O3 levels.
- Displaying the data on a built-in screen.
- Communicating with the mobile app and AI module.
![IoT Device](https://github.com/shukur-alom/CardioCare-AI/blob/main/Media/CardioCareAi%20(1)_page-0010.jpg)

### 3. CardioCare-AI/Artificial-Intelligence

The AI module provides:
- Advanced analysis of heart rate and O3 data.
- Predictive insights and alerts based on the data.

## Deployment Instructions

### AI Module Deployment

1. Deploy the AI module to a server.
2. Connect the AI module to the mobile app.

### IoT Device Setup

1. Upload the IoT code located at `IoT/hardware/firmware/esp32_code/main.cpp` to the device.
2. Connect all instruments as shown in the diagram `IoT/hardware/Diagram/main.png`.
3. Power the device and run the app.

## Usage

### With Mobile App

- Connect the IoT device to the mobile app.
- View real-time data and AI analysis on the app.
- Connect to a doctor for further consultation.

### Without Mobile App

- The IoT device will display heart rate and O3 levels on its screen.
- Note: Without the app, AI analysis and doctor consultation features are not available.

## Features

- Real-time monitoring of heart rate and O3 levels.
- AI-based analysis and predictive insights.
- Doctor consultation through the mobile app.
- Standalone operation with on-device display.

## Future Enhancements

- Integration with more health monitoring sensors.
- Enhanced AI algorithms for better predictive insights.
- Expanded mobile app features for a better user experience.

## Contact

For more information, please contact our team at [support@cardiocare-ai.com](mailto:support@cardiocare-ai.com).

Thank you for using CardioCare-AI!
