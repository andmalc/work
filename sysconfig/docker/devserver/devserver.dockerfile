
FROM bmpvieira/r-lang

RUN locale-gen en_US.UTF-8
RUN apt-get update; \
apt-get install --no-install-recommends -y aptitude zsh tmux vim-nox python-virtualenv python-pip r-base-core git
RUN useradd andmalc -s /usr/bin/zsh -u 1001 -g sudo -p g

workdir /home/andmalc
run mkdir .ssh
copy files/andmalc /home/andmalc.ssh
copy files/andmalc.pub /home/andmalc.ssh
run touch .ssh/known_hosts
run ssh-keyscan github.com > .ssh/known_hosts
run chown -R andmalc: /home/andmalc
run chmod 600 -R /home/andmalc/.ssh

user andmalc
run git clone git@github.com/andmalc/config.git

# Link in shared parts of the home directory
run ln -s config/home/.ssh/config
run ln -s config/home/.vimrc
run ln -s config/home/.tmux.conf
run ln -s config/home/.zshrc
run ln -s config/home/.zshenv
run ln -s config/home/.zlogin
run ln -s config/home/.gitconfig
run ln -s config/home/.ipython

EXPOSE 22
CMD /usr/sbin/sshd -D
