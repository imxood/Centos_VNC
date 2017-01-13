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

ENV HOME /imxood
WORKDIR $HOME

### Envrionment config
ENV NO_VNC_HOME $HOME/noVNC
ENV VNC_COL_DEPTH 24
ENV VNC_RESOLUTION 1280x1024
ENV VNC_PW vncpassword

ADD ./src/common/install/ $INST_SCRIPTS/
ADD ./src/centos/install/ $INST_SCRIPTS/
RUN find $INST_SCRIPTS -name '*.sh' -exec chmod a+x {} +

### install common tools
RUN $INST_SCRIPTS/tools.sh

### install xvnc-server & noVNC - HTML5 based VNC viewer
RUN $INST_SCRIPTS/tigervnc.sh
RUN $INST_SCRIPTS/no_vnc.sh

### install chrome
RUN . $INST_SCRIPTS/chrome.sh

### Install xfce UI
RUN $INST_SCRIPTS/xfce_ui.sh
ADD ./src/common/xfce/ $HOME/

### configure startup
ADD ./src/common/scripts $HOME/scripts
RUN $INST_SCRIPTS/set_user_permission.sh

USER 1984

ENTRYPOINT ["scripts/vnc_startup.sh"]
CMD ["--tail-log"]