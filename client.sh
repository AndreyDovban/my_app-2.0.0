#!/usr/bin/bash

xhost + 

docker \
    run --interactive \
        --tty \
        --rm \
        --network astra_net \
        --name client \
        --hostname client.domain.test \
        --volume $(pwd):/opt \
        --volume /tmp/.X11-unix:/tmp/.X11-unix \
        --env=DISPLAY \
    freeipa:dc \
    bash 