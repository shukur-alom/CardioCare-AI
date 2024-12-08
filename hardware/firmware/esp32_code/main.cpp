#include <Wire.h>
#include "MAX30105.h"
#include "heartRate.h"

MAX30105 particleSensor;

const byte RATE_SIZE = 6;
byte rates[RATE_SIZE];
byte rateSpot = 0;
long lastBeat = 0;

float beatsPerMinute;
int beatAvg;

unsigned long lastTempRead = 0;          // To keep track of the last temperature_live reading time
const unsigned long tempInterval = 6000; // Read temperature_live every 5 seconds
float temperature_live;

// SpO2 variables
float redValue, irValue;
float SpO2 = 0.0;
unsigned long lastSpO2Read = 0;          // To keep track of the last SpO2 reading time
const unsigned long spo2Interval = 6000; // Read SpO2 every 5 seconds (adjust as needed)

void setup()
{
    Serial.begin(115200);
    Serial.println("Initializing...");

    Wire.begin(21, 22);

    if (!particleSensor.begin(Wire, I2C_SPEED_FAST))
    {
        Serial.println("MAX30105 was not found. Please check wiring/power.");
        while (1)
            ;
    }
    Serial.println("Place your index finger on the sensor with steady pressure.");

    particleSensor.setup();
    particleSensor.setPulseAmplitudeRed(0x0A);
    particleSensor.setPulseAmplitudeGreen(0);
}

void loop()
{
    redValue = particleSensor.getRed(); // Get Red value for SpO2 calculation
    irValue = particleSensor.getIR();   // Get IR value for SpO2 calculation

    if (irValue < 50000)
    {
        lastTempRead = 0;
        lastSpO2Read = 0;
        beatsPerMinute = 0.0;
        beatAvg = 0;
        temperature_live = 0.0;
        SpO2 = 0.0;

        Serial.print(" No finger?");
    }
    else
    {
        if (checkForBeat(irValue) == true)
        {
            long delta = millis() - lastBeat;
            lastBeat = millis();

            beatsPerMinute = 60 / (delta / 1000.0);

            if (beatsPerMinute < 255 && beatsPerMinute > 20)
            {
                rates[rateSpot++] = (byte)beatsPerMinute;
                rateSpot %= RATE_SIZE;

                beatAvg = 0;
                for (byte x = 0; x < RATE_SIZE; x++)
                    beatAvg += rates[x];
                beatAvg /= RATE_SIZE;
            }
        }

        Serial.print("IR=");
        Serial.print(irValue);
        Serial.print(", BPM=");
        Serial.print(beatsPerMinute);
        Serial.print(", Avg BPM=");
        Serial.print(beatAvg);

        // Control the SpO2 reading interval
        if (millis() - lastSpO2Read >= spo2Interval)
        {
            // Manually Calculate SpO2 using ratio of Red and IR light
            if (irValue > 0 && redValue > 0)
            {
                SpO2 = 100 - ((redValue / irValue) * 100);
            }
            lastSpO2Read = millis(); // Update the time of the last SpO2 reading
        }
        Serial.print(", SpO2=");
        Serial.print(SpO2);
        Serial.print("%");

        // Read temperature_live at intervals
        if (millis() - lastTempRead >= tempInterval)
        {
            temperature_live = particleSensor.readTemperature();
            lastTempRead = millis();
        }

        Serial.print(", Temp=");
        Serial.print(temperature_live, 2);
        Serial.print("°C");
    }

    Serial.println();
    delay(9); // Slight delay to stabilize readings
}
