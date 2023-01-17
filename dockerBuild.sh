docker build --no-cache -t gid-novnc --no-cache -f ./Dockerfile .
# echo "Remember to do this when ready:"
docker tag gid-novnc gidhome/gid-novnc:latest
docker push gidhome/gid-novnc:latest
