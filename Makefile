#  python c:\users\tautv\appdata\roaming\python\python39\site-packages\esptool.py --chip esp32 --port COM3 --baud 460800 write_flash -z 0x1000 .\esp32-idf3-20200902-v1.13.bin
# esptool.py --chip esp32 --port /dev/ttyUSB0 erase_flash
ESPTOOL = "esptool.py"
IMAGE = "ESP32_GENERIC-20230426-v1.20.0.bin"
IMAGE_VERSION  = "1.20"
# PORT = "/dev/tty.usbserial-0001"
MY_VAR := $(shell echo whatever)
ESP_PORT := $(shell ls /dev/tty.usb*)

.PHONY: python find flash erease test

test:
	@echo test line
	@echo MY_VAR IS $(MY_VAR)
	conda info

python:
	@echo activate conda enviroment
	conda activate esp32

find:
	@echo Searching for ports
	ls /dev/tty.usb*
	@echo ESP Port is: $(ESP_PORT)

erease:
	@echo Ereasing ESP32 memory.
	@echo Selected port:  $(ESP_PORT)
	${ESPTOOL} --chip esp32 --port $(ESP_PORT) erase_flash
	@echo Memory ereased.

flash:
	@echo Flashing ESP32 memory to MicroPython.
	@echo MicroPython Version:  ${IMAGE_VERSION}
	${ESPTOOL} --chip esp32 --port $(ESP_PORT) --baud 460800 write_flash -z 0x1000 ${IMAGE}
	@echo Flashing completed.

setup:
	@echo Runing setup script.
	make find
	make erease
	make flash
	@echo setup succesfully finished.

