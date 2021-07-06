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
VERSION=15.1.1d
TARFILENAME=gid${VERSION}-linux-x64.tar.xz
# wget --progress=dot:mega https://www.gidhome.com/archive/GiD_Developer_Versions/Linux/amd64/${TARFILENAME}
curl https://www.gidhome.com/archive/GiD_Developer_Versions/Linux/amd64/${TARFILENAME} -o ${TARFILENAME}

tar -Jxvf ${TARFILENAME}
rm ${TARFILENAME}
# rename folder to a 'common' name known by surpervisord.conf
mv gid${VERSION}-x64/* .

# Network licence
echo "# Floating.licence.server.ip" >> scripts/TemporalVariables
