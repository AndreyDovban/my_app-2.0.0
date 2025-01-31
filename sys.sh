#!/usr/bin/bash

xhost + 

docker \
    run --interactive \
        --memory "8g" \
        --tty \
        --rm \
        --detach \
        --privileged \
        --network astra_net \
        --name dc01 \
        --hostname dc01.domain.test \
        --volume $(pwd):/opt \
        --volume /tmp/.X11-unix:/tmp/.X11-unix \
        --env=DISPLAY \
    freeipa:dc \
    systemd 