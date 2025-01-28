#!/usr/bin/bash

xhost + 

docker \
    run --interactive \
        --tty \
        --rm \
        --volume $(pwd):/opt \
        --volume /tmp/.X11-unix:/tmp/.X11-unix \
        --env=DISPLAY \
        --user=andrey \
    my_astra:1.7.6 \
    bash 