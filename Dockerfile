FROM ubuntu:16.04

# install all prerequisistes
RUN apt-get update && apt-get install -y \
    emacs \
    git \
    sudo \
    vim \
    zsh \
    && rm -rf /var/lib/apt/lists/*
