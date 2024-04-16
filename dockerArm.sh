docker build --no-cache -t gid-arm-novnc -f Dockerfile.arm .
docker run -p 8083:8083 -ti gid-arm-novnc
# docker tag gid-arm-novnc gidhome/gid-arm-novnc:latest
# docker push gidhome/gid-arm-novnc:latest
