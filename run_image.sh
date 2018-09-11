#!/bin/bash

# shell is zsh, as there is a bug on unset $USER in rcm
# https://github.com/thoughtbot/rcm/issues/165
docker run -i -t makohoek-dotfiles /bin/zsh
