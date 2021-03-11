# SPDX-FileCopyrightText: 2021 ladyada for Adafruit Industries
# SPDX-License-Identifier: MIT

import time
import board
import busio
import adafruit_ads1x15.ads1015 as ADS
from adafruit_ads1x15.analog_in import AnalogIn
dryV = 1.54#1.526
wetV = 1.252
# Create the I2C bus
i2c = busio.I2C(board.SCL, board.SDA)

# Create the ADC object using the I2C bus
ads = ADS.ADS1015(i2c)

# Create single-ended input on channel 0
chan = AnalogIn(ads, ADS.P0)

# Create differential input between channel 0 and 1
# chan = AnalogIn(ads, ADS.P0, ADS.P1)


def vToP(v):
	if v <= wetV:
		return 1
	if v >= dryV:
		return 0 
	return 1 - (v-wetV)/(dryV-wetV)

def getWet():
	return vToP(chan.voltage)

if __name__=='__main__':
	while True:
	    print(round(chan.voltage, 2), vToP(chan.voltage), 'wet')
	    time.sleep(0.5)
