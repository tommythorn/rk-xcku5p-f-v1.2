# Unsupported 8 GiB Memory Upgrade

The RK-XCKU5-F-V1.2 is equipped with two 1 GiB / 8 Gib DDR4 devices
(MT40A512M16LY-062E or compatible).  We are confident that swapping
these out for 2 GiB devices and adjusting the DRAM IP accordingly
should enable a total of 4 GiB.

However, there is a larger-still device, the 4 GiB TwinDie devices,
like the MT40A1G16HBA and compatible.

## Differences

The internal organization is different, having two die.  The only
pinout difference that results is
- an additional ZQ (UZQ) on E9 and
- an additional Bank Group line, BG1 on M9.

The datasheet states "a BG1 control required for x8 addressing" so
presumably if the memory is always addresses a full x16, we don't need
this?

The ZQ pins are used for calibration.

## RK-XCKU5-F-V1.2 DDR4 pinout

The board doesn't use LZQ (F9) but ties it to ground via a 240 ohm resistor.
The E9 pin is tied directly to ground.  Is this a problem?

The BG0 (M2) *is* used and connected to FPGA pin M2.  The BG1 pin (M9)
is tied directly to ground.  As I understand the explantion on
https://www.synopsys.com/articles/ddr4-bank-groups.html tying this low
would mean we loose access to half the ram on one die (and certainly
would make the memory controller confused).

I _speculate_ that we can tie BG0 and BG1 together to get access to
the full memory.  TBD.
