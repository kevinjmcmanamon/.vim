FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y software-properties-common python-software-properties git

RUN cd /root && git clone https://github.com/kevinjmcmanamon/.vim
RUN /root/.vim/setup.sh --all
RUN echo "set encoding=utf-8" >> /root/.vimrc

CMD echo hello
