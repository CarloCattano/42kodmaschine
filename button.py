import RPi.GPIO as GPIO
from time import sleep
from os import path
import subprocess

GPIO.setmode(GPIO.BCM)
GPIO.setup(16, GPIO.IN, pull_up_down=GPIO.PUD_UP)

button_pressed = False
examdir = "/home/exam/kodmaschine"
session_file = "/home/exam/kodmaschine/rendu/.session"

# TODO: Check if process is already running
def run_moulinette():
    cmd = ["make", "moulinette"]
    subprocess.run(cmd, cwd=examdir)

def start_examshell():
    cmd = ["make", "examshell"]
    subprocess.run(cmd, cwd=examdir)

try:
    while True:
        input_state = GPIO.input(16)
        if not input_state and not button_pressed:
            print("Button Pressed", flush=True)
            run_moulinette()
            button_pressed = True
        elif input_state and button_pressed:
            button_pressed = False
        sleep(0.05)

except KeyboardInterrupt:
    print("Exiting script", flush=True)
finally:
    GPIO.cleanup()
