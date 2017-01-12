### docker开发环境,VNC,TensorFlow

编译: docker build -t imxood/centos_vnc_tensorflow:lasted .

配置端口映射5901:5901(vnc protocol),6901:6901(vnc web access):
docker run -d --name centos_vnc -p 5901:5901 -p 6901:6901 imxood/centos_vnc_tensorflow:lasted

改变默认的用户和组:--user $(id -u):$(id -g)
docker run -d --name centos_vnc -p 5901:5901 -p 6901:6901 --user $(id -u):$(id -g) imxood/centos_vnc_tensorflow:lasted

通过vnc viewer连接vnc:
connect via VNC viewer localhost:5901, default password: vncpassword

通过noVNC HTML5 client连接vnc:
http://localhost:6901/vnc_auto.html?password=vncpassword






关于vnc的配置来自:https://github.com/ConSol/docker-headless-vnc-container
