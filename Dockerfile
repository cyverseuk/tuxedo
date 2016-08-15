FROM ubuntu:latest

RUN echo "deb http://archive.ubuntu.com/ubuntu" `lsb_release -a | grep Codename | awk '{print $2}'` "multiverse main" > /etc/apt/sources.list.d/archive.list
