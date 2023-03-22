# -*- dockerfile -*-

FROM ubuntu:20.04
LABEL version="16.1.4d"
LABEL org.opencontainers.image.authors="gid@gid.cimne.upc.edu"
LABEL description="GiD and NoVNC (an HTML VNC client) on port 8083 on ubuntu"

# Set correct environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
# ENV LANG en_US.UTF-8
# ENV LANGUAGE en_US.UTF-8
# to use en_US.UTF-8 folowwing is needed:
# RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
#    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV TZ=Europe/Madrid
ENV SCREEN_RESOLUTION 1280x800

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Installing apps (Note: git is here just in case noVNC needs it in launch.sh
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y
RUN apt-get -y install \
        binutils \
        curl \
        dos2unix \
        fluxbox \
        fuse \
        git \
        git-core \
        libglu1-mesa \
        libharfbuzz0b \
        liblzma5 \
        libnss3 \
        lzma \
        supervisor \
        x11vnc \
        xvfb \
        xz-utils \
        zip

# fuse is needed by wdfs to mount gid cloud folder

#	wget 
#	curl
#	net-tools
#	x11-xserver-utils
# x11-server-utils to install  xrandr
# x11-utils        to install  xdpyinfo

# House cleaning
RUN apt-get autoclean

# Docker's supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY install_gid.sh /root/install_gid.sh
COPY create-basic-preferences.sh /root/create-basic-preferences.sh
RUN dos2unix /etc/supervisor/conf.d/supervisord.conf
RUN dos2unix /root/install_gid.sh
RUN dos2unix /root/create-basic-preferences.sh

# supervisord.conf launches "/gid/gid -t ::gid_rest::server::start"
# dst_path = /gid

WORKDIR /root/
RUN chmod 755 ./install_gid.sh && \
    ./install_gid.sh /gid
RUN chmod 755 ./create-basic-preferences.sh && \
    ./create-basic-preferences.sh /gid

# Set display
ENV DISPLAY :0

# Change work directory to add novnc files
WORKDIR /root/
# ADD noVNC-0.6.2 /root/novnc/
# RUN ln -s /root/novnc/vnc_auto.html /root/novnc/index.html 
ADD noVNC-1.1.0 /root/novnc/
# line ending conversions, if build host is windows....
RUN zip -r novnc.zip novnc && \
        unzip -ao novnc.zip && \
        rm novnc.zip
RUN ln -s /root/novnc/vnc_lite.html /root/novnc/index.html 

# Expose Port (Note: if you change it do it as well in surpervisord.conf)
# **port 8083** is the http://xxx:8083 vnc-like visualization of GiD application in a graphical environment
# **port 15818** is the http:// image-server of GiD
# **port 6900** is GiD's own communication protocol to enable gid-client <----> gid-server communication
EXPOSE 8083 15818 6900

CMD ["/usr/bin/supervisord"]
