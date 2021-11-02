#!/usr/bin/env fish

#set toolbox_url andmalc-toolbox
set toolbox_url registry.fedoraproject.org/f29/fedora-toolbox 
set toolbox_image_name toolbox
set container_name toolbox_build
set USER andmalc


set container (buildah from --name $container_name $toolbox_url)
buildah run $container -- dnf --refresh update -y
buildah run $container -- dnf -y install vim fzf fish

buildah run $container -- useradd \
                 --home-dir $HOME \
                 --no-create-home \
                 --shell /usr/bin/fish \
                 --uid $UID \
                 --groups wheel \
                 $USER \

buildah config \
    --user 1001 \
    --hostname toolbox \
    --entrypoint /usr/bin/bash \
    --security-opt label=disable \
    --uidmap $UID:0:1 \
    --uidmap 0:1:$UID \
    # --uidmap $uid_plus_one:$uid_plus_one:$max_minus_uid \
    --volume $HOME:$HOME:rslave \
    --volume $XDG_RUNTIME_DIR:$XDG_RUNTIME_DIR \
     $container 

buildah commit $container $toolbox_image_name

#buildah rm $container   
