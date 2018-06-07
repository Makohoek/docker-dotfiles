FROM ubuntu:16.04

# install all prerequisistes
RUN apt-get update && apt-get install -y \
    curl \
    emacs \
    git \
    sudo \
    vim \
    zsh \
    && rm -rf /var/lib/apt/lists/*

# create an user for testing
# P0eBBdkQ0Lpi6 is 'dottest' which has been generated with:
# openssl passwd -crypt 'dottest'
RUN useradd --create-home --password bON8jVW68.1Xo makohoek

# add that user to the sudoers group
RUN usermod --append -G sudo makohoek

USER makohoek
# download and install the setup script
RUN cd ~/ && curl -Lks https://raw.githubusercontent.com/Makohoek/dotfiles/master/setup.sh | /bin/bash
