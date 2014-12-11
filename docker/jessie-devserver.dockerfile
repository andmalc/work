FROM debian:jessie

MAINTAINER Ozzy Johnson <ozzy.johnson@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Update and install minimal.
RUN \
  apt-get update \
            --quiet && \
  apt-get install \ 
            --yes \
            --no-install-recommends \
            --no-install-suggests \
          build-essential \
		  openssh-server \
		  sudo \
		  aptitude \
		  vim-nox \
          r-base \
		  zsh \
		  tmux \
		  python3.4 \
		  python3.4-dev \
		  python3-pip \
          wget && \
# Clean up packages.
  apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# SSH server
RUN mkdir /var/run/sshd
RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config

# Get R benchmark.
#RUN wget \
#      http://r.research.att.com/benchmarks/R-benchmark-25.R \
#      -P /data

# User setup
run mkdir /root/.ssh
copy files/andmalc.pub /root/.ssh/authorized_keys

# Password: openssl passwd -crypt <password>
# Encrypted password is for 'g'
RUN useradd andmalc -s /usr/bin/zsh -u 1001 -G sudo -p USL6ONhp7OB6Y

# Data volume.
#ONBUILD ["/data"]

# Get ready to run.
#WORKDIR /data

# Default command.
#ENTRYPOINT ["bash", "R"]

EXPOSE 22
CMD /usr/sbin/sshd -D
