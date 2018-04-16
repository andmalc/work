#!/bin/bash -x

ctr1=`buildah from --name dev --volume /var/mnt/volume-tor1-01/home/andmalc:/home/andmalc:z  registry.fedoraproject.org/f27/fedora`

## Get all updates and install our minimal httpd server
buildah run $ctr1 -- dnf update -y
buildah run $ctr1 -- dnf install -y git vim-enhanced zsh tmux mlocate ncdu stow ranger util-linux-user sudo passwd openssh-server buildah 
buildah run $ctr1 -- dnf groupinstall -y 'C Development Tools and Libraries' 
buildah run $ctr1 -- useradd -G wheel -s /usr/bin/zsh andmalc 

## Include some buildtime annotations
#buildah config --annotation "com.example.build.host=$(uname -n)" $ctr1
buildah config  --port 8888 $ctr1

# copy ssh auth
#buildah copy --chown andmalc:andmalc ctr1 /var/roothome/.ssh /home/andmalc/.ssh
#buildah copy --chown andmalc:andmalc ctr1 /etc/ssh/*host* /etc/ssh

## Run our server and expose the port
#buildah config $ctr1 --cmd /usr/bin/zsh
buildah config $ctr1 --entrypoint '/usr/bin/sshd -D'

## Commit this container to an image n
buildah commit $ctr1 dev
buildah rm $ctr1
