
FROM bmpvieira/r-lang

RUN locale-gen en_US.UTF-8
RUN apt-get update; \
apt-get install --no-install-recommends -y aptitude zsh tmux vim-nox python-virtualenv python-pip r-base-core git
RUN useradd andmalc -s /usr/bin/zsh -u 1001 -g sudo -p g


EXPOSE 22
CMD /usr/sbin/sshd -D
