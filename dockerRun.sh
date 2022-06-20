echo "To be used in CIMNE: GiD in this docker has a floating licence"
docker run -p 8083:8083 -ti gid-novnc "$@"
# to allow GiD cloud mounting:
echo docker run -p 8083:8083 -ti --device /dev/fuse --cap-add SYS_ADMIN --security-opt apparmor:unconfined gid-novnc
echo docker pull pasenau/gid-novnc:latest
echo docker run -p 8083:8083 \
    --mount type=bind,source="$HOME"/docker-gid-novnc-persistent-files,target=/root/ExternalStorage \
    -ti pasenau/gid-novnc
echo docker run -p 8083:8083 -ti pasenau/gid-novnc:latest /bin/bash
