import redis
import RPi.GPIO as GPIO
from flask import Flask
app = Flask(__name__)

LED_PIN = 11
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BOARD)
GPIO.setup(LED_PIN, GPIO.OUT)
RC = redis.Redis()
RC.set('state', 'off')
GPIO.output(LED_PIN, GPIO.LOW)

@app.route('/')
def state():
    return RC.get('state')

@app.route('/on')
def turn_on():
    GPIO.output(LED_PIN, GPIO.HIGH)
    RC.set('state', 'on')
    return 'on'

@app.route('/off')
def turn_off():
    GPIO.output(LED_PIN, GPIO.LOW)
    RC.set('state', 'off')
    return 'off'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
