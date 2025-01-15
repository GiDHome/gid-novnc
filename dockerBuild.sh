docker build --no-cache -t gid-novnc -f ./Dockerfile .
# echo "Remember to do this when ready:"
docker tag gid-novnc gidhome/gid-novnc:latest 
docker tag gid-novnc gidhome/gid-novnc:17.1.2d
docker push gidhome/gid-novnc:latest
docker push gidhome/gid-novnc:17.1.2d
