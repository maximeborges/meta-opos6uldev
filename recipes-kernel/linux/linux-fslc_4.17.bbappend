FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-Add-I2C4-and-UART6-in-imx6ul-imx6ull-opos6uldev-dtsi.patch \
            file://0002-Fix-UART6-and-add-UART4.patch \
            file://0002-Add-spi1-spi2-and-fix-chip-select-inversion-in-spi4.patch \
            file://0017-Change-spidev-names.patch \
            file://0018-Fix-SPI-chip-select-pin-definitions-with-native-pin-.patch \
            "

