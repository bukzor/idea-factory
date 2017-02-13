# our environment in which we build our files

FROM dont.push.me/idea-factory/base:$USER

# the very basics
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    tmux \
    vim \
    sudo \
&& true

# allow anyone to do whatever via sudo
RUN echo 'ALL ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

RUN mkdir /code
WORKDIR /code
