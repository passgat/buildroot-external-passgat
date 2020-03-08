# buildroot-external-passgat

This project allows to keep package recipes, board support and configuration
files outside of the Buildroot tree, while still having them nicely integrated
in the build logic.
I will start with customizations for the beaglebone board and I hope to continue
over time with the addition of customizations for other boards.

#### 1. beaglebone-kit-c
The instructions to prepare the SD card:<br/>
\$ mkdir -p <path-to-project><br/> 
\$ cd \<path-to-project\><br/>
\$ repo init -u https://github.com/passgat/buildroot-beaglebone-repo<br/>
\$ repo sync<br/>
\$ cd buildroot<br/>
\$ make BR2_EXTERNAL=<path-to-project>/buildroot-external-passgat beaglebone_kit_c_defconfig<br/>
\$ make<br/>
\$ dd if=output/images/sdcard.img of=/dev/\<disknumber\><br/>

To disable BB to boot up from the eMMC (embedded MultiMedia Card) execute the
following two commands on the u-boot prompt:<br/>
\# mmc dev 1<br/>
\# mmc erase 0 512<br/>
The first command will select the eMMC card, and the second one will do the
erasing so that the BB doesn't boot from eMMC.<br/>

Finally, insert the prepared SD card and power on the BB.
