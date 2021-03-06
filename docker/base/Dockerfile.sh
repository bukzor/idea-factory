#!/bin/sh
UID=$(id -u)
GID=$(id -u)
TZ=$(cat /etc/timezone)

cat <<EOF
# our environment in which we build our files

FROM ubuntu:yakkety

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sudo \
    curl

# add a docker-apt-install command so 
# we don't have to type that stuff over and over
ADD image /

# our default low-privilege user is named "$USER"
# $USER has no password and can use sudo
# also, $USER has the same uid and gid as the host user
# this prevents problems with file permissions on the host system
RUN groupadd --force -g $GID $USER
RUN useradd \
        -u $UID \
        -g $GID \
        -d /home/$USER \
        -s /bin/bash \
        -p '' \
        -G sudo \
        $USER
USER $USER
WORKDIR /opt/code

# allow to use sudo within tmux
# see: <gist.github.com/ciastek/d496ac00ad68f5367db7>
RUN sed -i s/nullok_secure/nullok/ /etc/pam.d/common-auth

# hint 256-color support
ENV TERM=xterm-256color

# set up appropriate locale
ENV LANG=en_US.UTF-8
RUN sudo /usr/sbin/locale-gen en_US.UTF-8
RUN sudo ln -sf /usr/share/zoneinfo/$TZ /etc/localtime
RUN sudo echo $TZ > /etc/timezone

# ensure that all commands get a full login environment
ENTRYPOINT ["login-env"]
EOF
