import paho.mqtt.client as paho
import time

# MQTT client setup
try:
    client = paho.Client()
    client.connect('broker.emqx.io', 1883)
    client.loop_start()
    client.subscribe('cardio/53384', qos=1)


except:
    print("\n\n\n\t\tCheck Your Internet Connection\n\n")


# Function to handle MQTT messages
def on_message(client, userdata, msg):
    if msg.topic == "cardio/53384":
         print(str(msg.payload))

while True:
    time.sleep(2)
    client.on_message = on_message
    
    
