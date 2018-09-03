# meta-opos6uldev

Yocto BSP layer for the `Armadeus opos6uldev` http://www.armadeus.org/wiki/index.php?title=OPOS6ULDev

**/!\ This project is not affiliated with Armadeus systems.**

## Description

This is an hardware specific BSP overlay for the `Armadeus opos6uldev` board.

Information about the board can be found on [the Armadeus Wiki](http://www.armadeus.org/wiki/index.php?title=OPOS6ULDev).

This BSP is currently only tested with the `Poky` distribution on the `sumo` branch.

## Dependencies

This layer depends on:

* URI: `git://git.yoctoproject.org/poky`
  * branch: `sumo`
  * revision: HEAD

* URI: `git://git.openembedded.org/meta-openembedded`
  * layers: `meta-oe`
  * branch: `sumo`
  * revision: HEAD

* URI: `git://git.yoctoproject.org/git/meta-freescale`
  * layers: `meta-freescale`
  * branch: `sumo`
  * revision: HEAD

## Building the distro

1. Run `source poky/oe-init-build-env`
2. Add this layer to `build/bblayers.conf` and the dependencies above
3. Set MACHINE in `build/local.conf` to `imx6ul-opos6uldev`
4. Run `bitbake core-image-minimal`

The output files will be available in `build/tmp/deploy/images/imx6ul-opos6uldev/`:
 * U-Boot SPL: `SPL`
 * U-Boot image: `u-boot.img`
 * WIC eMMC image: `core-image-minimal-imx6ul-opos6uldev.wic`
 
## Flash the WIC image to eMMC

1. Connect the OTG USB to your computer
2. Get to the U-Boot prompt (when booting the board you have 5 seconds to send any data to stop the auto boot sequence)
3. Mount the eMMC as an USb device: `ums 0 mmc 0`
4. Flash the WIC file to the eMMC: `wic write core-image-minimal-imx6ul-opos6uldev.wic /dev/sdb` (make sure that /dev/sdb is your USB device!)
5. Edit the emmcboot command depending on your distribution, for example:
```
  setenv emmcboot ' \
    load mmc 0:2 ${fdt_addr} /imx6ul-${fdt_name}.dtb && \
    load mmc 0:2 ${loadaddr} /boot/${kernelimg} && \
    bootz ${loadaddr} - ${fdt_addr}';
```

## Updating U-Boot image and SPL 

### Automated: 
1. Build the [Armadeus BSP](https://sourceforge.net/p/armadeus/code/ci/master/tree/)
2. Overwrite the `opos6ul-u-boot.img` and `opos6ul-u-boot.spl` in `software/uboot_recover/` with the previously generated `u-boot.img` and `SPL`
3. Run `sudo python2 opos6ul_recovery.py` from the `software/uboot_recover/` directory

### Manually:

Dependencies: 
 * `lrzsz` for the `sb` tool (binary transfert tool using ymodem, supported by U-Boot)
 * `imx-usb` to update the U-Boot SPL
 * Any serial console emulator (`dterm` will be used there)

1.  [Put a jumper on BOOT0](http://www.armadeus.org/wiki/index.php?title=BootStrap) and reset the board
2.  Load the SPL in memory: `sudo imx_usb SPL`
3.  Set the serial baudrate to 115200: `stty -F /dev/ttyUSB0 115200`
4.  Load the U-Boot image in memory: `sb -k u-boot.img > /dev/ttyUSB0 < /dev/ttyUSB0`
5.  Connect to U-Boot via serial: `dterm /dev/ttyUSb0 115200`
6.  Set U-Boot to load the SPL in memory: `loady` in serial console
7.  In another terminal, send the SPL file: `sb -k SPL > /dev/ttyUSB0 < /dev/ttyUSB0`
8.  When the transfert is finished, flash the SPL from memory to eMMC: `run flash_uboot_spl` in U-Boot console
9.  Set U-Boot to load the U-Boot image in memory: `loady` in serial console
10. In another terminal, send the U-Boot image file: `sb -k u-boot.img > /dev/ttyUSB0 < /dev/ttyUSB0`
11. When the transfert is finished, flash the image from memory to eMMC: `run flash_uboot_img` in U-Boot console

## Maintainers

* Maxime Borges `<maxime.borges at strataggem.com>`
