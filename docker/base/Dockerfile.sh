#!/bin/sh
UID=$(id -u)
GID=$(id -u)

cat <<EOF
# our environment in which we build our files

FROM ubuntu:xenial

# the very basics
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sudo \
&& true

# hint 256-color support
ENV TERM=xterm-256color

# set up appropriate locale
RUN     /usr/sbin/locale-gen en_US.UTF-8
ENV     LANG en_US.UTF-8

RUN true \
    && groupadd --force -g $GID coder \
    && useradd \
        -u $UID \
        -g $GID \
        -d /home/coder \
        -s /bin/bash \
        coder \
    && echo 'coder ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
&& true

USER coder

ENTRYPOINT ["bash", "-lc", "exec \\"\$@\\"", "-bash"]
EOF
