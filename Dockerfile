FROM ubuntu:14.04
ARG DEPENDENCY_BUSTER
ARG REPO_BUSTER
ARG REPO_URL=git://github.com/ariya/phantomjs.git
ARG SRC_DIR=phantomjs-src
ARG TAG=2.1.1
RUN echo $DEPENDENCY_BUSTER > /dev/null
RUN apt-get update -qq &&              \
    apt-get install -y build-essential \
    g++ flex bison gperf ruby perl     \
    libsqlite3-dev libfontconfig1-dev  \
    libicu-dev libfreetype6 libssl-dev \
    libpng-dev libjpeg-dev python      \
    libx11-dev libxext-dev git
RUN echo $REPO_BUSTER > /dev/null
RUN git clone $REPO_URL $SRC_DIR
WORKDIR $SRC_DIR
RUN git fetch --all &&       \
    git reset --hard $TAG && \
    git submodule init &&    \
    git submodule update
CMD python build.py
