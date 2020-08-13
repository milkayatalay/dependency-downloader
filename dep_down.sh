#!/bin/bash

echo $#
if [[ "$#" == "0" ]]
    then
        echo $1 
        printf "Enter package name for downloading with dependencies \n "
        read packagename
else
    packagename=${1}
fi

mkdir $PWD/${packagename}

printf "\n Folder \"${packagename}\" created \n\n"

cd ${packagename}

apt-get download ${packagename} && apt-cache depends -i ${packagename} | awk '/Depends:/ {print $2}' | xargs  apt-get download

printf "\n Package \"${packagename}\" download complete.\n"
