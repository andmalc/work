from ubuntu:14.04

run apt-get update && apt-get install --no-install-recommends -y git python curl vim-nox rsync zsh tmux python-pip python-virtualenv ssh


# Setup home environment
run useradd -s /usr/bin/zsh andmalc
run mkdir /home/andmalc && chown -R andmalc: /home/andmalc
env HOME /home/andmalc

workdir /home/andmalc
run mkdir .ssh
copy andmalc /home/andmalc/.ssh/andmalc
copy sshconfig /home/andmalc/.ssh/config
run chmod 600 .ssh/andmalc
run chmod 600 .ssh/config
run touch .ssh/known_hosts
run ssh-keyscan bitbucket.org >> .ssh/known_hosts
run chown -R andmalc: .ssh

user andmalc
#run eval `ssh-agent`
#run ssh-add .ssh/andmalc

run git clone bb:andmalc/config.git
run git clone bb:andmalc/work.git

# Link in shared parts of the home directory
run ln -s config/home/.vimrc
run ln -s config/home/.tmux.conf
run ln -s config/home/.zshrc
run ln -s config/home/.zshenv
#run source .zshrc

#run pip install 

user root
# Create a shared data volume
# We need to create an empty file, otherwise the volume will
# belong to root.
# This is probably a Docker bug.
run mkdir /var/shared/
run touch /var/shared/placeholder
run chown -R andmalc:andmalc /var/shared
volume /var/shared

user andmalc
cmd ["/usr/bin/zsh"]

