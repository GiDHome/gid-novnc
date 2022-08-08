docker build -t gid-novnc --no-cache -f ./Dockerfile .
echo docker tag gid-novnc gidhome/gid-novnc:latest
echo docker push gidhome/gid-novnc:latest
