docker build --no-cache -t gid-arm-novnc -f Dockerfile.arm .
docker run -p 8083:8083 -ti gid-arm-novnc
# docker tag gid-arm-novnc gidhome/gid-arm-novnc:latest gidhome/gid-arm-novnc:17.1.3d
# docker push gidhome/gid-arm-novnc:latest
# echo "add ' -v /home/ubuntu/GID-git/Examples-test:/gid/Examples-test ' to mount some examples into docker image."
