from ubuntu

run apt-get update && apt-get install --no-install-recommends -y git python curl vim-nox rsync zsh tmux python-pip python-virtualenv openssh-server

# Setting openssh
RUN mkdir /var/run/sshd
RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config


### Setup home environment
run useradd -s /usr/bin/zsh andmalc

workdir /home/andmalc
run mkdir .ssh
copy files/andmalc /home/andmalc/.ssh/id_rsa
run cp /home/andmalc/.ssh/id_rsa /home/andmalc/.ssh/authorized_keys
run touch .ssh/known_hosts
run ssh-keyscan bitbucket.org > .ssh/known_hosts
run chown -R andmalc: /home/andmalc
run chmod 600 -R /home/andmalc/.ssh

user andmalc
run git clone git@bitbucket.org:andmalc/config.git
run git clone git@bitbucket.org:andmalc/work.git

# Link in shared parts of the home directory
run ln -s config/home/.ssh/config
run ln -s config/home/.ssh/andmalc.pub
run ln -s config/home/.vimrc
run ln -s config/home/.tmux.conf
run ln -s config/home/.zshrc
run ln -s config/home/.zshenv
run ln -s config/home/.gitconfig

user root
# Create a shared data volume
# We need to create an empty file, otherwise the volume will
# belong to root.
# This is probably a Docker bug.
run mkdir /var/shared/
run touch /var/shared/placeholder
run chown -R andmalc:andmalc /var/shared
volume /var/shared

EXPOSE 22
cmd ["/usr/sbin/sshd","-D"]

