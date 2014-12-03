
FROM bmpvieira/r-lang

RUN apt-get update; \
apt-get install --no-install-recommends aptitude zsh tmux vim-nox virtualenv r-base-core
RUN adduser andmalc --shell /usr/bin/zsh

EXPOSE 22
CMD /usr/sbin/sshd -D
