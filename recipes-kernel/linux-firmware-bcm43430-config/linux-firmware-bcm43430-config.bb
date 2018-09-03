DESCRIPTION = "Add BCM43430 WiFi firmware config file"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

PACKAGE_ARCH = "all"

SRC_URI += " \
    file://brcmfmac43430-sdio.txt \
"

do_install () {
    install -d ${D}${base_libdir}/firmware/
    install -d ${D}${base_libdir}/firmware/brcm/
    install -m 644 ${WORKDIR}/brcmfmac43430-sdio.txt ${D}${base_libdir}/firmware/brcm/
}

FILES_${PN} += " \
    ${base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt \
"