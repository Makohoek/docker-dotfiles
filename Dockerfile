FROM ubuntu:16.04

# install all prerequisistes
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    emacs \
    git \
    sudo \
    wget \
    vim \
    zsh \
    && rm -rf /var/lib/apt/lists/*

# create an user for testing
# oz3uhIS2sP3tE is 'dotfiles' which has been generated with:
# openssl passwd -crypt 'dotfiles'
# shell is zsh, as there is a bug on unset $USER in rcm
# https://github.com/thoughtbot/rcm/issues/165
RUN useradd --create-home --password oz3uhIS2sP3tE makohoek --shell /bin/zsh

# add that user to the sudoers group
RUN usermod --append -G sudo makohoek

# add the extra thoughbot repo, for rcm
# documented here: https://github.com/thoughtbot/rcm#installation
RUN wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | apt-key add - && \
    echo "deb https://apt.thoughtbot.com/debian/ stable main" | \
         tee /etc/apt/sources.list.d/thoughtbot.list && \
    apt-get update && \
    apt-get install -y rcm

USER makohoek
