#!/bin/sh
# ensure that the docker group-id matches on host and guest:
DOCKER_GID=$(getent group docker | cut -d: -f3)

cat <<EOF
# our environment in which we build our files

FROM dont.push.me/idea-factory/builder:$USER

# enable docker
RUN docker-apt-install docker.io
RUN sudo groupmod -g $DOCKER_GID docker
RUN sudo usermod -aG docker $USER

# smaller interactive tools
RUN docker-apt-install \
    tmux \
    vim \
    man \
    less \
    git \
    ssh \
    tree \
    python3.6
RUN curl https://bootstrap.pypa.io/get-pip.py | sudo python3.6
RUN sudo pip install awscli

CMD ["./docker/dev/tmux"]
EOF
