docker build --no-cache -t gid-arm-centos-novnc -f Dockerfile.arm.centos .
docker run -p 8083:8083 -ti gid-arm-centos-novnc
# docker tag gid-arm-novnc gidhome/gid-arm-novnc:latest gidhome/gid-arm-novnc:17.1.1d
# docker push gidhome/gid-arm-novnc:latest
