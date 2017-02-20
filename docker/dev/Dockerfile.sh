#!/bin/sh
cat <<EOF
# our environment in which we build our files

FROM dont.push.me/idea-factory/builder:$USER

# enable docker
RUN docker-apt-install docker.io
RUN sudo usermod -aG docker coder

# smaller interactive tools
RUN docker-apt-install \
    tmux \
    vim \
    man \
    less \
    git \
    ssh \
    tree \
    python3-pip \
    python3-setuptools
RUN sudo pip3 install awscli

CMD ["tmux", "-2"]
EOF
