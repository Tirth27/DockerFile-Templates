# Refered 
# https://forums.docker.com/t/ssh-from-one-containe-to-another-container/65906/8
# https://stackoverflow.com/questions/53984274/ssh-from-one-container-to-another-container

FROM ubuntu:16.04


# RESET root user password to root. 
# https://unix.stackexchange.com/a/197451/511221
# echo 'username:newpassword' | chpasswd

# To view Root user password
# https://www.techrepublic.com/article/how-to-change-a-root-password-in-a-docker-image/
# cat /etc/shadow | grep USERNAME
# cat /etc/shadow | grep root

RUN apt-get update && \
apt-get install -y netcat ssh iputils-ping nano && \
mkdir /var/run/sshd && \
chmod 0755 /var/run/sshd && \
echo 'root:root' | chpasswd && \
useradd -p $(openssl passwd -1 u2password) --create-home --shell /bin/bash --groups sudo u2

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]