FROM fedora

# me needs man pages!!
RUN sed -i 's/^\s*tsflags=nodocs/#&/' /etc/dnf/dnf.conf

# install groups of packages
RUN dnf -y upgrade && \
    dnf install -y git vim-enhanced zsh tmux mlocate ncdu stow ranger util-linux-user sudo passwd openssh-server buildah wget && \
    dnf -y groupinstall "C Development Tools and Libraries" && \
    dnf clean all

RUN  useradd -u 1001 -G wheel -s /usr/bin/zsh andmalc \
    sed -i 's/^%wheel\s*ALL=(ALL)\s*ALL$/# &/; s/^#\s*\(%wheel\s*ALL=(ALL)\s*NOPASSWD:\s*ALL$\)/\1/' /etc/sudoers

# copy our dotfiles
COPY ./dotfiles/* /home/andmalc/

RUN chown -R andmalc:andmalc /home/andmalc

USER andmalc

WORKDIR /home/andmalc

CMD ["tmux", "-u"]
