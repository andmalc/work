# Run image with:
# docker run -d -p 42222:22 --name mydevcontainer -h devhost -v <path to home dir>:<path to dir in container> <image name> 

# Run IPython Notebook with
# ipython3 notebook --no-browser --ip=0.0.0.0

FROM debian:jessie

ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get update \
            --quiet && \
  apt-get install \ 
            --yes \
            --no-install-recommends \
            --no-install-suggests \
		  aptitude \
		  locales \
          build-essential \
		  openssh-server \
		  sudo \
		  vim-nox \
          wget  \
		  less \
		  zsh \
		  git \
		  tmux 

# Locale fix
RUN bash -c 'echo "en_US.UTF-8 UTF-8"' > /etc/locale.gen
RUN locale-gen

# SSH server
RUN mkdir /var/run/sshd
RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config

## User setup
run mkdir /root/.ssh
copy files/andmalc.pub /root/.ssh/authorized_keys
# Password: openssl passwd -crypt <password>
RUN useradd andmalc -s /usr/bin/zsh -u 1001 -G sudo -p USL6ONhp7OB6Y

# For Data Science Course
# Install with Recommends and Suggests or matplotlilb won't build
RUN \
	apt-get install \ 
		--yes \
		r-base \
		python3.4 \
		python3.4-dev \
		python3-pip \
		python3-numpy \
		pkg-config \
		ipython3 \
		ipython3-notebook \
		# required by matplotlib
		libfreetype6 \
		libfreetype6-dev && \
	apt-get clean 

# For newest Pandas
RUN pip3 install pandas virtualenvwrapper

EXPOSE 22 8888
CMD /usr/sbin/sshd -D
