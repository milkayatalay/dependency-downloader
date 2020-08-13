#!/bin/bash

echo "Enter package name for downloading with dependencies\n"

read packagename

mkdir $PWD/${packagename}

printf "\n Folder \"${packagename}\" created \n\n"

cd ${packagename}

apt-get download ${packagename} && apt-cache depends -i ${packagename} | awk '/Depends:/ {print $2}' | xargs  apt-get download

printf "\n Package \"${packagename}\" download complete.\n"