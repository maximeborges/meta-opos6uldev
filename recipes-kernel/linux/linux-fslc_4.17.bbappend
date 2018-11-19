FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0100-ARM-dts-opos6ul-rework-device-tree-to-support-i.MX6U.patch \
            file://0101-cpufreq-imx6q-check-speed-grades-for-i.MX6ULL.patch \
            file://0102-ARM-dts-imx6ull-add-operating-points.patch \
            file://0103-ARM-dts-opos6uldev-fix-pixel-clk-polarity.patch \
            file://0104-ARM-dts-add-Armadeus-Systems-OPOS6ULNano-and-OPOS6UL.patch \
            file://0106-ARM-dts-imx6ul-Add-CAAM-support.patch \
            file://0107-ARM-dts-imx6ull-add-UART5-input-select-register-defi.patch \
            file://0108-ARM-dts-imx6ull-add-UART5-RTS-input-select-register.patch \
            file://0109-ARM-dts-imx6ull-keep-IMX6UL_-prefix-for-signals-on-b.patch \
            file://0514-armadeus-remove-spidev-oops-warning-at-load-time.patch \
            file://0800-armadeus-dts-opos6uldev-add-csi-pin-muxing.patch \
            file://0800-armadeus-dts-opos6uldev-LQ043-LCD-support.patch \
            file://0803-armadeus-brcmfmac-increase-boot-timeout.patch \
            file://1001-Add-I2C4-and-UART6-in-imx6ul-imx6ull-opos6uldev-dtsi.patch \
            file://1002-Fix-UART6-and-add-UART4.patch \
            file://1002-Add-spi1-spi2-and-fix-chip-select-inversion-in-spi4.patch \
            file://1017-Change-spidev-names.patch \
            file://1018-Fix-SPI-chip-select-pin-definitions-with-native-pin-.patch \
            file://1019-Complete-dtsi-with-gpio-spi1-spi2-spi4-with-chip-sel.patch \
            file://1020-Remove-GPIO-to-fix-ethernet.-TODO-find-workaround-to.patch \
            file://1021-Add-missing-XLBee3_Dio7-GPIO.patch \
            file://1022-Enable-i2c1-that-was-previously-disabled.patch \
            file://defconfig \
            "

