FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI +="file://0001-opos6ul-add-opos6ul_board_init-weak-function.patch"
SRC_URI +="file://0002-opos6ul-fix-DDR-refresh-settings.patch"
#SRC_URI +="file://0003-opos6uldev-fix-display-timings.patch"
SRC_URI +="file://0004-Add-cpu_type-to-differentiate-imx6ul-and-ull.patch"

SRCREV = "890e79f2b1c26c5ba1a86d179706348aec7feef7"
SRCBRANCH = "2018.05+fslc"
PV = "v2018.05+git${SRCPV}"


LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
