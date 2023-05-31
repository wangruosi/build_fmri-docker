FROM ubuntu:focal-20220826

# Set this before `apt-get` so that it can be done non-interactively
ENV DEBIAN_FRONTEND noninteractive

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

ARG PYVER=3.8

ENV PYVER=${PYVER}

RUN export PYSFX=`echo "$PYVER" | cut -c1-1` && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        gnupg \
        lsb-release \
        apt-utils \
        python$PYVER-dev \
        python$PYSFX \
        python$PYSFX-dev \
        python$PYSFX-distutils \
        build-essential && \
     rm -rf /var/lib/apt/lists/* && \
     ln -sf /usr/bin/python${PYVER} /usr/bin/python3 && \
     ln -sf /usr/bin/python${PYVER} /usr/bin/python

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

RUN curl -O https://raw.githubusercontent.com/ljchang/dartbrains/master/requirements.txt && \
    pip install -r requirements.txt
