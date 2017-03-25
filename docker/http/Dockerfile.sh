#!/bin/sh
cat <<EOF
# our environment in which we build our files

FROM dont.push.me/idea-factory/base:$USER

RUN docker-apt-install \
    python3.6 \
    gunicorn3

EXPOSE 8000

VOLUME tmp /tmp
ADD build /opt/code
CMD ["gunicorn3", "--workers=4", "--bind=0.0.0.0:8000", "myapp:app"]
EOF
