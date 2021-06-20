# ESP32 flashing for Micropython

This is tool is a Makefile to help quickly erease and flash to micropython

## Using
seach for used COM ports to chekck if default COM3 port is good for flashing

```bash
make find
```

Command to erease ESP32 memory

```bash
make erease
```

Command to flash ESP memory to Micropython.

```bash
make flash
```

Run all commands in sequence

```bash
make setup
```

