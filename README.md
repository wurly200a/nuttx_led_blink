# nuttx_led_blink

# Introduction

This is LED blinking application with NuttX OS.

# Prerequisite

 - Hardware
  - Using ESP32-DevKitC-32 (ESP32-DevKitC-32D,ESP32-DevKitC-32E)
 - Build environment
  - Linux Environment (WSL is fine as well)
  - Using Docker

# How to build

## step0

Clone this project.

```
$ git clone https://github.com/wurly200a/nuttx_led_blink.git
$ cd nuttx_led_blink
```

## step1

Build docker image as a builder.

```
$ build-nuttx-esp32/01_build-builder.sh
```

## step2

Enter a builder.

```
$ build-nuttx-esp32/02_enter-builder.sh
$ get_idf
```

## step3

Build.

```
$ build-nuttx-esp32/03_build.sh
```

After the above, you can find nuttx.bin in build-nuttx-esp32/nuttx.

## step4

"COM1" is example. You need to use appropriate COM port.

```
> esptool.py --chip esp32 --port COM1 --baud 921600 write_flash 0x1000 bootloader-esp32.bin 0x8000 partition-table-esp32.bin 0x10000 nuttx.bin
```
