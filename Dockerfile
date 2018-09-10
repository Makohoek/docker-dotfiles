FROM ubuntu:16.04

# install all prerequisistes
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    curl \
    emacs \
    git \
    sudo \
    wget \
    vim \
    zsh \
    && rm -rf /var/lib/apt/lists/*

# create an user for testing
# P0eBBdkQ0Lpi6 is 'dottest' which has been generated with:
# openssl passwd -crypt 'dottest'
RUN useradd --create-home --password bON8jVW68.1Xo makohoek

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
