#!/bin/bash
set -e

# Install tuxedo-drivers package first
for file in /deb-pkgs/*; do
    if [! -f "$file" ]; then
        continue
    fi

    extension=${file##*.}
    if [ $extension!= "deb" ]; then
        continue
    fi

    filename=${file##*/}
    if [[ $filename =~ ^tuxedo-drivers ]]; then
        echo "installing $file"
        apt-get install -y $file
        continue 2
    fi
done

# Install remaining packages
for file in /deb-pkgs/*; do
    if [! -f "$file" ]; then
        continue
    fi

    extension=${file##*.}
    if [ $extension!= "deb" ]; then
        continue
    fi

    filename=${file##*/}
    if [[ $filename =~ ^tuxedo-drivers ]]; then
        continue
    fi

    echo "installing $file"
    apt-get install -y $file
done
