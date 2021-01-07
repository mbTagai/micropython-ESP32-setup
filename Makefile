#  python c:\users\tautv\appdata\roaming\python\python39\site-packages\esptool.py --chip esp32 --port COM3 --baud 460800 write_flash -z 0x1000 .\esp32-idf3-20200902-v1.13.bin
# esptool.py --chip esp32 --port /dev/ttyUSB0 erase_flash
ESPTOOL = "c:\users\tautv\appdata\roaming\python\python39\site-packages\esptool.py"
IMAGE = ".\esp32-idf3-20200902-v1.13.bin"
IMAGE_VERSION  = "1.13"
PORT = COM3
.PHONY = mode find test erease flash


test:
	@echo test line

find:
	@echo Searching for COM ports.
	mode /status

erease:
	@echo Ereasing ESP32 memory.
	@echo Selected port:  ${PORT}
	python ${ESPTOOL} --chip esp32 --port ${PORT} erase_flash
	@echo Memory ereased.

flash:
	@echo Flashing ESP32 memory to MicroPython.
	@echo MicroPython Version:  ${IMAGE_VERSION}
	python ${ESPTOOL} --chip esp32 --port ${PORT} --baud 460800 write_flash -z 0x1000 ${IMAGE}
	@echo Flashing completed.