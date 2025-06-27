# Collateral for the RK-XCKU5P-F V1.2 XCKU5P development board

![Top view of the FPGA board](images/RK-XCKU5P-F-V1.2.webp)

This *unbranded* XCKU5P development board is widely available on eBay
and can be found on AliExpress.  The collateral isn't easy to find so
I'm making it available here.  Note, it was originally distributed as
a Zip file with Zip files inside (which had Zip files etc).  I
unpacked everything and reorganized it slightly, but have not renamed
any files.

## The Manual
[RK-XCKU5P-F V1.2](RK-XCKU5P-F-V1.2.pdf)

Some relevant facts about this board (which as of this writing I don't
not have):
- FPGA: Xilinx XCKU5P-2ffvb676I (Note: speed grade -2!)
- DDR4: 2 GiB (2 x MT40A512M16LY-0625E @ 2666 Mbps) [1]
- QSPI FLASH: 512 Mib MX25U51245GZ4I00
- SDcard slot
- PCIe 3.0 x4
- QSFP28
- Ethernet (GbE) via RTL8211F-CG Phy
- MIPI
- 40PIN IO
- FMC HPC
- FT2232HQ for JTAG and UART
- 200 MHz on-board oscillator
- 4 LEDs, 4 buttons, fan header (with FPGA control)

[1] Note, BG1 isn't routed, which could matter for TwinDie devices,
should one consider replacing the original DDR4.
