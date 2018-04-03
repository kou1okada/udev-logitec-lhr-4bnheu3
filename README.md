# udev rules for Logitec LHR-4BNHEU3

This project provides udev rules for Logitec [LHR-4BNHEU3](http://www.logitec.co.jp/products/hd/lhrbnu3/).

The udev has `/lib/udev/rules.d/60-persistent-storage.rules` script.
It provides Persistent Device Naming as below.

~~~
$ ls -l /dev/disk/by-id
usb-TOSHIBA_DT01ACA300_000000000000AAAA-0:0 -> ../../sdb
usb-TOSHIBA_DT01ACA300_000000000000AAAA-0:1 -> ../../sdc
usb-TOSHIBA_DT01ACA300_000000000000AAAA-0:2 -> ../../sdd
usb-TOSHIBA_DT01ACA300_000000000000AAAA-0:3 -> ../../sde
~~~

Unfortunately, `AAAA` is the serial number of LHR-4BNHEU3.
It is not persistent device naming based on identifier of the HDD.

So, this project provides persistent device naming based on identifier of the HDD as below.

~~~
$ ls -l /dev/disk/by-id
ata-TOSHIBA_DT01ACA300_BBBBBBBBB -> ../../sdb
ata-TOSHIBA_DT01ACA300_CCCCCCCCC -> ../../sdc
ata-TOSHIBA_DT01ACA300_DDDDDDDDD -> ../../sdd
ata-TOSHIBA_DT01ACA300_EEEEEEEEE -> ../../sde
usb-Logitec_LHR-4BNHEU3_000000000000AAAA-0:0 -> ../../sdb
usb-Logitec_LHR-4BNHEU3_000000000000AAAA-0:1 -> ../../sdc
usb-Logitec_LHR-4BNHEU3_000000000000AAAA-0:2 -> ../../sdd
usb-Logitec_LHR-4BNHEU3_000000000000AAAA-0:3 -> ../../sde
usb-TOSHIBA_DT01ACA300_000000000000AAAA-0:0 -> ../../sdb
usb-TOSHIBA_DT01ACA300_000000000000AAAA-0:1 -> ../../sdc
usb-TOSHIBA_DT01ACA300_000000000000AAAA-0:2 -> ../../sdd
usb-TOSHIBA_DT01ACA300_000000000000AAAA-0:3 -> ../../sde
usb-TOSHIBA_DT01ACA300_BBBBBBBBB -> ../../sdb
usb-TOSHIBA_DT01ACA300_CCCCCCCCC -> ../../sdc
usb-TOSHIBA_DT01ACA300_DDDDDDDDD -> ../../sdd
usb-TOSHIBA_DT01ACA300_EEEEEEEEE -> ../../sde
wwn-0xFFFFFFFFFFFFFFFF -> ../../sdb
wwn-0xGGGGGGGGGGGGGGGG -> ../../sdc
wwn-0xHHHHHHHHHHHHHHHH -> ../../sdd
wwn-0xIIIIIIIIIIIIIIII -> ../../sde
~~~

This makes to be able to refer HDD identity with `lsblk` as below:
~~~
$ # Result of `lsblk` by default udev rule
$ lsblk -o name,model,serial,wwn,hctl,tran,subsystems,rev,vendor
NAME   MODEL            SERIAL             WWN                HCTL       TRAN   SUBSYSTEMS          REV VENDOR
sdb    DT01ACA300       000000000000AAAA                      8:0:0:0    usb    block:scsi:usb:pci 0125 TOSHIBA
sdc    DT01ACA300       000000000000AAAA                      8:0:0:1    usb    block:scsi:usb:pci 0125 TOSHIBA
sdd    DT01ACA300       000000000000AAAA                      8:0:0:2    usb    block:scsi:usb:pci 0125 TOSHIBA
sde    DT01ACA300       000000000000AAAA                      8:0:0:3    usb    block:scsi:usb:pci 0125 TOSHIBA

$ # Result of `lsblk` by the rule which is provided by this project
$ lsblk -o name,model,serial,wwn,hctl,tran,subsystems,rev,vendor
NAME   MODEL            SERIAL             WWN                HCTL       TRAN   SUBSYSTEMS          REV VENDOR
sdb    DT01ACA300       BBBBBBBBB          0xFFFFFFFFFFFFFFFF 8:0:0:0    usb    block:scsi:usb:pci 0125 TOSHIBA
sdc    DT01ACA300       CCCCCCCCC          0xGGGGGGGGGGGGGGGG 8:0:0:1    usb    block:scsi:usb:pci 0125 TOSHIBA
sdd    DT01ACA300       DDDDDDDDD          0xHHHHHHHHHHHHHHHH 8:0:0:2    usb    block:scsi:usb:pci 0125 TOSHIBA
sde    DT01ACA300       EEEEEEEEE          0xIIIIIIIIIIIIIIII 8:0:0:3    usb    block:scsi:usb:pci 0125 TOSHIBA
~~~

## License

This project is distributed under the MIT license.

## Prepare for install 

~~~
aclocal && automake --foreign --add-missing && autoconf && ./configure
~~~

## Install

~~~
sudo make install
~~~

## Uninstall

~~~
sudo make uninstall
~~~

## Test

To test `/dev/sdX`, give `/sys/class/block/sdX` to `udevadm` as below.

~~~
sudo udevadm test /sys/class/block/sdX
ls -l /dev/disk/by-id
~~~

## Trigger all devices to change action

To reflect installed settings immediately, run below command.

~~~
sudo udevadm trigger
~~~

