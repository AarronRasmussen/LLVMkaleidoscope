FROM ubuntu:latest

LABEL MAINTAINER="aarron rasmussen arasmussen96@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /usr/local/src/compiler_src

RUN apt-get update && apt-get install -y \
    vim \
    make \
    g++ \
    valgrind \
    flex \
    bison

COPY ../src /usr/local/src/compiler_src