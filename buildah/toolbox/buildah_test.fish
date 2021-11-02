#!/usr/bin/env fish

set toolbox_url andmalc-toolbox
#set toolbox_url registry.fedoraproject.org/f29/fedora-toolbox 

set container (buildah from $toolbox_url)

buildah run $container -- dnf --refresh update -y
buildah run $container -- dnf -y install vim fzf 

buildah config --user 1001 
    \--hostname toolbox 
    \$container 


$prefix_sudo podman create \
            --group-add wheel \
            --interactive \
            --name $toolbox_container \
            --network host \
            --privileged \
            --security-opt label=disable \
            --tmpfs /dev/shm:size=$tmpfs_size \
            --tty \
            --uidmap $UID:0:1 \
            --uidmap 0:1:$UID \
            --uidmap $uid_plus_one:$uid_plus_one:$max_minus_uid \
            --volume $HOME:$HOME:rslave \
            --volume $XDG_RUNTIME_DIR:$XDG_RUNTIME_DIR \
            --volume $dbus_system_bus_path:$dbus_system_bus_path \
            --volume /dev/dri:/dev/dri \
            --volume /dev/fuse:/dev/fuse \
            $toolbox_image \

buildah commit $container andmalc-toolbox

buildah rm $container   
