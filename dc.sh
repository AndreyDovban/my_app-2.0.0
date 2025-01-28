#!/usr/bin/bash

xhost + 

docker \
    run --interactive \
        --tty \
        --rm \
        --volume $(pwd):/opt \
        --volume /tmp/.X11-unix:/tmp/.X11-unix \
        --env=DISPLAY \
    freeipa:dc \
    bash 