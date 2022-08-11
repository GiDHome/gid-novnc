docker build -t gid-arm-novnc -f Dockerfile.arm .
docker run -p 80:8083 -ti gid-arm-novnc
