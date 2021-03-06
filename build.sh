#!/bin/bash

IASL='./tools/iasl -vw 3073 -vi -vr -p'
SRCACPI='src/ACPI'

if [ ! -f src/smbios.txt ]; then
    echo "Please generate your own serial number and put it in src/smbios.txt! (see src/smbios-sample.txt)"
    exit 1
fi

rm -rf build && mkdir build

# Copy OpenCore EFI folder
cp -R download/oc/OpenCorePkg/X64/EFI build

OCFOLDER="build/EFI/OC"

# Build ACPI
$IASL $OCFOLDER/ACPI/SSDT-AWAC.aml $SRCACPI/SSDT-AWAC.dsl
$IASL $OCFOLDER/ACPI/SSDT-EC-USBX.aml $SRCACPI/SSDT-EC-USBX.dsl
$IASL $OCFOLDER/ACPI/SSDT-PLUG.aml $SRCACPI/SSDT-PLUG.dsl
$IASL $OCFOLDER/ACPI/SSDT-SBUS-MCHC.aml $SRCACPI/SSDT-SBUS-MCHC.dsl
$IASL $OCFOLDER/ACPI/SSDT-XOSI.aml $SRCACPI/SSDT-XOSI.dsl

# Copy UEFI Drivers
cp -R download/drivers/* $OCFOLDER/Drivers/

# Copy kexts
cp -R download/kexts/* $OCFOLDER/Kexts/
cp -R src/Kexts/* $OCFOLDER/Kexts/

# Copy OpenCore config
cp src/config.plist $OCFOLDER/config.plist

# Replace SMBIOS
. src/smbios.txt
sed -i "" -e "s/MLB_PLACEHOLDER/$MLB/" \
          -e "s/ROM_PLACEHOLDER/$ROM/" \
          -e "s/Serial_PLACEHOLDER/$SystemSerialNumber/" \
          -e "s/SmUUID_PLACEHOLDER/$SystemUUID/" $OCFOLDER/config.plist

# Remove unused UEFI Drivers
find $OCFOLDER/Drivers ! -name AudioDxe.efi \
                       ! -name HfsPlus.efi \
                       ! -name OpenRuntime.efi -type f -delete

# Remove unused UEFI Tools
find $OCFOLDER/Tools ! -name OpenShell.efi -type f -delete

# Copy UEFI tools
cp -R src/Tools/* $OCFOLDER/Tools/
