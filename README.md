# GiD docker containers and services it provides

Main repository is https://github.com/GiDHome/gid-novnc 

    gid clone git@github.com:GiDHome/gid-novnc.git

# Build & Run docker containers

to build, tag and publish:

```shell
    docker build -t gid-novnc .
    ( fresh build ) docker build --no-cache -t gid-novnc .
    # test run:
    docker run -p 8083:8083 gid-novnc 
    # eventually add '--net=bridge -ti' before gid-novnc
    # to mount GiD Cloud folder, container needs to run with privileges:
    # https://stackoverflow.com/questions/48402218/fuse-inside-docker
    docker run -p 8083:8083 \
           --rm \
           --device /dev/fuse \
           --cap-add SYS_ADMIN \
           --security-opt apparmor:unconfined \
           gid-novnc
    # if it fails, try --privileged
    # publishing
    docker tag gid-novnc gidhome/gid-novnc:latest
    docker push gidhome/gid-novnc:latest
```

to download container (needs *docker login* and account in dockerhub)

    docker pull gidhome/gid-novnc:latest

to run:

    docker run -p 8083:8083 -ti gidhome/gid-novnc 

to run with persistent location (external $HOME/docker-gid-novnc-persistent-files will be mounted inside the image on /root/ExternalStorage):

    docker run -p 8083:8083 \
       --mount type=bind,source="$HOME"/docker-gid-novnc-persistent-files,target=/root/ExternalStorage \
       -ti gidhome/gid-novnc 
    
with an interactive shell:

    docker run -p 8083:8083 -ti gidhome/gid-novnc /bin/bash
    
on linux/windows:

    docker pull gidhome/gid-novnc:latest
    docker run -p 8083:8083 \
          -mount type=bind,source="$HOME"/docker-gid-novnc-persistent-files,target=/root/ExternalStorage \
          -ti gidhome/gid-novnc 

**to allow mounting gid cloud folders**

    docker run -p 8083:8083 -ti --device /dev/fuse --cap-add SYS_ADMIN --security-opt apparmor:unconfined gid-novnc
    
## with docker-composer

*docker-compose-home.yml*

    docker-compose -f docker-compose-home.yml up

Mounts folders `./data/home/.gid` and `./data/gid-storage` to preserve models and preferences between sessions.

An initial configuration through http://xxx:8083 may be required.

# Services

## Graphical interface in browser: port 8083
is the http://xxx:8083 vnc-like visualization of GiD application in a graphical environment
![gid-novnc on port 8083](images/gid-novnc-8083-480p.png "full GiD on a VNC http page")

## Try:
Open browser and connect to:
- Windows [http://192.168.99.100:8083](http://192.168.99.100:8083 "") *(on Windows, docker uses the ip 192.168.99.100 tipically, but check with 'docker-machine ip' to be sure)*
- Linux/macOS [http://localhost:8083](http://localhost:8083 "")
