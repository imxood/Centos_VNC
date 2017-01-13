# This Dockerfile is used to build an headles vnc image based on Centos

FROM centos:7

MAINTAINER imxood "imxood@gmail.com"

## Connection ports for controlling the UI:
# VNC port:5901
# noVNC webport, connect via http://IP:6901/vnc_auto.html?password=vncpassword
ENV DISPLAY :1
ENV VNC_PORT 5901
ENV NO_VNC_PORT 6901
EXPOSE $VNC_PORT $NO_VNC_PORT

#工作目录
ENV HOME /imxood
WORKDIR $HOME

#安装常用的工具
RUN yum -y install epel-release \
    && yum -y update \
    && yum -y install vim sudo wget which net-tools \
    && yum clean all