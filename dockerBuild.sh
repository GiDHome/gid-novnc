docker build --no-cache -t gid-novnc -f ./Dockerfile .
# echo "Remember to do this when ready:"
docker tag gid-novnc gidhome/gid-novnc:latest gidhome/gid-novnc:17.1.1d
docker push gidhome/gid-novnc:latest
docker push gidhome/gid-novnc:17.1.1d
