#! /bin/sh
# udev rules helper for Logitec LHR-4BNHEU3
# Copyright (c) 2017 Koichi OKADA. All rights reserved.
# This script is distributed under the MIT license.

ID_USB_INSTANCE="$ID_INSTANCE"
ID_USB_MODEL="Logitec_LHR-4BNHEU3"
ID_USB_MODEL_ENC="Logitec\\x20LHR-4BNHEU3"
ID_USB_REVISION="$ID_USB_REVISION"
ID_USB_SERIAL="${ID_USB_MODEL}_${ID_SERIAL_SHORT}-${ID_INSTANCE}"
ID_USB_SERIAL_SHORT="$ID_SERIAL_SHORT"

MODEL_NUMBER=`hdparm -I "$1" | grep "Model Number" | sed -e 's/.*: *//g'`
ID_MODEL=`echo "$MODEL_NUMBER" | sed -e 's/ *$//g' -e 's/ /_/g'`
ID_MODEL_ENC=`echo "$MODEL_NUMBER" | sed -e 's/ /\\x20/g'`
ID_REVISION=`hdparm -I "$1" | grep "Firmware Revision" | sed -e 's/.*: *//g'`
SERIAL_NUMBER=`hdparm -I "$1" | grep "Serial Number" | sed -e 's/.*: *//g'`
WWN=`hdparm -I "$1" | grep "WWN" | sed -e 's/.*: */0x/g'`
ID_SERIAL="${ID_MODEL}_${SERIAL_NUMBER}"
ID_SERIAL_SHORT="$SERIAL_NUMBER"
ID_WWN="$WWN"
ID_WWN_WITH_EXTENSION="$WWN"

echo "ID_USB_INSTANCE=$ID_USB_INSTANCE"
echo "ID_USB_MODEL=$ID_USB_MODEL"
echo "ID_USB_MODEL_ENC=$ID_USB_MODEL"
echo "ID_USB_REVISION=$ID_USB_REVISION"
echo "ID_USB_SERIAL=$ID_USB_SERIAL"
echo "ID_USB_SERIAL_SHORT=$ID_USB_SERIAL_SHORT"

echo "ID_USB_INSTANCE="
echo "ID_MODEL=$ID_MODEL"
echo "ID_MODEL_ENC=$ID_MODEL"
echo "ID_REVISION=$ID_REVISION"
echo "ID_SERIAL=$ID_SERIAL"
echo "ID_SERIAL_SHORT=$ID_SERIAL_SHORT"

echo "ID_WWN=$ID_WWN"
echo "ID_WWN_WITH_EXTENSION=$ID_WWN_WITH_EXTENSION"
