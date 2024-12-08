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

unsigned long lastTempRead = 0;          // To keep track of the last temperature reading time
const unsigned long tempInterval = 5000; // Read temperature every 5 seconds
float temperature;

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
    long irValue = particleSensor.getIR();

    if (irValue < 50000)
    {
        beatsPerMinute = 0;
        beatAvg = 0;
        temperature = 0;

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

        // Read temperature at intervals
        if (millis() - lastTempRead >= tempInterval)
        {
            temperature = particleSensor.readTemperature();
            lastTempRead = millis();
        }

        Serial.print(", Temp=");
        Serial.print(temperature, 2);
        Serial.print("°C");
    }

    Serial.println();
    delay(10); // Slight delay to stabilize readings
}
