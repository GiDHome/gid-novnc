#!/bin/bash

gid_path="$1"
if [ "$gid_path" == "" ] ; then
   gid_path="/gid"
fi

echo gid_path="$gid_path"


mkdir "$gid_path"
cd "$gid_path"
# wget https://web.cimne.upc.edu/users/miguel/data/gid/gid14.0.2-linux-x64.tar.gz
# tar -zxvf gid14.0.2-linux-x64.tar.gz
# rm gid14.0.2-linux-x64.tar.gz
# cd gid14.0.2-x64
VERSION=16.1.0d
TARFILENAME=gid${VERSION}-linux-arm-x64.tar.xz

# TARFILENAME is in this same directory
if [ ! -f ${TARFILENAME} ] ; then
    echo "please copy ${TARFILENAME} in this same folder"
fi
tar -Jxvf ${TARFILENAME}
rm ${TARFILENAME}
# rename folder to a 'common' name known by surpervisord.conf
mv gid${VERSION}-x64/* .

# Network licence
echo "# Floating.licence.server.ip" >> scripts/TemporalVariables
