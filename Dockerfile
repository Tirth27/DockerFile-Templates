FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y netcat ssh iputils-ping
EXPOSE 22