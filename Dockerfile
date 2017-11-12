FROM ubuntu:16.04

WORKDIR /root

RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    python-software-properties \
    git \
    sudo \
    pkg-config \
    python-dev

RUN git clone https://github.com/kevinjmcmanamon/.vim
RUN cd .vim && ./setup.sh --all
RUN echo "set encoding=utf-8" >> ~/.vimrc

CMD bash
