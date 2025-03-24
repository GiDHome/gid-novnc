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
VERSION=17.1.3d
TARFILENAME=gid${VERSION}-linux-x64.tar.xz
# wget --progress=dot:mega https://www.gidhome.com/archive/GiD_Developer_Versions/Linux/amd64/${TARFILENAME}
# www.gidhome.com/archive has been moved (http code 302)
# adding '-L' so that curl follows the redirection
curl -L https://www.gidhome.com/archive/GiD_Developer_Versions/Linux/amd64/${TARFILENAME} -o ${TARFILENAME}
# curl -L https://www.gidhome.com/archive/GiD_Official_Versions/Linux/amd64/${TARFILENAME} -o ${TARFILENAME}

tar -Jxvf ${TARFILENAME}
rm ${TARFILENAME}
# rename folder to a 'common' name known by surpervisord.conf
mv gid${VERSION}-x64/* .

# Network licence
echo "# Floating.licence.server.ip" >> scripts/TemporalVariables
