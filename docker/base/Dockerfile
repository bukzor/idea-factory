# our environment in which we build our files

FROM ubuntu:xenial
ARG UID
ARG GID

# the very basics
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sudo \
&& true


ADD image /
RUN true \
    && groupadd --force -g $GID coder \
    && useradd \
        -u $UID \
        -g $GID \
        -d /opt/code \
        -s /bin/bash \
        coder \
    && echo 'coder ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
&& true

USER coder
CMD ["sudo", "-iu", "coder"]
