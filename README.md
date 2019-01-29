# FocusDrive3

The FocusDrive3 device driver supports the Focus IDE interface card in the Apple /// as part of the SOS operating system.  SOS is very much like ProDOS in terms of filesystem layout; however, most Apple /// interpreters use a signed integer to represent blocks, so the standard maximum size of partition for ProDOS (65535 blocks, ~32MB) is halved in SOS as 32767 blocks (~16MB).

## Drive Preparation
There's no ///-based partitioning software avaialble, so you will want to have a pre-partitioned CF card or IDE drive with partitions of size 32767 blocks (~32MB) or less for best results.  As of this writing, the partitioning software only runs on the IIgs.

## Supported Operations
- [X] Read
- [X] Write
- [X] Up to 8 partitions
- [ ] Integrated formatter

## Build

The driver is built via the ca65 assembler (part of the [cc65 toolchain](https://cc65.github.io/)).  [Rob Justice](https://github.com/robjustice)'s excellent [a3driverutil](https://github.com/robjustice/a3driverutil) enables rapid development by not requiring the developer to ever run SCP!  It's a modern marvel.

Tools required:
- Ant
- ca65/ld65
- Python

Tools included as part of the build:
- [a3driverutil](https://github.com/robjustice/a3driverutil) 
- [AppleCommander](http://applecommander.sourceforge.net/acant.html)
