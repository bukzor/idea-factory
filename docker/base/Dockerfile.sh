#!/bin/sh
UID=$(id -u)
GID=$(id -u)

cat <<EOF
# our environment in which we build our files

FROM ubuntu:xenial

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sudo \
    curl

# add a docker-apt-install command so 
# we don't have to type that stuff over and over
ADD image /

# our default low-privilege user is named "coder"
# coder has no password and can use sudo
# also, coder has the same uid and gid as the host user
# this prevents problems with file permissions on the host system
RUN groupadd --force -g $GID coder
RUN useradd \
        -u $UID \
        -g $GID \
        -d /home/coder \
        -s /bin/bash \
        -p '' \
        -G sudo \
        coder
USER coder

# hint 256-color support
ENV TERM=xterm-256color

# set up appropriate locale
ENV LANG=en_US.UTF-8
RUN sudo /usr/sbin/locale-gen en_US.UTF-8

# ensure that all commands get a full login environment
ENTRYPOINT ["bash", "-lc", "exec \\"\$@\\"", "-bash"]
EOF
