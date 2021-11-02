# http://www.florentflament.com/blog/git-ssh-docker-container.html
FROM ubuntu

RUN apt-get -y update && apt-get --no-install-recommends -y install openssh-server zsh

# Setting openssh
RUN mkdir /var/run/sshd
RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config

# Adding git user
RUN adduser andmalc
RUN mkdir -p /home/andmalc/.ssh
COPY files/andmalc /home/andmalc/.ssh/authorized_keys

# Updating shell to zsh
RUN sed -i s#/home/andmalc:/bin/bash#/home/andmalc:/user/bin/zsh# /etc/passwd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

