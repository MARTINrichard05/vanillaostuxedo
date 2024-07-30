#!/bin/bash
set -e

tuxedo_drivers_installed=false

for file in /deb-pkgs/*; do
    if [! -f "$file" ]; then
        continue
    fi

    extension=${file##*.}
    if [ "$extension"!= "deb" ]; then
        continue
    fi

    filename=${file##*/}
    if [[ $filename =~ ^tuxedo-drivers ]]; then
        if [ $tuxedo_drivers_installed = false ]; then
            echo "installing $file"
            apt-get install -y $file
            tuxedo_drivers_installed=true
        fi
    else
        if [ $tuxedo_drivers_installed = true ]; then
            echo "installing $file"
            apt-get install -y $file
        fi
    fi
done
