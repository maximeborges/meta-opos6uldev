FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-Add-I2C4-and-UART6-in-imx6ul-imx6ull-opos6uldev-dtsi.patch \
            file://0002-Fix-UART6-and-add-UART4.patch \
            "

