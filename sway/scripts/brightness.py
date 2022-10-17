#!/usr/bin/env python3

import os
import sys
import subprocess
import argparse

parser = argparse.ArgumentParser(description='Set brightness in percent')
parser.add_argument('--relative', default=False, action='store_true',
                    help='Set relatively')
parser.add_argument('brightness', metavar='B', type=int,
                    help='Brightness in percent')

args = parser.parse_args()

args = parser.parse_args()

current_brightness = int(subprocess.check_output([
    "cat",
    "/sys/class/backlight/intel_backlight/brightness"
    ]).strip().decode('utf-8'))

min_brightness = 5 # percent

max_brigthness = int(subprocess.check_output([
    "cat",
    "/sys/class/backlight/intel_backlight/max_brightness"
    ]).strip().decode('utf-8'))

print("Max brightness %s" % (max_brigthness))

setpoint = args.brightness
relative = args.relative
print(setpoint)
print(relative)

brightness = None

if not relative:
    if (setpoint < min_brightness) or (setpoint > 100):
        print("Brightness violates lower limit")
        sys.exit(1)
    else:
        brightness = int(max_brigthness * setpoint / 100.0)
else:
    in_percent = (current_brightness / float(max_brigthness) * 100.0)
    print(in_percent)
    if (setpoint < - in_percent) or (setpoint > 100.0 - in_percent):
        print("Setpoint is violating limits")
        sys.exit(1)
    else:
        brightness = int((in_percent + setpoint) * max_brigthness / 100.0)
        print(brightness)

if brightness == None:
    sys.exit(2)

print("Setting brightness %s" % (brightness))

command = ' '.join([
    "echo",
    str(brightness),
    ">",
    "/sys/class/backlight/intel_backlight/brightness"
    ])

print(command)

sys.exit(os.system(command))
