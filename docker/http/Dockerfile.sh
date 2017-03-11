#!/bin/sh
cat <<EOF
# our environment in which we build our files

FROM dont.push.me/idea-factory/base:$USER

RUN docker-apt-install \
    python3.5

EXPOSE 8000
CMD ["python3.5", "-m", "http.server", "8000"]
EOF
