# our environment in which we build our files

FROM ubuntu:xenial

# the very basics
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    apt-transport-https \
&& true

# any non-default deb repositories:
RUN wget -O- https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list && \
    apt-get update \
&& true

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    nodejs \
    yarn \
&& true

RUN mkdir /code
WORKDIR /code
