#!/bin/bash -x

ctr1=`buildah from  docker://docker.io/fedora:28`
#ctr1=`buildah from --name dev2 --volume /var/mnt/volume-tor1-01/home/andmalc:/home/andmalc:z  docker://registry.fedoraproject.org/f27/fedora`

#Man pages
buildah run $ctr1 -- sed -i 's/^\s*tsflags=nodocs/#&/' /etc/dnf/dnf.conf

buildah run $ctr1 -- dnf update -y
buildah run $ctr1 -- dnf install -y git vim-enhanced zsh tmux mlocate ncdu stow ranger util-linux-user sudo passwd openssh-server buildah 
buildah run $ctr1 -- dnf groupinstall -y 'C Development Tools and Libraries' 
buildah run $ctr1 -- dnf clean all


## Host
buildah config --hostname dev

buildah config  --port 8888 $ctr1

# User setup
buildah run $ctr1 -- useradd -u 1001 -G wheel -s /usr/bin/zsh andmalc 
buildah run $ctr1 -- sed -i 's/^%wheel\s*ALL=(ALL)\s*ALL$/# &/; s/^#\s*\(%wheel\s*ALL=(ALL)\s*NOPASSWD:\s*ALL$\)/\1/' /etc/sudoers

buildah config  --user andmalc $ctr1
buildah config  --workingdir /home/andmalc $ctr1

# buildah run $ctr1
# sshd todo
# generate sshd host key
# copy ssh auth

#buildah copy --chown andmalc:andmalc ctr1 /var/roothome/.ssh /home/andmalc/.ssh
#buildah copy --chown andmalc:andmalc ctr1 /etc/ssh/*host* /etc/ssh

## Run our server and expose the port
buildah config $ctr1 --cmd /usr/bin/zsh

## Commit this container to an image n
buildah commit $ctr1 fedora_dev
buildah rm $ctr1
